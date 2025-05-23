// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Tue Apr 15 22:01:33 2025"

module ID_STAGE(
	clk,
	rst,
	RegWrite,
	clk_Mem,
	HD_HoldControl,
	IF_ID_Inst,
	IF_ID_PC,
	WriteData,
	WriteReg,
	ID_EX_MemToReg,
	ID_EX_RegWrite,
	ID_EX_MemRead,
	ID_EX_MemWrite,
	ID_EX_Branch,
	ID_EX_ALUSrc,
	ID_EX_ALUOp,
	ID_EX_BranchTarget,
	ID_EX_ReadData1,
	ID_EX_ReadData2,
	ID_EX_Rs,
	ID_EX_SignExtImm,
	ID_EX_WriteReg,
	r1,
	r2
);


input wire	clk;
input wire	rst;
input wire	RegWrite;
input wire	clk_Mem;
input wire	HD_HoldControl;
input wire	[31:0] IF_ID_Inst;
input wire	[7:0] IF_ID_PC;
input wire	[31:0] WriteData;
input wire	[4:0] WriteReg;
output wire	ID_EX_MemToReg;
output wire	ID_EX_RegWrite;
output wire	ID_EX_MemRead;
output wire	ID_EX_MemWrite;
output wire	ID_EX_Branch;
output wire	ID_EX_ALUSrc;
output wire	[5:0] ID_EX_ALUOp;
output wire	[7:0] ID_EX_BranchTarget;
output wire	[31:0] ID_EX_ReadData1;
output wire	[31:0] ID_EX_ReadData2;
output wire	[4:0] ID_EX_Rs;
output wire	[31:0] ID_EX_SignExtImm;
output wire	[4:0] ID_EX_WriteReg;
output wire	[4:0] r1;
output wire	[4:0] r2;

wire	[5:0] SYNTHESIZED_WIRE_0;
wire	[4:0] SYNTHESIZED_WIRE_35;
wire	[4:0] SYNTHESIZED_WIRE_36;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_37;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_38;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	[7:0] SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	[5:0] SYNTHESIZED_WIRE_19;
wire	[7:0] SYNTHESIZED_WIRE_20;
wire	[31:0] SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	[5:0] SYNTHESIZED_WIRE_34;

assign	r1 = SYNTHESIZED_WIRE_35;
assign	r2 = SYNTHESIZED_WIRE_36;




Control	b2v_inst(
	.opcode(SYNTHESIZED_WIRE_0),
	.StackPush(SYNTHESIZED_WIRE_10),
	.StackPop(SYNTHESIZED_WIRE_11),
	.BranchMode(SYNTHESIZED_WIRE_26),
	.BranchSrc(SYNTHESIZED_WIRE_27),
	.Branch(SYNTHESIZED_WIRE_28),
	.MemRead(SYNTHESIZED_WIRE_29),
	.MemToReg(SYNTHESIZED_WIRE_30),
	.MemWrite(SYNTHESIZED_WIRE_31),
	.ALUSrc(SYNTHESIZED_WIRE_32),
	.RegWrite(SYNTHESIZED_WIRE_33),
	.ALUOp(SYNTHESIZED_WIRE_34));
	defparam	b2v_inst.ADD = 6'b000110;
	defparam	b2v_inst.AND = 6'b001010;
	defparam	b2v_inst.BRFL = 6'b010010;
	defparam	b2v_inst.CALL = 6'b010011;
	defparam	b2v_inst.CMP = 6'b001110;
	defparam	b2v_inst.DIV = 6'b001001;
	defparam	b2v_inst.JPC = 6'b010001;
	defparam	b2v_inst.JR = 6'b010000;
	defparam	b2v_inst.LW_1 = 6'b000000;
	defparam	b2v_inst.LW_2 = 6'b000001;
	defparam	b2v_inst.LW_3 = 6'b000010;
	defparam	b2v_inst.MOV = 6'b000101;
	defparam	b2v_inst.MUL = 6'b001000;
	defparam	b2v_inst.NOP = 6'b010101;
	defparam	b2v_inst.NOT = 6'b001111;
	defparam	b2v_inst.OR = 6'b001011;
	defparam	b2v_inst.RET = 6'b010100;
	defparam	b2v_inst.SHL = 6'b001100;
	defparam	b2v_inst.SHR = 6'b001101;
	defparam	b2v_inst.SUB = 6'b000111;
	defparam	b2v_inst.SW_1 = 6'b000011;
	defparam	b2v_inst.SW_2 = 6'b000100;


