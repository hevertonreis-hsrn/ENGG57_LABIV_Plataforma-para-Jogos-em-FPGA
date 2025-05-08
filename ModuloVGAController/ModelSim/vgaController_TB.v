`timescale 1ns/1ps

module tb_vgaController;

	reg clk25 = 0;
	reg rstN = 0;

	wire [7:0] outRed, outGreen, outBlue;
	wire [9:0] outX, outY;
	wire outRequest;
	wire hs, vs, vgaClk, vgaBlankN, vgaSyncN;

	// Clock 25 MHz
	always #20 clk25 = ~clk25;  // 40ns period => 25 MHz

	// Instancia o módulo
	vgaController uut (
		.clk25(clk25),
		.rstN(rstN),
		.inRed(8'hFF),
		.inGreen(8'h00),
		.inBlue(8'h00),
		.outX(outX),
		.outY(outY),
		.outRequest(outRequest),
		.outRed(outRed),
		.outGreen(outGreen),
		.outBlue(outBlue),
		.hs(hs),
		.vs(vs),
		.vgaClk(vgaClk),
		.vgaBlankN(vgaBlankN),
		.vgaSyncN(vgaSyncN)
	);

	initial begin
		$display(">>> Teste VGA START");

		rstN = 0;
		#100;
		rstN = 1;

		// Roda por algumas linhas
		#1000000;

		$display(">>> Teste VGA END");
		$stop;
	end

endmodule
