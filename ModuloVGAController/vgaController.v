// Controlador VGA considerando uma tela de 640 x 480 a 60Hz.

module vgaController(
	// Reader
	input  [7:0] inRed, inGreen, inBlue,
	input        fifo_full,
	// Saídas de posição e controle
	output [9:0] outX, outY,
	output outRequest, preRequest,

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
	assign preRequest = ((hCount >= hBlank - 2) && (hCount < hTotal - 2) &&
                       (vCount >= vBlank) && (vCount < vTotal));
	// Posicao.
	assign outX = (hCount >= hBlank) ? hCount - hBlank : 9'h0;
	assign outY = (vCount >= vBlank) ? vCount - vBlank : 9'h0;

	// VGA Outputs
	assign outRed   = outRequest ? inRed   : 8'hFF;	
	assign outGreen = outRequest ? inGreen : 8'hFF;
	assign outBlue  = outRequest ? inBlue  : 8'h00;
	
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
	always @(posedge clk25) begin // Horizontal.
		if(!rstN) begin
			hCount <=	0;
			hs		 <=	1;
		end
		else begin
			if(started) begin
				// Contando.
				if (hCount < hTotal)
					hCount <= hCount + 1'b1; 				// Continua incrementando.
				else
					hCount <= 0;								// Reinicia contagem.
				// Sincronismo.
				if (hCount == hFront - 1) 					// hCount == 15.
					hs <= 1'b0; 								// Habilitado em nivel logico baixo.
				if (hCount == hFront + hSync - 1) 		// hCount == 95.
					hs <= 1'b1;
			end
		end
		
	end

	always @(posedge hs) begin // Vertical: Dependente do sync horizontal.
		if(!rstN) begin
			vCount <=	0;
			vs		 <=	1;
		end
		else begin
			// Contando.
			if (vCount < vTotal)
				vCount <= vCount + 1'b1;
			else
				vCount <= 0;
			// Sincronismo.
			if (vCount == vFront - 1)
				vs <= 1'b0;								// Habilitado em nivel logico baixo.
			if (vCount == vFront + vSync - 1)
				vs <= 1'b1;
		end
	end
endmodule
