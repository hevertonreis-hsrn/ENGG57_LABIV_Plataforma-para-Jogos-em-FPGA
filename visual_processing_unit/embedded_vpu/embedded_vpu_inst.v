	embedded_vpu u0 (
		.background_loader_conduit_pll_locked    (<connected-to-background_loader_conduit_pll_locked>),    //        background_loader_conduit.pll_locked
		.clk_clk                                 (<connected-to-clk_clk>),                                 //                              clk.clk
		.composer_conduit_pixel_out              (<connected-to-composer_conduit_pixel_out>),              //                 composer_conduit.pixel_out
		.composer_conduit_wrfull                 (<connected-to-composer_conduit_wrfull>),                 //                                 .wrfull
		.composer_conduit_wrreq                  (<connected-to-composer_conduit_wrreq>),                  //                                 .wrreq
		.composer_conduit_new_frame_test         (<connected-to-composer_conduit_new_frame_test>),         //                                 .new_frame_test
		.gamepad_pins_external_connection_export (<connected-to-gamepad_pins_external_connection_export>), // gamepad_pins_external_connection.export
		.key_external_connection_export          (<connected-to-key_external_connection_export>),          //          key_external_connection.export
		.leds_external_connection_export         (<connected-to-leds_external_connection_export>),         //         leds_external_connection.export
		.reset_reset_n                           (<connected-to-reset_reset_n>),                           //                            reset.reset_n
		.sdram_controller_wire_addr              (<connected-to-sdram_controller_wire_addr>),              //            sdram_controller_wire.addr
		.sdram_controller_wire_ba                (<connected-to-sdram_controller_wire_ba>),                //                                 .ba
		.sdram_controller_wire_cas_n             (<connected-to-sdram_controller_wire_cas_n>),             //                                 .cas_n
		.sdram_controller_wire_cke               (<connected-to-sdram_controller_wire_cke>),               //                                 .cke
		.sdram_controller_wire_cs_n              (<connected-to-sdram_controller_wire_cs_n>),              //                                 .cs_n
		.sdram_controller_wire_dq                (<connected-to-sdram_controller_wire_dq>),                //                                 .dq
		.sdram_controller_wire_dqm               (<connected-to-sdram_controller_wire_dqm>),               //                                 .dqm
		.sdram_controller_wire_ras_n             (<connected-to-sdram_controller_wire_ras_n>),             //                                 .ras_n
		.sdram_controller_wire_we_n              (<connected-to-sdram_controller_wire_we_n>),              //                                 .we_n
		.sram_external_interface_DQ              (<connected-to-sram_external_interface_DQ>),              //          sram_external_interface.DQ
		.sram_external_interface_ADDR            (<connected-to-sram_external_interface_ADDR>),            //                                 .ADDR
		.sram_external_interface_LB_N            (<connected-to-sram_external_interface_LB_N>),            //                                 .LB_N
		.sram_external_interface_UB_N            (<connected-to-sram_external_interface_UB_N>),            //                                 .UB_N
		.sram_external_interface_CE_N            (<connected-to-sram_external_interface_CE_N>),            //                                 .CE_N
		.sram_external_interface_OE_N            (<connected-to-sram_external_interface_OE_N>),            //                                 .OE_N
		.sram_external_interface_WE_N            (<connected-to-sram_external_interface_WE_N>)             //                                 .WE_N
	);

