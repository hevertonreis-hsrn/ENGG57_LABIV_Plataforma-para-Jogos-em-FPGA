module ID_EX_Register (
    input wire clk,
    input wire rst,
	 input wire inMemToReg,
	 input wire inRegWrite,
	 input wire [7:0] inBranchTarget,
	 input wire inBranch,
    input wire inMemRead,                 
    input wire inMemWrite,                	 
    input wire [31:0] inReadData1,        
    input wire [31:0] inReadData2,        
    input wire [31:0] inSignExtImm,       
    input wire [5:0] inALUOp,            
    input wire inALUSrc,
	 input wire [4:0] inWriteReg, 
   
	 output reg outMemToReg,               
    output reg outRegWrite,
    output reg [7:0] outBranchTarget,
	 output reg outBranch,
    output reg outMemRead,               
    output reg outMemWrite,          	
    output reg [31:0] outReadData1,      
    output reg [31:0] outReadData2,      
    output reg [31:0] outSignExtImm,      
	 output reg [5:0] outALUOp,             
    output reg outALUSrc,
	 output reg [4:0] outWriteReg	 
);

  always @(posedge clk) begin
        if (rst) begin
				outMemToReg <= 1'b0;
				outRegWrite <= 1'b0;
				outBranch <= 1'b0;
				outBranchTarget <= 8'b0;
				outMemRead <= 1'b0; 
            outMemWrite <= 1'b0;
            outReadData1 <= 32'b0;
            outReadData2 <= 32'b0;
            outSignExtImm <= 32'b0;
				outALUOp <= 5'b11111;
            outALUSrc <= 1'b0;
			   outWriteReg <= 5'b0;	
        end else begin
            outMemToReg <= inMemToReg;
				outRegWrite <= inRegWrite;
				outBranch <= inBranch;
				outBranchTarget <= inBranchTarget;
				outMemRead <= inMemRead; 
            outMemWrite <= inMemWrite;
            outReadData1 <= inReadData1;
            outReadData2 <= inReadData2;
            outSignExtImm <= inSignExtImm;
				outALUOp <= inALUOp;
            outALUSrc <= inALUSrc;
				outWriteReg <= inWriteReg;
        end
    end

endmodule
