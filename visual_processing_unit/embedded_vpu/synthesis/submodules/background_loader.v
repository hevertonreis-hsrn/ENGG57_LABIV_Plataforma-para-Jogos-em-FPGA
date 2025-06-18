module background_loader (
	input  wire        clk,
	input  wire        reset_n,
	input  wire        waitrequest,
	input  wire        readdatavalid,
	input  wire [31:0] readdata,
	input  wire [31:0] slave_writedata,
	input  wire        slave_write,
	input  wire [7:0 ] slave_address,
	input  wire        pll_locked,
	input  wire 			 fifo_rd_en,
	output wire        read,
	output wire        chipselect,
	output wire [3:0 ] byteenable,
	output wire [29:0] address,
	output wire [4:0 ] burstcount,
	output wire        beginbursttransfer,
	output wire [23:0] exportdata,
	output wire				 bg_fifo_empty,
	output wire				 bg_fifo_full
);

	wire 			  fifo_full_int;
	wire 			  fifo_empty_int;
	wire 			  fifo_wr_en_int;
	wire [8:0 ] fifo_used_int;
	wire [31:0] fifo_q_int;
	
	wire [23:0] rgb_output;  // RRGGBB
	
	assign rgb_output = {fifo_q_int[15:8 ],   // RR
											 fifo_q_int[23:16],  // GG
											 fifo_q_int[31:24]}; // BB
	
	master_interface master_inst (
		.clk                (clk),
		.reset_n            (reset_n),
		.waitrequest        (waitrequest),
		.readdatavalid      (readdatavalid),
		.readdata           (readdata),
		.slave_writedata    (slave_writedata),
		.slave_write        (slave_write),
		.slave_address      (slave_address),
		.read               (read),
		.chipselect         (chipselect),
		.byteenable         (byteenable),
		.address            (address),
		.burstcount         (burstcount),
		.beginbursttransfer (beginbursttransfer),
		.exportdata         (fifo_q_int),
		.fifo_full          (fifo_full_int),
		.fifo_empty         (fifo_empty_int),
		.fifo_used          (fifo_used_int),
		.fifo_wr_en         (fifo_wr_en_int),
		.pll_locked         (pll_locked)
	);

	fifo_background fifo_inst (
		.clock  (clk),
		.data   (rgb_output),
		.rdreq  (fifo_rd_en),
		.wrreq  (fifo_wr_en_int),
		.empty  (fifo_empty_int),
		.full   (fifo_full_int),
		.q      (exportdata),
		.usedw  (fifo_used_int)
	);
	
	assign bg_fifo_empty = fifo_empty_int;
	assign bg_fifo_full  = fifo_full_int;
endmodule
