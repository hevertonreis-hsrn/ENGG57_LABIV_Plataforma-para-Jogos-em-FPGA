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
// CREATED		"Mon Apr 28 13:46:00 2025"

module CPU(
	i_waitrequest,
	clk,
	reset_n,
	d_waitrequest,
	d_readdata,
	i_readdata,
	i_read,
	d_read,
	d_write,
	d_address,
	d_writedata,
	i_address
);


input wire	i_waitrequest;
input wire	clk;
input wire	reset_n;
input wire	d_waitrequest;
input wire	[31:0] d_readdata;
input wire	[31:0] i_readdata;
output wire	i_read;
output wire	d_read;
output wire	d_write;
output wire	[31:0] d_address;
output wire	[31:0] d_writedata;
output wire	[31:0] i_address;

wire	SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_73;
wire	SYNTHESIZED_WIRE_74;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_75;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[31:0] SYNTHESIZED_WIRE_14;
wire	[4:0] SYNTHESIZED_WIRE_76;
wire	SYNTHESIZED_WIRE_77;
wire	[4:0] SYNTHESIZED_WIRE_78;
wire	[4:0] SYNTHESIZED_WIRE_18;
wire	[4:0] SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_79;
wire	SYNTHESIZED_WIRE_80;
wire	[4:0] SYNTHESIZED_WIRE_81;
wire	[4:0] SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_32;
wire	[31:0] SYNTHESIZED_WIRE_33;
wire	[31:0] SYNTHESIZED_WIRE_34;
wire	[31:0] SYNTHESIZED_WIRE_82;
wire	[4:0] SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	[31:0] SYNTHESIZED_WIRE_83;
wire	[1:0] SYNTHESIZED_WIRE_46;
wire	[1:0] SYNTHESIZED_WIRE_47;
wire	[5:0] SYNTHESIZED_WIRE_48;
wire	[31:0] SYNTHESIZED_WIRE_49;
wire	[31:0] SYNTHESIZED_WIRE_50;
wire	[31:0] SYNTHESIZED_WIRE_51;
wire	[31:0] SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_61;
wire	[31:0] SYNTHESIZED_WIRE_63;
wire	[31:0] SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_68;
wire	[31:0] SYNTHESIZED_WIRE_69;
wire	[31:0] SYNTHESIZED_WIRE_70;





IF_STAGE	b2v_inst(
	.clk(SYNTHESIZED_WIRE_72),
	.rst(SYNTHESIZED_WIRE_73),
	.PCSrc(SYNTHESIZED_WIRE_74),
	.IF_Flush(SYNTHESIZED_WIRE_74),
	.HD_HoldPC(SYNTHESIZED_WIRE_4),
	.HD_Hold_IF_ID(SYNTHESIZED_WIRE_5),
	.ready(SYNTHESIZED_WIRE_75),
	.BranchTarget(SYNTHESIZED_WIRE_7),
	.read_data(SYNTHESIZED_WIRE_8),
	.start_read(SYNTHESIZED_WIRE_9),
	.outAddress(SYNTHESIZED_WIRE_10),
	.outInstruction(SYNTHESIZED_WIRE_33),
	.outPC(SYNTHESIZED_WIRE_34));
	defparam	b2v_inst.START_READ = 1'b1;
	defparam	b2v_inst.WAIT_READY = 1'b0;


