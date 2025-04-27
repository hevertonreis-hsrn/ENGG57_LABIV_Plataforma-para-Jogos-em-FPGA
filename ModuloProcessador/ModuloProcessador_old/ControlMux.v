module ControlMux(
    input wire inBranchMode,
    input wire inBranchSrc,
    input wire inBranch,
    input wire inMemRead,
    input wire inMemToReg,
    input wire [5:0] inALUOp,
    input wire inMemWrite,
    input wire inALUSrc,
    input wire inRegWrite,
    input wire holdControl,

    output reg outBranchMode,
    output reg outBranchSrc,
    output reg outBranch,
    output reg outMemRead,
    output reg outMemToReg,
    output reg [5:0] outALUOp,
    output reg outMemWrite,
    output reg outALUSrc,
    output reg outRegWrite
);

    always @(*) begin
        if (holdControl == 1'b0) begin
            outBranchMode = inBranchMode;
            outBranchSrc = inBranchSrc;
            outBranch = inBranch;
            outMemRead = inMemRead;
            outMemToReg = inMemToReg;
            outALUOp = inALUOp;
            outMemWrite = inMemWrite;
            outALUSrc = inALUSrc;
            outRegWrite = inRegWrite;
        end else begin 
            outBranchMode = 1'b0; 
            outBranchSrc = 1'b0; 
            outBranch = 1'b0; 
            outMemRead = 1'b0; 
            outMemToReg = 1'b0; 
            outALUOp = 6'b010101; 
            outMemWrite = 1'b0; 
            outALUSrc = 1'b0; 
            outRegWrite = 1'b0; 
        end
    end


endmodule