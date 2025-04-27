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
// CREATED		"Wed Apr 09 16:46:42 2025"

module WB_STAGE(
	MEM_WB_MemToReg,
	MEM_WB_RegWrite,
	MEM_WB_ALUResult,
	MEM_WB_ReadData,
	MEM_WB_WriteReg,
	RegWrite,
	WriteData,
	WriteReg
);


input wire	MEM_WB_MemToReg;
input wire	MEM_WB_RegWrite;
input wire	[31:0] MEM_WB_ALUResult;
input wire	[31:0] MEM_WB_ReadData;
input wire	[4:0] MEM_WB_WriteReg;
output wire	RegWrite;
output wire	[31:0] WriteData;
output wire	[4:0] WriteReg;


assign	RegWrite = MEM_WB_RegWrite;
assign	WriteReg = MEM_WB_WriteReg;




Mux2to1_32b	b2v_inst(
	.sel(MEM_WB_MemToReg),
	.in0(MEM_WB_ALUResult),
	.in1(MEM_WB_ReadData),
	.out(WriteData));


endmodule
