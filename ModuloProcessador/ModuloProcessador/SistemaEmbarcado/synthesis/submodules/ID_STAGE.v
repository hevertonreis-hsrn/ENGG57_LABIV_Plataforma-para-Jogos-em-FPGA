module ID_STAGE(
    input wire clk_50,
    input wire clk,
    input wire rst,
    input wire [31:0] IF_ID_PC,
    input wire [31:0] IF_ID_Inst,
    input wire HD_HoldControl,
    input wire RegWrite,
    input wire [4:0] WriteReg,
    input wire [31:0] WriteData,
    input wire MemoryStall, 
    
    output wire [4:0] r1,
    output wire [4:0] r2,
    output wire ID_EX_MemToReg,
    output wire ID_EX_RegWrite,
    output wire ID_EX_MemRead,
    output wire ID_EX_MemWrite,
    output wire ID_EX_Branch,
    output wire ID_EX_ALUSrc,
    output wire [5:0] ID_EX_ALUOp,
    output wire [31:0] ID_EX_BranchTarget,
    output wire [31:0] ID_EX_ReadData1,
    output wire [31:0] ID_EX_ReadData2,
    output wire [31:0] ID_EX_SignExtImm,
    output wire [4:0] ID_EX_WriteReg,
    output wire [4:0] ID_EX_Rs
);

//=== Internal Wires ===//
wire [5:0] opcode;
wire [15:0] immediate;
wire [31:0] signExtImm;
wire [31:0] pcExt32;
wire [31:0] branchRegValue;
wire [31:0] branchTarget;
wire [31:0] readData1, readData2;
wire [31:0] stackPCOut;
wire push;
wire pop;

wire branchMode, branchSrc;
wire branch, memRead, memToReg, memWrite, aluSrc, regWriteControl;
wire [5:0] aluOp;

wire hold_branchMode, hold_branchSrc;
wire hold_branch, hold_memRead, hold_memToReg, hold_memWrite, hold_aluSrc, hold_regWrite;
wire [5:0] hold_aluOp;

wire ID_Hold;

//=== Hold logic: stall se MemoryStall OU Hazard ===//
assign ID_Hold = MemoryStall | HD_HoldControl;

//=== Instruction Decode (with hold) ===//
reg [5:0] hold_opcode;
reg [4:0] hold_r1;
reg [4:0] hold_r2;
reg [15:0] hold_immediate;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        hold_opcode <= 6'b0;
        hold_r1 <= 5'b0;
        hold_r2 <= 5'b0;
        hold_immediate <= 16'b0;
    end else if (!ID_Hold) begin
        hold_opcode <= IF_ID_Inst[31:26];
        hold_r1 <= IF_ID_Inst[25:21];
        hold_r2 <= IF_ID_Inst[20:16];
        hold_immediate <= IF_ID_Inst[15:0];
    end
end

assign opcode = hold_opcode;
assign r1 = hold_r1;
assign r2 = hold_r2;
assign immediate = hold_immediate;

//=== Control Unit ===//
Control control_unit(
    .opcode(opcode),
    .StackPush(push), // Não usado
    .StackPop(pop),  // Não usado
    .BranchMode(branchMode),
    .BranchSrc(branchSrc),
    .Branch(branch),
    .MemRead(memRead),
    .MemToReg(memToReg),
    .MemWrite(memWrite),
    .ALUSrc(aluSrc),
    .RegWrite(regWriteControl),
    .ALUOp(aluOp)
);

//=== Register File ===//
RegFile regfile(
    .clk(clk_50),
    .rst(rst),
    .RegWrite(RegWrite),
    .readReg1(r1),
    .readReg2(r2),
    .writeData(WriteData),
    .writeReg(WriteReg),
    .readData1(readData1),
    .readData2(readData2)
);

//=== Sign Extend (16 bits para 32 bits) ===//
assign signExtImm = {{16{immediate[15]}}, immediate};

//=== Stack para Branch com PUSH/POP ===//
Stack stack_pc(
    .clk(clk),
    .rst(rst),
    .push(push),
    .pop(pop),
    .data_in(IF_ID_PC),
    .data_out(stackPCOut)
);

//=== Branch Target Calculation ===//
assign branchRegValue = (branchSrc) ? stackPCOut : readData1;

BranchFormat branchFormat(
    .PC(IF_ID_PC),
    .BranchMode(branchMode),
    .RegValue(branchRegValue),
    .ImmExt(signExtImm),
    .BranchTarget(branchTarget)
);

