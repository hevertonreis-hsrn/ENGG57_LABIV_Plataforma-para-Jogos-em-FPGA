module visual_processing_unit(
	input  wire        CLOCK_50,
	input  wire [3:0]  KEY,
	input  wire [0:0]  SW,
	output wire [11:0] LEDR,
	output wire        outRequest,
	output wire        VGA_HS,
	output wire        VGA_VS,
	output wire        VGA_BLANK_N,
	output wire        VGA_SYNC_N,
	output wire        VGA_CLK,

	output wire        DRAM_CAS_N,
	output wire        DRAM_CKE,
	output wire        DRAM_CS_N,
	output wire        DRAM_RAS_N,
	output wire        DRAM_WE_N,
	output wire        DRAM_CLK,
	output wire [12:0] DRAM_ADDR,
	output wire [1:0]  DRAM_BA,
	inout  wire [31:0] DRAM_DQ,
	output wire [3:0]  DRAM_DQM,
	
	inout  wire [15:0] SRAM_DQ,
	output wire [19:0] SRAM_ADDR,
	output wire        SRAM_LB_N,
	output wire        SRAM_UB_N,
	output wire        SRAM_CE_N,
	output wire        SRAM_OE_N,
	output wire        SRAM_WE_N,
	
	input wire	GPIO35,
	input wire	GPIO31,
	input wire	GPIO27,
	input wire	GPIO25,
	input wire	GPIO33,
	input wire	GPIO23,
	output wire	GPIO29,

	output wire [9:0]  outX,
	output wire [9:0]  outY,
	output wire [7:0]  VGA_B,
	output wire [7:0]  VGA_G,
	output wire [7:0]  VGA_R
);

	// CLOCKS
	wire clk_vga;
	wire clk_sys;
	wire clk_sdram;
	wire pll_locked;

	clk_divider pll (
		.inclk0(CLOCK_50),
		.c0(clk_vga),
		.c1(clk_sys),
		.c2(clk_sdram),
		.locked(pll_locked)
	);

	// FIFO dual clock
	wire [23:0] pixel_out;
	wire        wrreq;
	wire        wrfull;

	wire [23:0] fifo_data;
	wire        fifo_rdreq;
	wire        fifo_rdempty;
	wire        fifo_rdfull;
	wire 				w_fifo_full;
	wire [11:0] gamepad_pins;       // conexão com o Platform Designer
  wire [11:0] gamepad_data;       // saída do gamepad_controller
	wire frame_test;
	
	dual_clock_fifo pixel_fifo (
		.data(pixel_out),
		.rdclk(clk_vga),
		.rdreq(fifo_rdreq),
		.wrclk(clk_sys),
		.wrreq(wrreq),
		.q(fifo_data),
		.rdempty(fifo_rdempty),
		.rdfull(fifo_rdfull),
		.wrfull(wrfull)
	);

	embedded_vpu vpu (
		.background_loader_conduit_pll_locked(pll_locked),
		.clk_clk(clk_sys),
		.composer_conduit_pixel_out(pixel_out),
		.composer_conduit_wrreq(wrreq),
		.composer_conduit_wrfull(wrfull),
		.composer_conduit_new_frame_test(frame_test),
		.key_external_connection_export(KEY),    // <- NOVO
		.leds_external_connection_export(LEDR),
		.reset_reset_n(SW[0]),                   // <- SW[0] como RESET
		.sdram_controller_wire_addr(DRAM_ADDR),
		.sdram_controller_wire_ba(DRAM_BA),
		.sdram_controller_wire_cas_n(DRAM_CAS_N),
		.sdram_controller_wire_cke(DRAM_CKE),
		.sdram_controller_wire_cs_n(DRAM_CS_N),
		.sdram_controller_wire_dq(DRAM_DQ),
		.sdram_controller_wire_dqm(DRAM_DQM),
		.sdram_controller_wire_ras_n(DRAM_RAS_N),
		.sdram_controller_wire_we_n(DRAM_WE_N),
		.sram_external_interface_DQ     (SRAM_DQ),
		.sram_external_interface_ADDR   (SRAM_ADDR),
		.gamepad_pins_external_connection_export(gamepad_pins),
//		.gamepad_conduit_pin_1(GPIO35),                //           gamepad_conduit.pin_1
//		.gamepad_conduit_pin_2(GPIO31),                //                          .pin_2
//		.gamepad_conduit_pin_3(GPIO27),                //                          .pin_3
//		.gamepad_conduit_pin_4(GPIO25),                //                          .pin_4
//		.gamepad_conduit_pin_6(GPIO33),                //                          .pin_6
//		.gamepad_conduit_pin_7(GPIO29),                //                          .pin_7
//		.gamepad_conduit_pin_9(GPIO23),                //                          .pin_9
    .sram_external_interface_LB_N   (SRAM_LB_N),
    .sram_external_interface_UB_N   (SRAM_UB_N),
    .sram_external_interface_CE_N   (SRAM_CE_N),
    .sram_external_interface_OE_N   (SRAM_OE_N),
    .sram_external_interface_WE_N   (SRAM_WE_N)
	);

	// Leitor da FIFO para o VGA
	wire [7:0] r, g, b;
	wire 			 preRequest;

	pixel_reader p_reader (
		.clk(clk_vga),
		.rstN(SW[0]),
		.fifo_data(fifo_data),
		.fifo_empty(fifo_rdempty),
		.fifo_full(fifo_rdfull),
		.w_fifo_full(w_fifo_full),
		.fifo_rd_en(fifo_rdreq),
		.vga_request(preRequest),
		.outRed(r),
		.outGreen(g),
		.outBlue(b)
	);

	// Controlador VGA
	vga_controller vga (
		.inRed(r),
		.inGreen(g),
		.inBlue(b),
		.fifo_full(w_fifo_full),

		.outX(outX),
		.outY(outY),
		.outRequest(outRequest),
		.preRequest(preRequest),

		.outRed(VGA_R),
		.outGreen(VGA_G),
		.outBlue(VGA_B),
		.hs(VGA_HS),
		.vs(VGA_VS),
		.vgaClk(VGA_CLK),
		.vgaBlankN(VGA_BLANK_N),
		.vgaSyncN(VGA_SYNC_N),

		.clk(clk_vga),
		.rst_n(SW[0])
	);

	assign DRAM_CLK = clk_sdram;
	assign gamepad_pins = gamepad_data;

	gamepad_controller b2v_inst(
		.clk(clk_sys),                         //                      clk.clk
		.enable(frame_test),
		.pin_1(GPIO35),                   //                  gamepad.pin_1
		.pin_2(GPIO31),                   //                         .pin_2
		.pin_3(GPIO27),                   //                         .pin_3
		.pin_4(GPIO25),                   //                         .pin_4
		.pin_6(GPIO33),                   //                         .pin_6
		.select(GPIO29),                   //                         .pin_7
		.pin_9(GPIO23),                   //                         .pin_9
		.btn_out(gamepad_data), // leds_external_connection.export
		.rst_n(SW[0])                    //                    reset.reset_n
	);
endmodule
