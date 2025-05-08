// Controlador VGA considerando uma tela de 640 x 480 a 60Hz.

module vgaController(
	// Buffer.
	input  [7:0] inRed, inGreen, inBlue,
	output [9:0] outX, outY,
	output outRequest,  

	// VGA DAC.
	output [7:0] outRed, outGreen, outBlue,		// Saidas das cores.	
	output reg hs, vs,									// Sinais de sincronismo.     											
	output vgaClk, vgaBlankN, vgaSyncN,				// Outros.

	// Sinais de Controle.
	input clk25, rstN
	);
	
	// Registradores Internos.
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
	// Posicao.
	assign outX = (hCount >= hBlank) ? hCount - hBlank : 9'h0;
	assign outY = (vCount >= vBlank) ? vCount - vBlank : 9'h0;
	// Cores.
	assign outRed   = inRed;
	assign outGreen = inGreen;
	assign outBlue  = inBlue;
	//assign outRed   = outRequest ? 8'hFF : 8'hFF;
	//assign outGreen = outRequest ? 8'h00 : 8'hFF;
	//assign outBlue  = outRequest ? 8'hFF : 8'h00;

	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Contagem e Sincronismo. FRONT > SYNC > BACK > DISPLAY > FRONT > ...
	always @(posedge clk25) begin
		if (!rstN) begin
			hCount <= 0;
			vCount <= 0;
			hs     <= 1;
			vs     <= 1;
		end else begin
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
	
//	always @(posedge clk25) begin // Horizontal.
//		if(!rstN) begin
//			hCount <=	0;
//			hs		 <=	1;
//		end
//		else begin
//			// Contando.
//			if (hCount < hTotal)
//				hCount <= hCount + 1'b1; 				// Continua incrementando.
//			else
//				hCount <= 0;								// Reinicia contagem.
//			// Sincronismo.
//			if (hCount == hFront - 1) 					// hCount == 15.
//				hs <= 1'b0; 								// Habilitado em nivel logico baixo.
//			if (hCount == hFront + hSync - 1) 		// hCount == 95.
//				hs <= 1'b1;
//		end
//		
//	end
//
//	always @(posedge hs) begin // Vertical: Dependente do sync horizontal.
//		if(!rstN) begin
//			vCount <=	0;
//			vs		 <=	1;
//		end
//		else begin
//			// Contando.
//			if (vCount < vTotal)
//				vCount <= vCount + 1'b1;
//			else
//				vCount <= 0;
//			// Sincronismo.
//			if (vCount == vFront - 1)
//				vs <= 1'b0;								// Habilitado em nivel logico baixo.
//			if (vCount == vFront + vSync - 1)
//				vs <= 1'b1;
//		end
//	end

endmodule
