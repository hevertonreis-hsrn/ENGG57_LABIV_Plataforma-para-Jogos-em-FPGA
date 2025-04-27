module WB_STAGE(
    MEM_WB_MemToReg,
    MEM_WB_RegWrite,
    MEM_WB_ALUResult,
    MEM_WB_ReadData,
    MEM_WB_WriteReg,
    RegWrite,
	 WriteReg,
    WriteData
    
);

input wire    MEM_WB_MemToReg;
input wire    MEM_WB_RegWrite;
input wire    [31:0] MEM_WB_ALUResult;
input wire    [31:0] MEM_WB_ReadData;
input wire    [4:0] MEM_WB_WriteReg;
output wire   RegWrite;
output wire   [31:0] WriteData;
output wire   [4:0] WriteReg;

assign RegWrite = MEM_WB_RegWrite;
assign WriteReg = MEM_WB_WriteReg;
assign WriteData = MEM_WB_MemToReg ? MEM_WB_ReadData : MEM_WB_ALUResult;

endmodule
