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
// CREATED		"Mon May 12 00:09:30 2025"

module ModuloVgaController(
	CLOCK_50,
	KEY,
	outRequest,
	VGA_HS,
	VGA_VS,
	VGA_BLANK_N,
	VGA_SYNC_N,
	VGA_CLK,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CS_N,
	DRAM_RAS_N,
	DRAM_WE_N,
	DRAM_ADDR,
	DRAM_BA,
	DRAM_DQ,
	DRAM_DQM,
	outX,
	outY,
	VGA_B,
	VGA_G,
	VGA_R
);


input wire	CLOCK_50;
input wire	[0:0] KEY;
output wire	outRequest;
output wire	VGA_HS;
output wire	VGA_VS;
output wire	VGA_BLANK_N;
output wire	VGA_SYNC_N;
output wire	VGA_CLK;
output wire	DRAM_CAS_N;
output wire	DRAM_CKE;
output wire	DRAM_CS_N;
output wire	DRAM_RAS_N;
output wire	DRAM_WE_N;
output wire	[12:0] DRAM_ADDR;
output wire	[1:0] DRAM_BA;
inout wire	[31:0] DRAM_DQ;
output wire	[3:0] DRAM_DQM;
output wire	[9:0] outX;
output wire	[9:0] outY;
output wire	[7:0] VGA_B;
output wire	[7:0] VGA_G;
output wire	[7:0] VGA_R;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_11;





clkDivider	b2v_inst(
	.inclk0(CLOCK_50),
	.c0(SYNTHESIZED_WIRE_13),
	.c1(SYNTHESIZED_WIRE_12),
	.locked(SYNTHESIZED_WIRE_6));


vgaController	b2v_inst1(
	.fifo_empty(SYNTHESIZED_WIRE_0),
	.fifo_full(SYNTHESIZED_WIRE_1),
	.clk25(SYNTHESIZED_WIRE_12),
	.rstN(KEY),
	.fifo_data(SYNTHESIZED_WIRE_3),
	.fifo_rd_en(SYNTHESIZED_WIRE_9),
	.outRequest(outRequest),
	.hs(VGA_HS),
	.vs(VGA_VS),
	.vgaClk(VGA_CLK),
	.vgaBlankN(VGA_BLANK_N),
	.vgaSyncN(VGA_SYNC_N),
	.outBlue(VGA_B),
	.outGreen(VGA_G),
	.outRed(VGA_R),
	.outX(outX),
	.outY(outY));
	defparam	b2v_inst1.hBack = 48;
	defparam	b2v_inst1.hDisplay = 640;
	defparam	b2v_inst1.hFront = 16;
	defparam	b2v_inst1.hSync = 96;
	defparam	b2v_inst1.vBack = 33;
	defparam	b2v_inst1.vDisplay = 480;
	defparam	b2v_inst1.vFront = 10;
	defparam	b2v_inst1.vSync = 2;


EmbarcadoVGA	b2v_inst2(
	.clk_clk(SYNTHESIZED_WIRE_13),
	.master_conduit_1_fifo_full(SYNTHESIZED_WIRE_5),
	.master_conduit_1_pll_locked(SYNTHESIZED_WIRE_6),
	.reset_reset_n(KEY),
	.sdram_dq(DRAM_DQ),
	.master_conduit_1_fifo_wr_en(SYNTHESIZED_WIRE_7),
	.sdram_cas_n(DRAM_CAS_N),
	.sdram_cke(DRAM_CKE),
	.sdram_cs_n(DRAM_CS_N),
	.sdram_ras_n(DRAM_RAS_N),
	.sdram_we_n(DRAM_WE_N),
	.master_conduit_1_exportdata(SYNTHESIZED_WIRE_11),
	.sdram_addr(DRAM_ADDR),
	.sdram_ba(DRAM_BA),
	
	.sdram_dqm(DRAM_DQM));


fifo_dualClock	b2v_inst3(
	.wrreq(SYNTHESIZED_WIRE_7),
	.wrclk(SYNTHESIZED_WIRE_13),
	.rdreq(SYNTHESIZED_WIRE_9),
	.rdclk(SYNTHESIZED_WIRE_12),
	.data(SYNTHESIZED_WIRE_11),
	.wrfull(SYNTHESIZED_WIRE_5),
	.rdfull(SYNTHESIZED_WIRE_1),
	.rdempty(SYNTHESIZED_WIRE_0),
	.q(SYNTHESIZED_WIRE_3));


endmodule