InstructionDecoder	b2v_inst1(
	.instruction(IF_ID_Inst),
	.immediate(SYNTHESIZED_WIRE_3),
	.opcode(SYNTHESIZED_WIRE_0),
	.r1(SYNTHESIZED_WIRE_35),
	.r2(SYNTHESIZED_WIRE_36));


RegFile	b2v_inst2(
	.clk(clk_Mem),
	.rst(rst),
	.RegWrite(RegWrite),
	.readReg1(SYNTHESIZED_WIRE_35),
	.readReg2(SYNTHESIZED_WIRE_36),
	.writeData(WriteData),
	.writeReg(WriteReg),
	.readData1(SYNTHESIZED_WIRE_38),
	.readData2(SYNTHESIZED_WIRE_22));


SignExtend	b2v_inst3(
	.immediate(SYNTHESIZED_WIRE_3),
	.signExtImm(SYNTHESIZED_WIRE_37));


BranchFormat	b2v_inst4(
	.BranchMode(SYNTHESIZED_WIRE_4),
	.ImmExt(SYNTHESIZED_WIRE_37),
	.PC(IF_ID_PC),
	.RegValue(SYNTHESIZED_WIRE_6),
	.BranchTarget(SYNTHESIZED_WIRE_20));


Mux2to1_32b	b2v_inst5(
	.sel(SYNTHESIZED_WIRE_7),
	.in0(SYNTHESIZED_WIRE_38),
	.in1(SYNTHESIZED_WIRE_9),
	.out(SYNTHESIZED_WIRE_6));


Stack	b2v_inst6(
	.clk(clk),
	.rst(rst),
	.push(SYNTHESIZED_WIRE_10),
	.pop(SYNTHESIZED_WIRE_11),
	.data_in(IF_ID_PC),
	
	
	.data_out(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst6.STACK_DEPTH = 32;


Extend_8to32	b2v_inst7(
	.immediate(SYNTHESIZED_WIRE_12),
	.signExtImm(SYNTHESIZED_WIRE_9));


ID_EX_Register	b2v_inst8(
	.clk(clk),
	.rst(rst),
	.inMemToReg(SYNTHESIZED_WIRE_13),
	.inRegWrite(SYNTHESIZED_WIRE_14),
	.inBranch(SYNTHESIZED_WIRE_15),
	.inMemRead(SYNTHESIZED_WIRE_16),
	.inMemWrite(SYNTHESIZED_WIRE_17),
	.inALUSrc(SYNTHESIZED_WIRE_18),
	.inALUOp(SYNTHESIZED_WIRE_19),
	.inBranchTarget(SYNTHESIZED_WIRE_20),
	.inReadData1(SYNTHESIZED_WIRE_38),
	.inReadData2(SYNTHESIZED_WIRE_22),
	.inRegSrc1(SYNTHESIZED_WIRE_35),
	.inSignExtImm(SYNTHESIZED_WIRE_37),
	.inWriteReg(SYNTHESIZED_WIRE_36),
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
	.outWriteReg(ID_EX_WriteReg));


ControlMux	b2v_inst9(
	.inBranchMode(SYNTHESIZED_WIRE_26),
	.inBranchSrc(SYNTHESIZED_WIRE_27),
	.inBranch(SYNTHESIZED_WIRE_28),
	.inMemRead(SYNTHESIZED_WIRE_29),
	.inMemToReg(SYNTHESIZED_WIRE_30),
	.inMemWrite(SYNTHESIZED_WIRE_31),
	.inALUSrc(SYNTHESIZED_WIRE_32),
	.inRegWrite(SYNTHESIZED_WIRE_33),
	.holdControl(HD_HoldControl),
	.inALUOp(SYNTHESIZED_WIRE_34),
	.outBranchMode(SYNTHESIZED_WIRE_4),
	.outBranchSrc(SYNTHESIZED_WIRE_7),
	.outBranch(SYNTHESIZED_WIRE_15),
	.outMemRead(SYNTHESIZED_WIRE_16),
	.outMemToReg(SYNTHESIZED_WIRE_13),
	.outMemWrite(SYNTHESIZED_WIRE_17),
	.outALUSrc(SYNTHESIZED_WIRE_18),
	.outRegWrite(SYNTHESIZED_WIRE_14),
	.outALUOp(SYNTHESIZED_WIRE_19));


endmodule
