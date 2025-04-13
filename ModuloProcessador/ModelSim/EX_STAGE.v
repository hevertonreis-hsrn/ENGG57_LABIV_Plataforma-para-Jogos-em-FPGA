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
// CREATED		"Sun Apr 13 17:05:00 2025"

module EX_STAGE(
	clk,
	rst,
	ID_EX_ALUSrc,
	ID_EX_Branch,
	ID_EX_MemToReg,
	ID_EX_RegWrite,
	ID_EX_MemRead,
	ID_EX_MemWrite,
	EX_Data,
	FowardA,
	FowardB,
	ID_EX_ALUOp,
	ID_EX_BranchTarget,
	ID_EX_ReadData1,
	ID_EX_ReadData2,
	ID_EX_SignExtImm,
	ID_EX_WriteReg,
	MEM_Data,
	BranchTaken,
	EX_MEM_MemToReg,
	EX_MEM_RegWrite,
	EX_MEM_MemRead,
	EX_MEM_MemWrite,
	BranchTarget,
	EX_MEM_ALUResult,
	EX_MEM_WriteData,
	EX_MEM_WriteReg
);


input wire	clk;
input wire	rst;
input wire	ID_EX_ALUSrc;
input wire	ID_EX_Branch;
input wire	ID_EX_MemToReg;
input wire	ID_EX_RegWrite;
input wire	ID_EX_MemRead;
input wire	ID_EX_MemWrite;
input wire	[31:0] EX_Data;
input wire	[1:0] FowardA;
input wire	[1:0] FowardB;
input wire	[5:0] ID_EX_ALUOp;
input wire	[7:0] ID_EX_BranchTarget;
input wire	[31:0] ID_EX_ReadData1;
input wire	[31:0] ID_EX_ReadData2;
input wire	[31:0] ID_EX_SignExtImm;
input wire	[4:0] ID_EX_WriteReg;
input wire	[31:0] MEM_Data;
output wire	BranchTaken;
output wire	EX_MEM_MemToReg;
output wire	EX_MEM_RegWrite;
output wire	EX_MEM_MemRead;
output wire	EX_MEM_MemWrite;
output wire	[7:0] BranchTarget;
output wire	[31:0] EX_MEM_ALUResult;
output wire	[31:0] EX_MEM_WriteData;
output wire	[4:0] EX_MEM_WriteReg;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[6:0] SYNTHESIZED_WIRE_3;
wire	[6:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;

assign	BranchTarget = ID_EX_BranchTarget;




ALU	b2v_inst(
	.data1(SYNTHESIZED_WIRE_0),
	.data2(SYNTHESIZED_WIRE_1),
	.Operation(SYNTHESIZED_WIRE_2),
	.RFlagsStored(SYNTHESIZED_WIRE_3),
	.Zero(SYNTHESIZED_WIRE_5),
	.Result(SYNTHESIZED_WIRE_6),
	.RFlagsOut(SYNTHESIZED_WIRE_4));


RFlagsRegister	b2v_inst1(
	.clk(clk),
	.rst(rst),
	.RFlags_in(SYNTHESIZED_WIRE_4),
	.RFlags_out(SYNTHESIZED_WIRE_3));


ALUControl	b2v_inst2(
	.ALUOp(ID_EX_ALUOp),
	.Operation(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst2.ADD = 6'b000110;
	defparam	b2v_inst2.AND = 6'b001010;
	defparam	b2v_inst2.BRFL = 6'b010010;
	defparam	b2v_inst2.CALL = 6'b010011;
	defparam	b2v_inst2.CMP = 6'b001110;
	defparam	b2v_inst2.DIV = 6'b001001;
	defparam	b2v_inst2.JPC = 6'b010001;
	defparam	b2v_inst2.JR = 6'b010000;
	defparam	b2v_inst2.LW_1 = 6'b000000;
	defparam	b2v_inst2.LW_2 = 6'b000001;
	defparam	b2v_inst2.LW_3 = 6'b000010;
	defparam	b2v_inst2.MOV = 6'b000101;
	defparam	b2v_inst2.MUL = 6'b001000;
	defparam	b2v_inst2.NOP = 6'b010101;
	defparam	b2v_inst2.NOT = 6'b001111;
	defparam	b2v_inst2.OR = 6'b001011;
	defparam	b2v_inst2.RET = 6'b010100;
	defparam	b2v_inst2.SHL = 6'b001100;
	defparam	b2v_inst2.SHR = 6'b001101;
	defparam	b2v_inst2.SUB = 6'b000111;
	defparam	b2v_inst2.SW_1 = 6'b000011;
	defparam	b2v_inst2.SW_2 = 6'b000100;


Mux2to1_32b	b2v_inst3(
	.sel(ID_EX_ALUSrc),
	.in0(ID_EX_ReadData2),
	.in1(ID_EX_SignExtImm),
	.out(SYNTHESIZED_WIRE_7));

assign	BranchTaken = ID_EX_Branch & SYNTHESIZED_WIRE_5;


EX_MEM_Register	b2v_inst5(
	.clk(clk),
	.rst(rst),
	.inMemToReg(ID_EX_MemToReg),
	.inRegWrite(ID_EX_RegWrite),
	.inMemRead(ID_EX_MemRead),
	.inMemWrite(ID_EX_MemWrite),
	.inALUResult(SYNTHESIZED_WIRE_6),
	.inWriteData(ID_EX_ReadData2),
	.inWriteReg(ID_EX_WriteReg),
	.outMemToReg(EX_MEM_MemToReg),
	.outRegWrite(EX_MEM_RegWrite),
	.outMemRead(EX_MEM_MemRead),
	.outMemWrite(EX_MEM_MemWrite),
	.outALUResult(EX_MEM_ALUResult),
	.outWriteData(EX_MEM_WriteData),
	.outWriteReg(EX_MEM_WriteReg));


ForwardingMux	b2v_inst6(
	.exData(EX_Data),
	.memData(MEM_Data),
	.regData(ID_EX_ReadData1),
	.sel(FowardA),
	.out(SYNTHESIZED_WIRE_0));


ForwardingMux	b2v_inst7(
	.exData(EX_Data),
	.memData(MEM_Data),
	.regData(SYNTHESIZED_WIRE_7),
	.sel(FowardB),
	.out(SYNTHESIZED_WIRE_1));


endmodule
