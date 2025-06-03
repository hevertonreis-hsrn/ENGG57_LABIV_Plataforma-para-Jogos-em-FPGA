`timescale 1ns/1ps
module ModuloProcessador_tb;

reg	CLOCK_50;
reg SW;

ModuloProcessador dut(
	.CLOCK_50(CLOCK_50),
	.SW(SW)
);

always #10 CLOCK_50 = ~CLOCK_50; 

initial begin
	CLOCK_50 = 0;
	SW = 0;
	
	#102;
	SW = 1;
	
	#1000; 
	
end


endmodule
