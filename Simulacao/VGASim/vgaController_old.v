// Controlador VGA considerando uma tela de 640 x 480 a 60Hz.

module vgaController(
	input clk,
	output hSync, vSync,									// Sinais de sincronismo.
	output blankN, syncN,         					// Saidas padrao vga controller (pouco usadas).
	output [7:0] outRed, outGreen, outBlue			// Saidas das cores.
	);

wire enableVerticalCounter;
wire clk25Mhz;
wire [9:0] hCount, vCount;
reg reset = 0; // Para o PLL.

// Divisor de clock (requer 25 MHz)
clkDivider cd (.areset(reset), .inclk0(clk), .c0(clk25Mhz));

// Contagem.
hCounter vgaH (.clk25MHz(clk25Mhz), .counter(hCount), .jumpLine(enableVerticalCounter));
vCounter vgaV (.clk25MHz(clk25Mhz), .enable(enableVerticalCounter), .counter(vCount));

// Sincronizando.
assign hSync = (hCount < 96) ? 1'b1 : 1'b0;
assign vSync = (vCount < 2) ? 1'b1 : 1'b0;

// Outras saidas.
assign blankN = (hCount < 784 && hCount > 143 && vCount < 515 && vCount > 34); // Ativado quando dentro da area visivel.
assign syncN = 1'b1; // Sinal legado de sincronismo composto (nao usado).

// Colorindo. (Por hora exibiria uma tela em branco)
assign outRed = (blankN == 1) ? 8'hFF : 8'h00;
assign outGreen = (blankN == 1) ? 8'hFF : 8'h00;
assign outBlue = (blankN == 1) ? 8'hFF : 8'h00;

endmodule