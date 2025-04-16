module BranchFormat(
    input wire [7:0] PC,
	 input wire BranchMode,
    input wire [31:0] RegValue,
    input wire [31:0] ImmExt,
    output reg [7:0] BranchTarget
);

	 reg [31:0] address;

    always @(*) begin
	 
		  address = 32'd0;
		  
        if (BranchMode) begin
            BranchTarget = RegValue[7:0];
        end else begin
			address = PC + ImmExt;
            BranchTarget = address[7:0];
        end
    end
endmodule
