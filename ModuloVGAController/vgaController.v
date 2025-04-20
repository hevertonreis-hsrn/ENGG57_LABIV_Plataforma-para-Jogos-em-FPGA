// Controlador VGA considerando uma tela de 640 x 480 a 60Hz.

module vgaController(
	input clk,
	output hSync,
	output vSync,
	output [3:0] outRed,
	output [3:0] outGreen,
	output [3:0] outBlue,
);

wire enableVerticalCounter, clk25Mhz;
wire [9:0] hCount, vCount;
reg reset = 0; // Para o PLL.

// Divisor de clock (requer 25 MHz)
clockDivider(.areset(reset), .inclk0(clk), .c0(clk25Mhz), .locked())

// Contagem.
hCounter(.clk25Mhz(clk25Mhz), .counter(hCount), .jumpLine(enableVerticalCounter))
vCounter(.clk25Mhz(clk25Mhz), .enable(enableVerticalCounter), .counter(vCount))

// Sincronizando.
assign hSync = (hCount < 96) ? 1'b1 : 1'b0;
assign vSync = (vCount < 2) ? 1'b1 : 1'b0;

// Colorindo saida. (Por hora exibiria uma tela em branco)
assign outRed = (hCount < 784 && hCount > 143 && vCount < 515 && vCount > 34) ? 4'hF : 4'b0;
assign outGreen = (hCount < 784 && hCount > 143 && vCount < 515 && vCount > 34) ? 4'hF : 4'b0;
assign outBlue = (hCount < 784 && hCount > 143 && vCount < 515 && vCount > 34) ? 4'hF : 4'b0;

endmodule