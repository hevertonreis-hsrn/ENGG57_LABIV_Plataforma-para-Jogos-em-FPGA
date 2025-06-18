dual_clock_fifo_inst : dual_clock_fifo PORT MAP (
		data	 => data_sig,
		rdclk	 => rdclk_sig,
		rdreq	 => rdreq_sig,
		wrclk	 => wrclk_sig,
		wrreq	 => wrreq_sig,
		q	 => q_sig,
		rdempty	 => rdempty_sig,
		rdfull	 => rdfull_sig,
		wrfull	 => wrfull_sig
	);
