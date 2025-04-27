module BranchAdder (
  	input wire [7:0] PC, 
    input wire [31:0] signExtImm,       
  	output wire [7:0] addResult      
);

    wire [7:0] BranchAddress;  
    assign BranchAddress = signExtImm[7:0];

    assign addResult = PC + BranchAddress;

endmodule