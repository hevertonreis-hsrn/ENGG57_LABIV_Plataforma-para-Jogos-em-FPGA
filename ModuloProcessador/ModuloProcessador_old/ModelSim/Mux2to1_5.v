module Mux2to1_5 (
	input wire sel,
  	input wire [4:0] in0,    
  	input wire [4:0] in1,               
  	output wire [4:0] out    
);

    assign out = (sel == 1'b0) ? in0 : in1;

endmodule