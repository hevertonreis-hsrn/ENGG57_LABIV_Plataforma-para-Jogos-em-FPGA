`timescale 1ns / 1ps

module vgaControllerTB;

	// Sinais de entrada
	reg Clk = 0;

	// Sinais de saída
	wire HSync, VSync;
	wire [7:0] OutRed, OutGreen, OutBlue;

	// Instância do DUT
	vgaController dut (
		.clk(Clk),
		.hSync(HSync),
		.vSync(VSync),
		.outRed(OutRed),
		.outGreen(OutGreen),
		.outBlue(OutBlue)
	);

	// Clock de 50 MHz (20 ns de período)
	always #10 Clk = ~Clk;

	initial begin
		$display("Iniciando simulação...");
		$dumpfile("vgaControllerTB.vcd");
		$dumpvars(0, vgaControllerTB);

		// Tempo suficientemente grande para verificar comportamento.
		#17000000;

		$display("Finalizando simulação.");
		$stop;
	end

endmodule
