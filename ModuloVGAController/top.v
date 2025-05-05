module top(
    input clk,
	 input writeEnable,
	 input [7:0] inRed, inGreen, inBlue,
    output hs, vs,
	 output vgaRequest,
    output vgaClk, vgaBlankN, vgaSyncN,
    output [7:0] outRed, outGreen, outBlue,
    output [9:0] xPos, yPos
);

// Sinais para comunicação entre modulos.
wire [7:0] bufferOutR, bufferOutG, bufferOutB;
reg reset = 0; // Para o PLL.
wire pixelRequest, clk25Mhz;

// Divisor de Clock.
clockDivider pll (.clk(clk), .reset(reset), .clk_out(clk25Mhz));  // Clock de saída dividido por 2

// Instancia o controlador VGA.
vgaController vgaCtrl (
	.inRed(bufferOutR), .inGreen(bufferOutG), .inBlue(bufferOutB),
	.outX(xPos), .outY(yPos),
	.outRequest(pixelRequest),  
	.outRed(outRed), .outGreen(outGreen), .outBlue(outBlue),
	.hs(hs), .vs(vs),     											
	.vgaClk(vgaClk), .vgaBlankN(vgaBlankN), .vgaSyncN(vgaSyncN),
	.clk25(clk25Mhz), .rstN(~reset)
	);

// Instancia o Double Buffer.
doubleBuffer buff (
	.clk(clk25Mhz),
	.readEnable(pixelRequest),
	.writeEnable(writeEnable),
	.inRed(inRed), .inGreen(inGreen), .inBlue(inBlue),
	.outRed(bufferOutR), .outGreen(bufferOutG), .outBlue(bufferOutB)
	);
	
assign vgaRequest = pixelRequest;

endmodule
