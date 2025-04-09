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
// CREATED		"Wed Apr 09 16:47:02 2025"

module ModuloProcessador(
	clk_Mem,
	clk,
	rst
);


input wire	clk_Mem;
input wire	clk;
input wire	rst;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[4:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	[5:0] SYNTHESIZED_WIRE_14;
wire	[7:0] SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	[31:0] SYNTHESIZED_WIRE_17;
wire	[31:0] SYNTHESIZED_WIRE_18;
wire	[4:0] SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[31:0] SYNTHESIZED_WIRE_24;
wire	[31:0] SYNTHESIZED_WIRE_25;
wire	[4:0] SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	[31:0] SYNTHESIZED_WIRE_29;
wire	[31:0] SYNTHESIZED_WIRE_30;
wire	[4:0] SYNTHESIZED_WIRE_31;





IF_STAGE	b2v_inst(
	.clk_Mem(clk_Mem),
	.clk(clk),
	.rst(rst),
	.PCSrc(SYNTHESIZED_WIRE_0),
	.IF_Flush(SYNTHESIZED_WIRE_1),
	.BranchTarget(SYNTHESIZED_WIRE_2),
	.IF_ID_Inst(SYNTHESIZED_WIRE_4),
	.IF_ID_PC(SYNTHESIZED_WIRE_5));


ID_STAGE	b2v_inst2(
	.clk(clk),
	.rst(rst),
	.RegWrite(SYNTHESIZED_WIRE_3),
	.clk_Mem(clk_Mem),
	.IF_ID_Inst(SYNTHESIZED_WIRE_4),
	.IF_ID_PC(SYNTHESIZED_WIRE_5),
	.WriteData(SYNTHESIZED_WIRE_6),
	.WriteReg(SYNTHESIZED_WIRE_7),
	.ID_EX_MemToReg(SYNTHESIZED_WIRE_8),
	.ID_EX_RegWrite(SYNTHESIZED_WIRE_9),
	.ID_EX_Branch(SYNTHESIZED_WIRE_10),
	.ID_EX_MemRead(SYNTHESIZED_WIRE_11),
	.ID_EX_MemWrite(SYNTHESIZED_WIRE_12),
	.ID_EX_ALUSrc(SYNTHESIZED_WIRE_13),
	.IF_Flush(SYNTHESIZED_WIRE_1),
	.ID_EX_ALUOp(SYNTHESIZED_WIRE_14),
	.ID_EX_BranchTarget(SYNTHESIZED_WIRE_15),
	.ID_EX_ReadData1(SYNTHESIZED_WIRE_16),
	.ID_EX_ReadData2(SYNTHESIZED_WIRE_17),
	.ID_EX_SignExtImm(SYNTHESIZED_WIRE_18),
	.ID_EX_WriteReg(SYNTHESIZED_WIRE_19));


EX_STAGE	b2v_inst3(
	.clk(clk),
	.rst(rst),
	.ID_EX_MemToReg(SYNTHESIZED_WIRE_8),
	.ID_EX_RegWrite(SYNTHESIZED_WIRE_9),
	.ID_EX_Branch(SYNTHESIZED_WIRE_10),
	.ID_EX_MemRead(SYNTHESIZED_WIRE_11),
	.ID_EX_MemWrite(SYNTHESIZED_WIRE_12),
	.ID_EX_ALUSrc(SYNTHESIZED_WIRE_13),
	.ID_EX_ALUOp(SYNTHESIZED_WIRE_14),
	.ID_EX_BranchTarget(SYNTHESIZED_WIRE_15),
	.ID_EX_ReadData1(SYNTHESIZED_WIRE_16),
	.ID_EX_ReadData2(SYNTHESIZED_WIRE_17),
	.ID_EX_SignExtImm(SYNTHESIZED_WIRE_18),
	.ID_EX_WriteReg(SYNTHESIZED_WIRE_19),
	.BranchTaken(SYNTHESIZED_WIRE_0),
	.EX_MEM_MemToReg(SYNTHESIZED_WIRE_20),
	.EX_MEM_RegWrite(SYNTHESIZED_WIRE_21),
	.EX_MEM_MemRead(SYNTHESIZED_WIRE_22),
	.EX_MEM_MemWrite(SYNTHESIZED_WIRE_23),
	.BranchTarget(SYNTHESIZED_WIRE_2),
	.EX_MEM_ALUResult(SYNTHESIZED_WIRE_24),
	.EX_MEM_WriteData(SYNTHESIZED_WIRE_25),
	.EX_MEM_WriteReg(SYNTHESIZED_WIRE_26));


MEM_STAGE	b2v_inst4(
	.clk_Mem(clk_Mem),
	.clk(clk),
	.rst(rst),
	.EX_MEM_MemToReg(SYNTHESIZED_WIRE_20),
	.EX_MEM_RegWrite(SYNTHESIZED_WIRE_21),
	.EX_MEM_MemRead(SYNTHESIZED_WIRE_22),
	.EX_MEM_MemWrite(SYNTHESIZED_WIRE_23),
	.EX_MEM_ALUResult(SYNTHESIZED_WIRE_24),
	.EX_MEM_WriteData(SYNTHESIZED_WIRE_25),
	.EX_MEM_WriteReg(SYNTHESIZED_WIRE_26),
	.MEM_WB_RegWrite(SYNTHESIZED_WIRE_27),
	.MEM_WB_MemToReg(SYNTHESIZED_WIRE_28),
	.MEM_WB_ALUResult(SYNTHESIZED_WIRE_29),
	.MEM_WB_ReadData(SYNTHESIZED_WIRE_30),
	.MEM_WB_WriteReg(SYNTHESIZED_WIRE_31));


WB_STAGE	b2v_inst5(
	.MEM_WB_RegWrite(SYNTHESIZED_WIRE_27),
	.MEM_WB_MemToReg(SYNTHESIZED_WIRE_28),
	.MEM_WB_ALUResult(SYNTHESIZED_WIRE_29),
	.MEM_WB_ReadData(SYNTHESIZED_WIRE_30),
	.MEM_WB_WriteReg(SYNTHESIZED_WIRE_31),
	.RegWrite(SYNTHESIZED_WIRE_3),
	.WriteData(SYNTHESIZED_WIRE_6),
	.WriteReg(SYNTHESIZED_WIRE_7));


endmodule