AvalonMM_Master_InstInterface	b2v_inst1(
	.clk(clk),
	.reset_n(reset_n),
	.i_waitrequest(i_waitrequest),
	.start_read(SYNTHESIZED_WIRE_9),
	.i_readdata(i_readdata),
	.in_address(SYNTHESIZED_WIRE_10),
	.i_read(i_read),
	.ready(SYNTHESIZED_WIRE_75),
	.i_address(i_address),
	.read_data(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst1.DONE_STATE = 2'b10;
	defparam	b2v_inst1.IDLE_STATE = 2'b00;
	defparam	b2v_inst1.WAIT_STATE = 2'b01;


WB_STAGE	b2v_inst11(
	.MEM_WB_MemToReg(SYNTHESIZED_WIRE_11),
	.MEM_WB_RegWrite(SYNTHESIZED_WIRE_12),
	.MEM_WB_ALUResult(SYNTHESIZED_WIRE_13),
	.MEM_WB_ReadData(SYNTHESIZED_WIRE_14),
	.MEM_WB_WriteReg(SYNTHESIZED_WIRE_76),
	.RegWrite(SYNTHESIZED_WIRE_80),
	.WriteData(SYNTHESIZED_WIRE_82),
	.WriteReg(SYNTHESIZED_WIRE_36));


HazardDetectionUnit	b2v_inst12(
	.ID_EX_MemRead(SYNTHESIZED_WIRE_77),
	.ID_EX_WriteReg(SYNTHESIZED_WIRE_78),
	.r1(SYNTHESIZED_WIRE_18),
	.r2(SYNTHESIZED_WIRE_19),
	.HD_Hold_IF_ID(SYNTHESIZED_WIRE_5),
	.HD_HoldPC(SYNTHESIZED_WIRE_4),
	.HD_HoldControl(SYNTHESIZED_WIRE_30));


ForwardingUnit	b2v_inst13(
	.EX_MEM_RegWrite(SYNTHESIZED_WIRE_79),
	.MEM_WB_RegWrite(SYNTHESIZED_WIRE_80),
	.EX_MEM_rd(SYNTHESIZED_WIRE_81),
	.ID_EX_rs1(SYNTHESIZED_WIRE_23),
	.ID_EX_rs2(SYNTHESIZED_WIRE_78),
	.MEM_WB_rd(SYNTHESIZED_WIRE_76),
	.ForwardA(SYNTHESIZED_WIRE_46),
	.ForwardB(SYNTHESIZED_WIRE_47));


PLL	b2v_inst2(
	.inclk0(clk),
	.areset(SYNTHESIZED_WIRE_26),
	.c0(SYNTHESIZED_WIRE_72));


ResetSync	b2v_inst3(
	.clk(SYNTHESIZED_WIRE_72),
	.rst_async(reset_n),
	.rst_sync(SYNTHESIZED_WIRE_73));

assign	SYNTHESIZED_WIRE_26 =  ~reset_n;


ID_STAGE	b2v_inst5(
	.clk_50(clk),
	.clk(SYNTHESIZED_WIRE_72),
	.rst(SYNTHESIZED_WIRE_73),
	.HD_HoldControl(SYNTHESIZED_WIRE_30),
	.RegWrite(SYNTHESIZED_WIRE_80),
	.MemoryStall(SYNTHESIZED_WIRE_32),
	.IF_ID_Inst(SYNTHESIZED_WIRE_33),
	.IF_ID_PC(SYNTHESIZED_WIRE_34),
	.WriteData(SYNTHESIZED_WIRE_82),
	.WriteReg(SYNTHESIZED_WIRE_36),
	.ID_EX_MemToReg(SYNTHESIZED_WIRE_39),
	.ID_EX_RegWrite(SYNTHESIZED_WIRE_40),
	.ID_EX_MemRead(SYNTHESIZED_WIRE_77),
	.ID_EX_MemWrite(SYNTHESIZED_WIRE_42),
	.ID_EX_Branch(SYNTHESIZED_WIRE_43),
	.ID_EX_ALUSrc(SYNTHESIZED_WIRE_44),
	.ID_EX_ALUOp(SYNTHESIZED_WIRE_48),
	.ID_EX_BranchTarget(SYNTHESIZED_WIRE_49),
	.ID_EX_ReadData1(SYNTHESIZED_WIRE_50),
	.ID_EX_ReadData2(SYNTHESIZED_WIRE_51),
	.ID_EX_Rs(SYNTHESIZED_WIRE_23),
	.ID_EX_SignExtImm(SYNTHESIZED_WIRE_52),
	.ID_EX_WriteReg(SYNTHESIZED_WIRE_78),
	.r1(SYNTHESIZED_WIRE_18),
	.r2(SYNTHESIZED_WIRE_19));


EX_STAGE	b2v_inst6(
	.clk(SYNTHESIZED_WIRE_72),
	.rst(SYNTHESIZED_WIRE_73),
	.ID_EX_MemToReg(SYNTHESIZED_WIRE_39),
	.ID_EX_RegWrite(SYNTHESIZED_WIRE_40),
	.ID_EX_MemRead(SYNTHESIZED_WIRE_77),
	.ID_EX_MemWrite(SYNTHESIZED_WIRE_42),
	.ID_EX_Branch(SYNTHESIZED_WIRE_43),
	.ID_EX_ALUSrc(SYNTHESIZED_WIRE_44),
	.EX_Data(SYNTHESIZED_WIRE_83),
	.ForwardA(SYNTHESIZED_WIRE_46),
	.ForwardB(SYNTHESIZED_WIRE_47),
	.ID_EX_ALUOp(SYNTHESIZED_WIRE_48),
	.ID_EX_BranchTarget(SYNTHESIZED_WIRE_49),
	.ID_EX_ReadData1(SYNTHESIZED_WIRE_50),
	.ID_EX_ReadData2(SYNTHESIZED_WIRE_51),
	.ID_EX_SignExtImm(SYNTHESIZED_WIRE_52),
	.ID_EX_WriteReg(SYNTHESIZED_WIRE_78),
	.MEM_Data(SYNTHESIZED_WIRE_82),
	.BranchTaken(SYNTHESIZED_WIRE_74),
	.EX_MEM_MemToReg(SYNTHESIZED_WIRE_57),
	.EX_MEM_RegWrite(SYNTHESIZED_WIRE_79),
	.EX_MEM_MemRead(SYNTHESIZED_WIRE_59),
	.EX_MEM_MemWrite(SYNTHESIZED_WIRE_60),
	.BranchTarget(SYNTHESIZED_WIRE_7),
	.EX_MEM_ALUResult(SYNTHESIZED_WIRE_83),
	.EX_MEM_WriteData(SYNTHESIZED_WIRE_63),
	.EX_MEM_WriteReg(SYNTHESIZED_WIRE_81));


MEM_STAGE	b2v_inst7(
	.clk(SYNTHESIZED_WIRE_72),
	.rst(SYNTHESIZED_WIRE_73),
	.EX_MEM_MemToReg(SYNTHESIZED_WIRE_57),
	.EX_MEM_RegWrite(SYNTHESIZED_WIRE_79),
	.EX_MEM_MemRead(SYNTHESIZED_WIRE_59),
	.EX_MEM_MemWrite(SYNTHESIZED_WIRE_60),
	.ready(SYNTHESIZED_WIRE_61),
	.EX_MEM_ALUResult(SYNTHESIZED_WIRE_83),
	.EX_MEM_WriteData(SYNTHESIZED_WIRE_63),
	.EX_MEM_WriteReg(SYNTHESIZED_WIRE_81),
	.read_data(SYNTHESIZED_WIRE_65),
	.MEM_WB_MemToReg(SYNTHESIZED_WIRE_11),
	.MEM_WB_RegWrite(SYNTHESIZED_WIRE_12),
	.MemRead(SYNTHESIZED_WIRE_66),
	.MemWrite(SYNTHESIZED_WIRE_67),
	.start_access(SYNTHESIZED_WIRE_68),
	.MEM_WB_ALUResult(SYNTHESIZED_WIRE_13),
	.MEM_WB_ReadData(SYNTHESIZED_WIRE_14),
	.MEM_WB_WriteReg(SYNTHESIZED_WIRE_76),
	.outAddress(SYNTHESIZED_WIRE_69),
	.outWriteData(SYNTHESIZED_WIRE_70));


AvalonMM_Master_Data_Interface	b2v_inst8(
	.clk(clk),
	.reset_n(reset_n),
	.d_waitrequest(d_waitrequest),
	.MemRead(SYNTHESIZED_WIRE_66),
	.MemWrite(SYNTHESIZED_WIRE_67),
	.start_access(SYNTHESIZED_WIRE_68),
	.d_readdata(d_readdata),
	.in_address(SYNTHESIZED_WIRE_69),
	.write_data(SYNTHESIZED_WIRE_70),
	.d_read(d_read),
	.d_write(d_write),
	.ready(SYNTHESIZED_WIRE_61),
	.d_address(d_address),
	.d_writedata(d_writedata),
	.read_data(SYNTHESIZED_WIRE_65));
	defparam	b2v_inst8.DONE_STATE = 2'b10;
	defparam	b2v_inst8.IDLE_STATE = 2'b00;
	defparam	b2v_inst8.WAIT_STATE = 2'b01;


MemoryStallUnit	b2v_inst9(
	.mem_ready(SYNTHESIZED_WIRE_75),
	.memory_stall(SYNTHESIZED_WIRE_32));


endmodule
