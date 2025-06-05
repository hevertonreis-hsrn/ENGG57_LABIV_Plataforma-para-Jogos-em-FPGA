
module EmbarcadoVGA (
	clk_clk,
	master_conduit_fifo_full,
	master_conduit_fifo_wr_en,
	master_conduit_exportdata,
	master_conduit_pll_locked,
	master_conduit_fifo_used,
	master_conduit_fifo_empty,
	reset_reset_n,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	sw_conduit_export);	

	input		clk_clk;
	input		master_conduit_fifo_full;
	output		master_conduit_fifo_wr_en;
	output	[31:0]	master_conduit_exportdata;
	input		master_conduit_pll_locked;
	input	[8:0]	master_conduit_fifo_used;
	input		master_conduit_fifo_empty;
	input		reset_reset_n;
	output	[12:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[31:0]	sdram_dq;
	output	[3:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	input	[3:0]	sw_conduit_export;
endmodule
