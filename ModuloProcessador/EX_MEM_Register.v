module EX_MEM_Register (
    input wire clk, 
	 input wire rst,
	 input wire inBranchTaken,
	 input wire [7:0] inBranchTarget,
    input wire inMemToReg,
    input wire inRegWrite,
	 input wire inMemRead,
	 input wire inMemWrite,
	 input wire [31:0] inALUResult,
	 input wire [31:0] inWriteData,
	 input wire [4:0] inWriteReg,
	 output reg outBranchTaken,
	 output reg [7:0] outBranchTarget,
	 output reg outMemToReg,
    output reg outRegWrite,
	 output reg outMemRead,
	 output reg outMemWrite,
	 output reg [31:0] outALUResult,
	 output reg [31:0] outWriteData,
	 output reg [4:0] outWriteReg
    );
  
always@(posedge clk)
	if (rst) begin
		 outBranchTaken <= 1'b0;
		 outBranchTarget <= 8'b0;
		 outMemToReg <= 1'b0;
		 outRegWrite <= 1'b0;
		 outMemRead <= 1'b0;
		 outMemWrite <= 1'b0;
		 outALUResult <= 32'b0;
		 outWriteData <= 32'b0;
		 outWriteReg <= 5'b0;
	end
	else begin
		 outBranchTaken <= inBranchTaken;
		 outBranchTarget <= inBranchTarget;
		 outMemToReg <= inMemToReg;
		 outRegWrite <= inRegWrite;
		 outMemRead <= inMemRead;
		 outMemWrite <= inMemWrite;
		 outALUResult <= inALUResult;
		 outWriteData <= inWriteData;
		 outWriteReg <= inWriteReg;
	end
endmodule
