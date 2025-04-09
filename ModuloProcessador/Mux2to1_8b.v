module Mux2to1_8b (
	input wire sel,
  	input wire [7:0] in0,    
  	input wire [7:0] in1,               
  	output wire [7:0] out    
);

    assign out = (sel == 1'b0) ? in0 : in1;

endmodule