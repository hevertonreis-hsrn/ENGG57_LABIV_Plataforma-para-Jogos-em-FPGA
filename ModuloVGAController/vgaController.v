// Controlador VGA considerando uma tela de 640 x 480 a 60Hz.

module vgaController(
	// FIFO Interface
	input  [31:0] fifo_data,       // Dados vindos do FIFO
	input         fifo_empty,      // FIFO está vazio?
	input					fifo_full,
	output reg    fifo_rd_en,      // Solicita leitura do próximo dado do FIFO

	// Saídas de posição e controle
	output [9:0] outX, outY,
	output outRequest,

	// VGA DAC.
	output [7:0] outRed, outGreen, outBlue,	 // Saidas das cores.	
	output reg hs, vs,									     // Sinais de sincronismo.     											
	output vgaClk, vgaBlankN, vgaSyncN,			 // Outros.

	// Sinais de Controle.
	input clk25, rstN
	);
	
	// Registradores Internos.
	reg        started;
	reg  [9:0] hCount, vCount;
	wire 			 preRequest;
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Parametros Horizontais.
	parameter hFront   = 16;
	parameter hSync    = 96;
	parameter hBack    = 48;
	parameter hDisplay = 640;
	parameter hBlank = hFront + hSync + hBack;					// 16 + 96 + 48 = 160.
	parameter hTotal = hFront + hSync + hBack + hDisplay; 	// 160 + 640 	 = 800.

	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Parametros Verticais.
	parameter vFront   = 10;											// Exemplo Terasic (DE2_115_TV) usa 11.
	parameter vSync    = 2;
	parameter vBack    = 33;											// Exemplo Terasic (DE2_115_TV) usa 31.
	parameter vDisplay = 480;
	parameter vBlank = vFront + vSync + vBack;					// 10 + 2 + 33 = 45.
	parameter vTotal = vFront + vSync + vBack + vDisplay;		// 45 + 480 	= 525.

	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Outras Saidas.
	assign vgaSyncN = 1'b1; 														// Pode ser ignorado.
	assign vgaClk = ~clk25;
	assign vgaBlankN = ~((hCount < hBlank) || (vCount < vBlank));
	assign outRequest = ((hCount >= hBlank) && (hCount < hTotal) && ((vCount >= vBlank) && (vCount < vTotal)));
	assign preRequest = ((hCount >= hBlank - 1) && (hCount < hTotal - 1) &&
                       (vCount >= vBlank) && (vCount < vTotal));
	// Posicao.
	assign outX = (hCount >= hBlank) ? hCount - hBlank : 9'h0;
	assign outY = (vCount >= vBlank) ? vCount - vBlank : 9'h0;
	
	// FIFO Pipeline
	reg [31:0] current_pixel;

	// VGA Outputs
	assign outRed   = current_pixel[23:16];
	assign outGreen = current_pixel[15:8];
	assign outBlue  = current_pixel[7:0];
	
	// init
	always @(posedge clk25 or negedge rstN) begin
		if (!rstN) begin
			started <= 0;
		end else if (!started && fifo_full) begin
			started <= 1; // Libera a contagem
		end
	end
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Contagem e Sincronismo. FRONT > SYNC > BACK > DISPLAY > FRONT > ...
	always @(posedge clk25 or negedge rstN) begin
		if (!rstN) begin
			hCount <= 0;
			vCount <= 0;
			hs     <= 1;
			vs     <= 1;
		end else begin
			if (started) begin
				// Horizontal
				if (hCount < hTotal)
					hCount <= hCount + 1'b1;
				else
					hCount <= 0;

				// Gerar hs
				if (hCount == hFront - 1)
					hs <= 0;
				else if (hCount == hFront + hSync - 1) begin
					hs <= 1;
					// Contando.
					if (vCount < vTotal)
						vCount <= vCount + 1'b1;
					else
						vCount <= 0;
					// Gerar vs
					if (vCount == vFront - 1)
						vs <= 0;
					else if (vCount == vFront + vSync - 1)
						vs <= 1;
				end
			end
		end
	end
	
	// Leitura do FIFO com pipeline de 1 ciclo
	always @(posedge clk25 or negedge rstN) begin
		if (!rstN) begin
			current_pixel <= 32'h0;
			fifo_rd_en    <= 0;
		end else begin
			if (started) begin
				fifo_rd_en <= 0;

				if (preRequest && !fifo_empty) begin
					fifo_rd_en <= 1;  // Ativa leitura do FIFO antes de outRequest
				end

				if (outRequest) begin
					current_pixel <= fifo_data;  // Usa o dado lido 1 ciclo antes
				end
			end
		end
	end
endmodule
