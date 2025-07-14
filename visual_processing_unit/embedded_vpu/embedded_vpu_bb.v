
module embedded_vpu (
	background_loader_conduit_pll_locked,
	clk_clk,
	composer_conduit_pixel_out,
	composer_conduit_wrfull,
	composer_conduit_wrreq,
	composer_conduit_new_frame_test,
	gamepad_pins_external_connection_export,
	reset_reset_n,
	sdram_controller_wire_addr,
	sdram_controller_wire_ba,
	sdram_controller_wire_cas_n,
	sdram_controller_wire_cke,
	sdram_controller_wire_cs_n,
	sdram_controller_wire_dq,
	sdram_controller_wire_dqm,
	sdram_controller_wire_ras_n,
	sdram_controller_wire_we_n);	

	input		background_loader_conduit_pll_locked;
	input		clk_clk;
	output	[23:0]	composer_conduit_pixel_out;
	input		composer_conduit_wrfull;
	output		composer_conduit_wrreq;
	output		composer_conduit_new_frame_test;
	input	[11:0]	gamepad_pins_external_connection_export;
	input		reset_reset_n;
	output	[12:0]	sdram_controller_wire_addr;
	output	[1:0]	sdram_controller_wire_ba;
	output		sdram_controller_wire_cas_n;
	output		sdram_controller_wire_cke;
	output		sdram_controller_wire_cs_n;
	inout	[31:0]	sdram_controller_wire_dq;
	output	[3:0]	sdram_controller_wire_dqm;
	output		sdram_controller_wire_ras_n;
	output		sdram_controller_wire_we_n;
endmodule
