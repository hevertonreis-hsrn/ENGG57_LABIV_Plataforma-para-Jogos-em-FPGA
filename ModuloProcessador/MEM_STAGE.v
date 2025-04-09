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
// CREATED		"Wed Apr 09 16:40:26 2025"

module MEM_STAGE(
	clk,
	EX_MEM_MemWrite,
	EX_MEM_MemRead,
	rst,
	EX_MEM_MemToReg,
	EX_MEM_RegWrite,
	clk_Mem,
	EX_MEM_ALUResult,
	EX_MEM_WriteData,
	EX_MEM_WriteReg,
	MEM_WB_MemToReg,
	MEM_WB_RegWrite,
	MEM_WB_ALUResult,
	MEM_WB_ReadData,
	MEM_WB_WriteReg
);


input wire	clk;
input wire	EX_MEM_MemWrite;
input wire	EX_MEM_MemRead;
input wire	rst;
input wire	EX_MEM_MemToReg;
input wire	EX_MEM_RegWrite;
input wire	clk_Mem;
input wire	[31:0] EX_MEM_ALUResult;
input wire	[31:0] EX_MEM_WriteData;
input wire	[4:0] EX_MEM_WriteReg;
output wire	MEM_WB_MemToReg;
output wire	MEM_WB_RegWrite;
output wire	[31:0] MEM_WB_ALUResult;
output wire	[31:0] MEM_WB_ReadData;
output wire	[4:0] MEM_WB_WriteReg;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;





MEM_WB_Register	b2v_inst1(
	.clk(clk),
	.rst(rst),
	.inMemToReg(EX_MEM_MemToReg),
	.inRegWrite(EX_MEM_RegWrite),
	.inALUResult(EX_MEM_ALUResult),
	.inReadData(SYNTHESIZED_WIRE_0),
	.inWriteReg(EX_MEM_WriteReg),
	.outRegWrite(MEM_WB_RegWrite),
	.outMemToReg(MEM_WB_MemToReg),
	.outALUResult(MEM_WB_ALUResult),
	.outReadData(MEM_WB_ReadData),
	.outWriteReg(MEM_WB_WriteReg));


RAM	b2v_inst2(
	.wren(EX_MEM_MemWrite),
	.rden(EX_MEM_MemRead),
	.clock(clk_Mem),
	.address(SYNTHESIZED_WIRE_1),
	.data(EX_MEM_WriteData),
	.q(SYNTHESIZED_WIRE_0));


MemAddressFormat	b2v_inst3(
	.data_in(EX_MEM_ALUResult),
	.data_out(SYNTHESIZED_WIRE_1));


endmodule
