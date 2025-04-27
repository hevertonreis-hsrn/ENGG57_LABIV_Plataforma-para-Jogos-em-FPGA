module EX_STAGE (
    input wire clk,
    input wire rst,
    input wire ID_EX_MemToReg,
    input wire ID_EX_RegWrite,
    input wire ID_EX_MemRead,
    input wire ID_EX_MemWrite,
	 input wire ID_EX_Branch,
    input wire ID_EX_ALUSrc,
    
    input wire [5:0] ID_EX_ALUOp,
    input wire [31:0] ID_EX_BranchTarget,
    input wire [31:0] ID_EX_ReadData1,
    input wire [31:0] ID_EX_ReadData2,
    input wire [31:0] ID_EX_SignExtImm,
    input wire [4:0] ID_EX_WriteReg,
	 input wire [1:0] ForwardA,
    input wire [1:0] ForwardB,
    input wire [31:0] MEM_Data,
	 input wire [31:0] EX_Data,
    
    output wire BranchTaken,
	 output wire [31:0] BranchTarget,
    output wire EX_MEM_MemToReg,
    output wire EX_MEM_RegWrite,
    output wire EX_MEM_MemRead,
    output wire EX_MEM_MemWrite,
    output wire [31:0] EX_MEM_ALUResult,
    output wire [31:0] EX_MEM_WriteData,
    output wire [4:0] EX_MEM_WriteReg
);

    //=== Internal Wires ===//
    wire [31:0] ALU_InputA;
    wire [31:0] ALU_InputB;
    wire [3:0] ALU_Operation;
    wire [6:0] ALUFlags_Stored;
    wire [6:0] ALUFlags_Out;
    wire ALU_Zero;
    wire [31:0] ALU_Result;
    wire [31:0] MuxB_Output;

    assign BranchTarget = ID_EX_BranchTarget;

    // Forwarding Mux for ALU input A
	ForwardingMux mux_forward_A (
		.exData(EX_Data),
		.memData(MEM_Data),
		.regData(ID_EX_ReadData1),
		.sel(ForwardA),
		.out(ALU_InputA)
	);

	// Simple ALUSrc mux using assign
	assign MuxB_Output = (ID_EX_ALUSrc) ? ID_EX_SignExtImm : ID_EX_ReadData2;

	// Forwarding Mux for ALU input B
	ForwardingMux mux_forward_B (
		.exData(EX_Data),
		.memData(MEM_Data),
		.regData(MuxB_Output),
		.sel(ForwardB),
		.out(ALU_InputB)
	);

    // ALU Control: decode ALUOp into ALU Operation
    ALUControl alu_control (
        .ALUOp(ID_EX_ALUOp),
        .Operation(ALU_Operation)
    );

    // ALU execution
    ALU alu_unit (
        .data1(ALU_InputA),
        .data2(ALU_InputB),
        .Operation(ALU_Operation),
        .RFlagsStored(ALUFlags_Stored),
        .Zero(ALU_Zero),
        .Result(ALU_Result),
        .RFlagsOut(ALUFlags_Out)
    );

    // Flags register between cycles
    RFlagsRegister flags_register (
        .clk(clk),
        .rst(rst),
        .RFlags_in(ALUFlags_Out),
        .RFlags_out(ALUFlags_Stored)
    );

    // Branch decision logic
    assign BranchTaken = ID_EX_Branch & ALU_Zero;

    // EX/MEM Pipeline Register
    EX_MEM_Register ex_mem_register (
        .clk(clk),
        .rst(rst),
        .inMemToReg(ID_EX_MemToReg),
        .inRegWrite(ID_EX_RegWrite),
        .inMemRead(ID_EX_MemRead),
        .inMemWrite(ID_EX_MemWrite),
        .inALUResult(ALU_Result),
        .inWriteData(ID_EX_ReadData2),
        .inWriteReg(ID_EX_WriteReg),
        .outMemToReg(EX_MEM_MemToReg),
        .outRegWrite(EX_MEM_RegWrite),
        .outMemRead(EX_MEM_MemRead),
        .outMemWrite(EX_MEM_MemWrite),
        .outALUResult(EX_MEM_ALUResult),
        .outWriteData(EX_MEM_WriteData),
        .outWriteReg(EX_MEM_WriteReg)
    );

endmodule

module ForwardingMux (
    input wire [1:0] sel,         // Controle vindo da Forwarding Unit
    input wire [31:0] regData,    // Valor normal vindo do banco de registradores
    input wire [31:0] exData,     // Valor vindo de EX/MEM
    input wire [31:0] memData,    // Valor vindo de MEM/WB
    output reg [31:0] out
);

    always @(*) begin
        case (sel)
            2'b00: out = regData;  // Sem forwarding
            2'b10: out = exData;   // Forward vindo do estágio EX/MEM
            2'b01: out = memData;  // Forward vindo do estágio MEM/WB
            default: out = regData;
        endcase
    end

endmodule

module RFlagsRegister(
    input wire clk,
    input wire rst,
    input wire [6:0] RFlags_in,          // Flags vindas da ALU
    output reg [6:0] RFlags_out         // Flags armazenadas
);

    always @(posedge clk) begin
        if (rst)
            RFlags_out <= 7'b0000000;
        else
            RFlags_out <= RFlags_in;
    end

endmodule

module EX_MEM_Register (
    input wire clk, 
	 input wire rst,
    input wire inMemToReg,
    input wire inRegWrite,
	 input wire inMemRead,
	 input wire inMemWrite,
	 input wire [31:0] inALUResult,
	 input wire [31:0] inWriteData,
	 input wire [4:0] inWriteReg,
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
		 outMemToReg <= 1'b0;
		 outRegWrite <= 1'b0;
		 outMemRead <= 1'b0;
		 outMemWrite <= 1'b0;
		 outALUResult <= 32'b0;
		 outWriteData <= 32'b0;
		 outWriteReg <= 5'b0;
	end
	else begin
		 outMemToReg <= inMemToReg;
		 outRegWrite <= inRegWrite;
		 outMemRead <= inMemRead;
		 outMemWrite <= inMemWrite;
		 outALUResult <= inALUResult;
		 outWriteData <= inWriteData;
		 outWriteReg <= inWriteReg;
	end
endmodule
