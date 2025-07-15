	component embedded_vpu is
		port (
			background_loader_conduit_pll_locked     : in    std_logic                     := 'X';             -- pll_locked
			clk_clk                                  : in    std_logic                     := 'X';             -- clk
			composer_conduit_pixel_out               : out   std_logic_vector(23 downto 0);                    -- pixel_out
			composer_conduit_wrfull                  : in    std_logic                     := 'X';             -- wrfull
			composer_conduit_wrreq                   : out   std_logic;                                        -- wrreq
			composer_conduit_new_frame_test          : out   std_logic;                                        -- new_frame_test
			gamepad_pins_external_connection_export  : in    std_logic_vector(11 downto 0) := (others => 'X'); -- export
			reset_reset_n                            : in    std_logic                     := 'X';             -- reset_n
			sdram_controller_wire_addr               : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_controller_wire_ba                 : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_controller_wire_cas_n              : out   std_logic;                                        -- cas_n
			sdram_controller_wire_cke                : out   std_logic;                                        -- cke
			sdram_controller_wire_cs_n               : out   std_logic;                                        -- cs_n
			sdram_controller_wire_dq                 : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_controller_wire_dqm                : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_controller_wire_ras_n              : out   std_logic;                                        -- ras_n
			sdram_controller_wire_we_n               : out   std_logic;                                        -- we_n
			new_frame_irq_external_connection_export : in    std_logic                     := 'X'              -- export
		);
	end component embedded_vpu;

	u0 : component embedded_vpu
		port map (
			background_loader_conduit_pll_locked     => CONNECTED_TO_background_loader_conduit_pll_locked,     --         background_loader_conduit.pll_locked
			clk_clk                                  => CONNECTED_TO_clk_clk,                                  --                               clk.clk
			composer_conduit_pixel_out               => CONNECTED_TO_composer_conduit_pixel_out,               --                  composer_conduit.pixel_out
			composer_conduit_wrfull                  => CONNECTED_TO_composer_conduit_wrfull,                  --                                  .wrfull
			composer_conduit_wrreq                   => CONNECTED_TO_composer_conduit_wrreq,                   --                                  .wrreq
			composer_conduit_new_frame_test          => CONNECTED_TO_composer_conduit_new_frame_test,          --                                  .new_frame_test
			gamepad_pins_external_connection_export  => CONNECTED_TO_gamepad_pins_external_connection_export,  --  gamepad_pins_external_connection.export
			reset_reset_n                            => CONNECTED_TO_reset_reset_n,                            --                             reset.reset_n
			sdram_controller_wire_addr               => CONNECTED_TO_sdram_controller_wire_addr,               --             sdram_controller_wire.addr
			sdram_controller_wire_ba                 => CONNECTED_TO_sdram_controller_wire_ba,                 --                                  .ba
			sdram_controller_wire_cas_n              => CONNECTED_TO_sdram_controller_wire_cas_n,              --                                  .cas_n
			sdram_controller_wire_cke                => CONNECTED_TO_sdram_controller_wire_cke,                --                                  .cke
			sdram_controller_wire_cs_n               => CONNECTED_TO_sdram_controller_wire_cs_n,               --                                  .cs_n
			sdram_controller_wire_dq                 => CONNECTED_TO_sdram_controller_wire_dq,                 --                                  .dq
			sdram_controller_wire_dqm                => CONNECTED_TO_sdram_controller_wire_dqm,                --                                  .dqm
			sdram_controller_wire_ras_n              => CONNECTED_TO_sdram_controller_wire_ras_n,              --                                  .ras_n
			sdram_controller_wire_we_n               => CONNECTED_TO_sdram_controller_wire_we_n,               --                                  .we_n
			new_frame_irq_external_connection_export => CONNECTED_TO_new_frame_irq_external_connection_export  -- new_frame_irq_external_connection.export
		);

