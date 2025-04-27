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

wire branchMode, branchSrc;
wire branch, memRead, memToReg, memWrite, aluSrc, regWriteControl;
wire [5:0] aluOp;

wire hold_branchMode, hold_branchSrc;
wire hold_branch, hold_memRead, hold_memToReg, hold_memWrite, hold_aluSrc, hold_regWrite;
wire [5:0] hold_aluOp;

//=== Decode Instruction Fields ===//
assign opcode = IF_ID_Inst[31:26];
assign r1 = IF_ID_Inst[25:21];
assign r2 = IF_ID_Inst[20:16];
assign immediate = IF_ID_Inst[15:0];

//=== Control Unit ===//
Control control_unit(
    .opcode(opcode),
    .StackPush(), // Não usado diretamente aqui
    .StackPop(),  // Não usado diretamente aqui
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

//=== Stack for PC (Push/Pop mechanism) ===//
Stack stack_pc(
    .clk(clk),
    .rst(rst),
    .push(), // Ligação posterior caso necessário
    .pop(),
    .data_in(IF_ID_PC),
    .data_out(stackPCOut)
);

//=== Mux 2: Escolhe entre readData1 e PC stack estendido ===//
assign branchRegValue = (branchSrc) ? stackPCOut : readData1;

//=== Branch Address Calculation ===//
assign branchTarget = branchRegValue + signExtImm;

//=== Control Mux: Segura sinais durante hazard ===//
assign hold_branchMode  = (HD_HoldControl) ? 1'b0 : branchMode;
assign hold_branchSrc   = (HD_HoldControl) ? 1'b0 : branchSrc;
assign hold_branch      = (HD_HoldControl) ? 1'b0 : branch;
assign hold_memRead     = (HD_HoldControl) ? 1'b0 : memRead;
assign hold_memToReg    = (HD_HoldControl) ? 1'b0 : memToReg;
assign hold_memWrite    = (HD_HoldControl) ? 1'b0 : memWrite;
assign hold_aluSrc      = (HD_HoldControl) ? 1'b0 : aluSrc;
assign hold_regWrite    = (HD_HoldControl) ? 1'b0 : regWriteControl;
assign hold_aluOp       = (HD_HoldControl) ? 6'b0 : aluOp;

//=== ID/EX Pipeline Register ===//
ID_EX_Register id_ex_reg(
    .clk(clk),
    .rst(rst),
    .inMemToReg(hold_memToReg),
    .inRegWrite(hold_regWrite),
    .inBranch(hold_branch),
    .inMemRead(hold_memRead),
    .inMemWrite(hold_memWrite),
    .inALUSrc(hold_aluSrc),
    .inALUOp(hold_aluOp),
    .inBranchTarget(branchTarget),
    .inReadData1(readData1),
    .inReadData2(readData2),
    .inRegSrc1(r1),
    .inSignExtImm(signExtImm),
    .inWriteReg(r2),
    .outMemToReg(ID_EX_MemToReg),
    .outRegWrite(ID_EX_RegWrite),
    .outBranch(ID_EX_Branch),
    .outMemRead(ID_EX_MemRead),
    .outMemWrite(ID_EX_MemWrite),
    .outALUSrc(ID_EX_ALUSrc),
    .outALUOp(ID_EX_ALUOp),
    .outBranchTarget(ID_EX_BranchTarget),
    .outReadData1(ID_EX_ReadData1),
    .outReadData2(ID_EX_ReadData2),
    .outRegSrc1(ID_EX_Rs),
    .outSignExtImm(ID_EX_SignExtImm),
    .outWriteReg(ID_EX_WriteReg)
);

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
				outRegSrc1 <= inRegSrc1;
        end
    end

endmodule