//=== Control Hold Mux ===//
assign hold_branchMode  = (ID_Hold) ? 1'b0 : branchMode;
assign hold_branchSrc   = (ID_Hold) ? 1'b0 : branchSrc;
assign hold_branch      = (ID_Hold) ? 1'b0 : branch;
assign hold_memRead     = (ID_Hold) ? 1'b0 : memRead;
assign hold_memToReg    = (ID_Hold) ? 1'b0 : memToReg;
assign hold_memWrite    = (ID_Hold) ? 1'b0 : memWrite;
assign hold_aluSrc      = (ID_Hold) ? 1'b0 : aluSrc;
assign hold_regWrite    = (ID_Hold) ? 1'b0 : regWriteControl;
assign hold_aluOp       = (ID_Hold) ? 6'b0 : aluOp;

//=== ID/EX Pipeline Register ===//
ID_EX_Register id_ex_reg(
    .clk(clk),
    .rst(rst),
    .hold(ID_Hold), // <=== Adicionado aqui para congelar o pipeline
    .inMemToReg(hold_memToReg),
    .inRegWrite(hold_regWrite),
    .inBranch(hold_branch),
    .inBranchTarget(branchTarget),
    .inMemRead(hold_memRead),
    .inMemWrite(hold_memWrite),
    .inALUSrc(hold_aluSrc),
    .inALUOp(hold_aluOp),
    .inReadData1(readData1),
    .inReadData2(readData2),
    .inRegSrc1(r1),
    .inSignExtImm(signExtImm),
    .inWriteReg(r2),
    .outMemToReg(ID_EX_MemToReg),
    .outRegWrite(ID_EX_RegWrite),
    .outBranch(ID_EX_Branch),
    .outBranchTarget(ID_EX_BranchTarget),
    .outMemRead(ID_EX_MemRead),
    .outMemWrite(ID_EX_MemWrite),
    .outALUSrc(ID_EX_ALUSrc),
    .outALUOp(ID_EX_ALUOp),
    .outReadData1(ID_EX_ReadData1),
    .outReadData2(ID_EX_ReadData2),
    .outRegSrc1(ID_EX_Rs),
    .outSignExtImm(ID_EX_SignExtImm),
    .outWriteReg(ID_EX_WriteReg)
);

endmodule


module BranchFormat(
    input wire [31:0] PC,
	 input wire BranchMode,
    input wire [31:0] RegValue,
    input wire [31:0] ImmExt,
    output reg [31:0] BranchTarget
);

	 reg [31:0] address;

    always @(*) begin
	 
		address = 32'd0;
		  
        if (BranchMode) begin
            BranchTarget = RegValue;
        end else begin
			address = PC + ImmExt;
            BranchTarget = address;
        end
    end
endmodule

module Stack (
    input wire clk,
    input wire rst,
    input wire push,
    input wire pop,
    input wire [31:0] data_in,
    output reg [31:0] data_out,  
    output reg empty,
    output reg full
);
    parameter STACK_DEPTH = 32;
    reg [31:0] stack_mem [0:STACK_DEPTH-1];
    reg [4:0] sp;

    always @(posedge clk) begin
        if (rst) begin
            sp <= 0;
            empty <= 1;
            full <= 0;
            data_out <= 8'b0;
        end else begin
            if (push && !full) begin
                stack_mem[sp] <= data_in;
                sp <= sp + 5'd1;
                data_out <= data_in;  // Atualiza o topo
            end else if (pop && !empty) begin
                sp <= sp - 5'd1;
                data_out <= stack_mem[sp - 1]; // Captura o novo topo antes de mudar sp
            end

            empty <= (sp == 0);
            full <= (sp == STACK_DEPTH);
        end
    end
endmodule

module ID_EX_Register (
    input wire clk,
    input wire rst,
	 input wire hold,
	 input wire inMemToReg,
	 input wire inRegWrite,
	 input wire [31:0] inBranchTarget,
	 input wire inBranch,
    input wire inMemRead,                 
    input wire inMemWrite,                	 
    input wire [31:0] inReadData1,        
    input wire [31:0] inReadData2,        
    input wire [31:0] inSignExtImm,       
    input wire [5:0] inALUOp,            
    input wire inALUSrc,
	 input wire [4:0] inWriteReg,
	 input wire [4:0] inRegSrc1,
   
	 output reg outMemToReg,               
    output reg outRegWrite,
    output reg [31:0] outBranchTarget,
	 output reg outBranch,
    output reg outMemRead,               
    output reg outMemWrite,          	
    output reg [31:0] outReadData1,      
    output reg [31:0] outReadData2,      
    output reg [31:0] outSignExtImm,      
	 output reg [5:0] outALUOp,             
    output reg outALUSrc,
	 output reg [4:0] outWriteReg,
	 output reg [4:0] outRegSrc1
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
				outALUOp <= 6'b010101;
            outALUSrc <= 1'b0;
			   outWriteReg <= 5'b0;
				outRegSrc1 <= 5'b0;
        end else if (!hold) begin
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
				outRegSrc1 <= inRegSrc1;
        end
    end

endmodule