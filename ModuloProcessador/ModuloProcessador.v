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
// CREATED		"Wed Apr 16 14:53:11 2025"

module ModuloProcessador(
	clk_Mem,
	clk,
	rst
);


input wire	clk_Mem;
input wire	clk;
input wire	rst;

wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_50;
wire	[4:0] SYNTHESIZED_WIRE_51;
wire	[4:0] SYNTHESIZED_WIRE_7;
wire	[4:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[7:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_53;
wire	[4:0] SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	[31:0] SYNTHESIZED_WIRE_54;
wire	[1:0] SYNTHESIZED_WIRE_22;
wire	[1:0] SYNTHESIZED_WIRE_23;
wire	[5:0] SYNTHESIZED_WIRE_24;
wire	[7:0] SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_26;
wire	[31:0] SYNTHESIZED_WIRE_27;
wire	[31:0] SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	[31:0] SYNTHESIZED_WIRE_36;
wire	[4:0] SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	[31:0] SYNTHESIZED_WIRE_40;
wire	[31:0] SYNTHESIZED_WIRE_41;
wire	[4:0] SYNTHESIZED_WIRE_57;
wire	[4:0] SYNTHESIZED_WIRE_46;





IF_STAGE	b2v_inst(
	.clk_Mem(clk_Mem),
	.clk(clk),
	.rst(rst),
	.PCSrc(SYNTHESIZED_WIRE_49),
	.HD_HoldPC(SYNTHESIZED_WIRE_1),
	.HD_Hold_IF_ID(SYNTHESIZED_WIRE_2),
	.IF_Flush(SYNTHESIZED_WIRE_49),
	.BranchTarget(SYNTHESIZED_WIRE_4),
	.IF_ID_Inst(SYNTHESIZED_WIRE_11),
	.IF_ID_PC(SYNTHESIZED_WIRE_12));


HazardDetectionUnit	b2v_inst1(
	.ID_EX_MemRead(SYNTHESIZED_WIRE_50),
	.ID_EX_WriteReg(SYNTHESIZED_WIRE_51),
	.r1(SYNTHESIZED_WIRE_7),
	.r2(SYNTHESIZED_WIRE_8),
	.HD_HoldPC(SYNTHESIZED_WIRE_1),
	.HD_Hold_IF_ID(SYNTHESIZED_WIRE_2),
	.HD_HoldControl(SYNTHESIZED_WIRE_10));


ID_STAGE	b2v_inst2(
	.clk(clk),
	.rst(rst),
	.RegWrite(SYNTHESIZED_WIRE_52),
	.clk_Mem(clk_Mem),
	.HD_HoldControl(SYNTHESIZED_WIRE_10),
	.IF_ID_Inst(SYNTHESIZED_WIRE_11),
	.IF_ID_PC(SYNTHESIZED_WIRE_12),
	.WriteData(SYNTHESIZED_WIRE_53),
	.WriteReg(SYNTHESIZED_WIRE_14),
	.ID_EX_MemToReg(SYNTHESIZED_WIRE_15),
	.ID_EX_RegWrite(SYNTHESIZED_WIRE_16),
	.ID_EX_Branch(SYNTHESIZED_WIRE_17),
	.ID_EX_MemRead(SYNTHESIZED_WIRE_50),
	.ID_EX_MemWrite(SYNTHESIZED_WIRE_19),
	.ID_EX_ALUSrc(SYNTHESIZED_WIRE_20),
	.ID_EX_ALUOp(SYNTHESIZED_WIRE_24),
	.ID_EX_BranchTarget(SYNTHESIZED_WIRE_25),
	.ID_EX_ReadData1(SYNTHESIZED_WIRE_26),
	.ID_EX_ReadData2(SYNTHESIZED_WIRE_27),
	.ID_EX_Rs(SYNTHESIZED_WIRE_46),
	.ID_EX_SignExtImm(SYNTHESIZED_WIRE_28),
	.ID_EX_WriteReg(SYNTHESIZED_WIRE_51),
	.r1(SYNTHESIZED_WIRE_7),
	.r2(SYNTHESIZED_WIRE_8));


EX_STAGE	b2v_inst3(
	.clk(clk),
	.rst(rst),
	.ID_EX_MemToReg(SYNTHESIZED_WIRE_15),
	.ID_EX_RegWrite(SYNTHESIZED_WIRE_16),
	.ID_EX_Branch(SYNTHESIZED_WIRE_17),
	.ID_EX_MemRead(SYNTHESIZED_WIRE_50),
	.ID_EX_MemWrite(SYNTHESIZED_WIRE_19),
	.ID_EX_ALUSrc(SYNTHESIZED_WIRE_20),
	.EX_Data(SYNTHESIZED_WIRE_54),
	.FowardA(SYNTHESIZED_WIRE_22),
	.FowardB(SYNTHESIZED_WIRE_23),
	.ID_EX_ALUOp(SYNTHESIZED_WIRE_24),
	.ID_EX_BranchTarget(SYNTHESIZED_WIRE_25),
	.ID_EX_ReadData1(SYNTHESIZED_WIRE_26),
	.ID_EX_ReadData2(SYNTHESIZED_WIRE_27),
	.ID_EX_SignExtImm(SYNTHESIZED_WIRE_28),
	.ID_EX_WriteReg(SYNTHESIZED_WIRE_51),
	.MEM_Data(SYNTHESIZED_WIRE_53),
	.BranchTaken(SYNTHESIZED_WIRE_49),
	.EX_MEM_MemToReg(SYNTHESIZED_WIRE_31),
	.EX_MEM_RegWrite(SYNTHESIZED_WIRE_55),
	.EX_MEM_MemRead(SYNTHESIZED_WIRE_33),
	.EX_MEM_MemWrite(SYNTHESIZED_WIRE_34),
	.BranchTarget(SYNTHESIZED_WIRE_4),
	.EX_MEM_ALUResult(SYNTHESIZED_WIRE_54),
	.EX_MEM_WriteData(SYNTHESIZED_WIRE_36),
	.EX_MEM_WriteReg(SYNTHESIZED_WIRE_56));


MEM_STAGE	b2v_inst4(
	.clk_Mem(clk_Mem),
	.clk(clk),
	.rst(rst),
	.EX_MEM_MemToReg(SYNTHESIZED_WIRE_31),
	.EX_MEM_RegWrite(SYNTHESIZED_WIRE_55),
	.EX_MEM_MemRead(SYNTHESIZED_WIRE_33),
	.EX_MEM_MemWrite(SYNTHESIZED_WIRE_34),
	.EX_MEM_ALUResult(SYNTHESIZED_WIRE_54),
	.EX_MEM_WriteData(SYNTHESIZED_WIRE_36),
	.EX_MEM_WriteReg(SYNTHESIZED_WIRE_56),
	.MEM_WB_RegWrite(SYNTHESIZED_WIRE_38),
	.MEM_WB_MemToReg(SYNTHESIZED_WIRE_39),
	.MEM_WB_ALUResult(SYNTHESIZED_WIRE_40),
	.MEM_WB_ReadData(SYNTHESIZED_WIRE_41),
	.MEM_WB_WriteReg(SYNTHESIZED_WIRE_57));


WB_STAGE	b2v_inst5(
	.MEM_WB_RegWrite(SYNTHESIZED_WIRE_38),
	.MEM_WB_MemToReg(SYNTHESIZED_WIRE_39),
	.MEM_WB_ALUResult(SYNTHESIZED_WIRE_40),
	.MEM_WB_ReadData(SYNTHESIZED_WIRE_41),
	.MEM_WB_WriteReg(SYNTHESIZED_WIRE_57),
	.RegWrite(SYNTHESIZED_WIRE_52),
	.WriteData(SYNTHESIZED_WIRE_53),
	.WriteReg(SYNTHESIZED_WIRE_14));


ForwardingUnit	b2v_inst8(
	.EX_MEM_RegWrite(SYNTHESIZED_WIRE_55),
	.MEM_WB_RegWrite(SYNTHESIZED_WIRE_52),
	.EX_MEM_rd(SYNTHESIZED_WIRE_56),
	.ID_EX_rs1(SYNTHESIZED_WIRE_46),
	.ID_EX_rs2(SYNTHESIZED_WIRE_51),
	.MEM_WB_rd(SYNTHESIZED_WIRE_57),
	.ForwardA(SYNTHESIZED_WIRE_22),
	.ForwardB(SYNTHESIZED_WIRE_23));


endmodule
