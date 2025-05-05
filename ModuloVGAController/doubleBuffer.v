module doubleBuffer(
	input clk,
	input readEnable,
	input writeEnable,
	input [7:0] inRed, inGreen, inBlue,
	output reg [7:0] outRed, outGreen, outBlue
	);
	
	// Parametros
	parameter numPixels = 16;
	
	// Definindo Buffers.
	reg [23:0] bufferA [numPixels - 1:0]; // Cada posição: 8 bits R + 8 bits G + 8 bits B
	reg [23:0] bufferB [numPixels - 1:0];
	
	reg activeBuffer = 0; 		// Indica qual buffer esta ativo para leitura.
	reg [3:0] readIdx = 0; 		// Contagem de pixel processado na leitura.
	reg [3:0] writeIdx = 0;		// Similar para a escrita.

	
	wire clk25MHz;
	reg reset = 0;
	clockDivider pll (.clk(clk), .reset(reset), .clk_out(clk25MHz));  // Clock de saída dividido por 2
	
	// Inicializa buffers para teste.
	//initial begin
	//	 integer i;
	//	 for (i = 0; i < numPixels; i = i + 1) begin
	//		  bufferA[i] = {8'hFF, 8'h00, 8'h00}; // Vermelho
	//		  bufferB[i] = {8'h00, 8'h00, 8'hFF}; // Azul
	//	 end
	//end
	
	// Leitura VGA Controller.
	always @(posedge clk25MHz) begin
		
		if(readEnable) begin // Envia o proximo pixel
			if (activeBuffer == 0) begin
				{outRed, outGreen, outBlue} <= bufferA[readIdx];
			end
			else begin
				{outRed, outGreen, outBlue} <= bufferB[readIdx];
			end
			
			// Incrementa ou reseta indice.
			if (readIdx == numPixels - 1) begin
				readIdx <= 0;
				activeBuffer <= ~activeBuffer; // Troca os buffers
			end
			else begin
				readIdx <= readIdx + 1'b1;
			end
		end
		
	end
	
	// Escrita 
	always @(posedge clk25MHz) begin
		if (writeEnable) begin
			if (activeBuffer == 0) begin // Escreve no buffer B
				bufferB[writeIdx] <= {inRed, inGreen, inBlue};
			end else begin // Escreve no buffer A
				bufferA[writeIdx] <= {inRed, inGreen, inBlue};
			end

			// Incrementa ou reseta o índice circular de escrita
			if (writeIdx == numPixels - 1)
				writeIdx <= 0;
			else
				writeIdx <= writeIdx + 1'b1;
		end
	end


	
endmodule