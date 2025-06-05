	EmbarcadoVGA u0 (
		.clk_clk                   (<connected-to-clk_clk>),                   //            clk.clk
		.master_conduit_fifo_full  (<connected-to-master_conduit_fifo_full>),  // master_conduit.fifo_full
		.master_conduit_fifo_wr_en (<connected-to-master_conduit_fifo_wr_en>), //               .fifo_wr_en
		.master_conduit_exportdata (<connected-to-master_conduit_exportdata>), //               .exportdata
		.master_conduit_pll_locked (<connected-to-master_conduit_pll_locked>), //               .pll_locked
		.master_conduit_fifo_used  (<connected-to-master_conduit_fifo_used>),  //               .fifo_used
		.master_conduit_fifo_empty (<connected-to-master_conduit_fifo_empty>), //               .fifo_empty
		.reset_reset_n             (<connected-to-reset_reset_n>),             //          reset.reset_n
		.sdram_addr                (<connected-to-sdram_addr>),                //          sdram.addr
		.sdram_ba                  (<connected-to-sdram_ba>),                  //               .ba
		.sdram_cas_n               (<connected-to-sdram_cas_n>),               //               .cas_n
		.sdram_cke                 (<connected-to-sdram_cke>),                 //               .cke
		.sdram_cs_n                (<connected-to-sdram_cs_n>),                //               .cs_n
		.sdram_dq                  (<connected-to-sdram_dq>),                  //               .dq
		.sdram_dqm                 (<connected-to-sdram_dqm>),                 //               .dqm
		.sdram_ras_n               (<connected-to-sdram_ras_n>),               //               .ras_n
		.sdram_we_n                (<connected-to-sdram_we_n>),                //               .we_n
		.sw_conduit_export         (<connected-to-sw_conduit_export>)          //     sw_conduit.export
	);

