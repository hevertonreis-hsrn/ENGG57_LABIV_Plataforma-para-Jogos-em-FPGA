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
// CREATED		"Tue Jun 03 20:39:50 2025"

module ModuloVgaController(
	CLOCK_50,
	KEY,
	SW,
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
	DRAM_CLK,
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
input wire	[3:0] KEY;
input wire	[0:0] SW;
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
output wire	DRAM_CLK;
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
wire	SYNTHESIZED_WIRE_20;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[8:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	[31:0] SYNTHESIZED_WIRE_19;





clkDivider	b2v_inst(
	.inclk0(CLOCK_50),
	.c0(DRAM_CLK),
	.c1(SYNTHESIZED_WIRE_20),
	.c2(SYNTHESIZED_WIRE_21),
	.locked(SYNTHESIZED_WIRE_7));


vgaController	b2v_inst1(
	.fifo_full(SYNTHESIZED_WIRE_0),
	.clk25(SYNTHESIZED_WIRE_20),
	.rstN(SW),
	.inBlue(SYNTHESIZED_WIRE_2),
	.inGreen(SYNTHESIZED_WIRE_3),
	.inRed(SYNTHESIZED_WIRE_4),
	.outRequest(outRequest),
	.preRequest(SYNTHESIZED_WIRE_18),
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
	.clk_clk(SYNTHESIZED_WIRE_21),
	.master_conduit_fifo_full(SYNTHESIZED_WIRE_6),
	.master_conduit_pll_locked(SYNTHESIZED_WIRE_7),
	.master_conduit_fifo_empty(SYNTHESIZED_WIRE_8),
	.reset_reset_n(SW),
	.master_conduit_fifo_used(SYNTHESIZED_WIRE_9),
	.sdram_dq(DRAM_DQ),
	.sw_conduit_export(KEY),
	.master_conduit_fifo_wr_en(SYNTHESIZED_WIRE_10),
	.sdram_cas_n(DRAM_CAS_N),
	.sdram_cke(DRAM_CKE),
	.sdram_cs_n(DRAM_CS_N),
	.sdram_ras_n(DRAM_RAS_N),
	.sdram_we_n(DRAM_WE_N),
	.master_conduit_exportdata(SYNTHESIZED_WIRE_14),
	.sdram_addr(DRAM_ADDR),
	.sdram_ba(DRAM_BA),
	
	.sdram_dqm(DRAM_DQM));


fifo_dualClock	b2v_inst3(
	.wrreq(SYNTHESIZED_WIRE_10),
	.wrclk(SYNTHESIZED_WIRE_21),
	.rdreq(SYNTHESIZED_WIRE_12),
	.rdclk(SYNTHESIZED_WIRE_20),
	.data(SYNTHESIZED_WIRE_14),
	.wrfull(SYNTHESIZED_WIRE_6),
	.wrempty(SYNTHESIZED_WIRE_8),
	.rdfull(SYNTHESIZED_WIRE_17),
	.rdempty(SYNTHESIZED_WIRE_16),
	.q(SYNTHESIZED_WIRE_19),
	.wrusedw(SYNTHESIZED_WIRE_9));


fifoToRgbStream	b2v_inst4(
	.clk(SYNTHESIZED_WIRE_20),
	.rstN(SW),
	.fifo_empty(SYNTHESIZED_WIRE_16),
	.fifo_full(SYNTHESIZED_WIRE_17),
	.vga_request(SYNTHESIZED_WIRE_18),
	.fifo_data(SYNTHESIZED_WIRE_19),
	.w_fifo_full(SYNTHESIZED_WIRE_0),
	.fifo_rd_en(SYNTHESIZED_WIRE_12),
	.outBlue(SYNTHESIZED_WIRE_2),
	.outGreen(SYNTHESIZED_WIRE_3),
	.outRed(SYNTHESIZED_WIRE_4));


endmodule
