onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ModuloVgaControllerTB/clk50
add wave -noupdate /ModuloVgaControllerTB/rst_n
add wave -noupdate -divider PLL
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/c0
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/c1
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/locked
add wave -noupdate -divider Master
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/init_counter
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/clk
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/reset_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/waitrequest
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/readdatavalid
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/readdata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/read
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/beginbursttransfer
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/chipselect
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/byteenable
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/address
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/exportdata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/pll_locked
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/addr_counter
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/started
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/state
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/nstate
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/burst_word_counter
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/data_d
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/slave_writedata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/slave_write
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/slave_address
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/bg_width
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/bg_height
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/offset_x
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/offset_y
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/next_offset_x
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/next_offset_y
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/start_config
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/curr_x
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/curr_y
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/real_bg_index
add wave -noupdate -divider KEY
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/key/readdata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/key/address
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/key/clk
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/key/in_port
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/key/reset_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/key/data_in
add wave -noupdate -divider SDRAM
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/za_data
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/za_valid
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/za_waitrequest
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_ba
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_cas_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_cke
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_cs_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_dq
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_dqm
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_ras_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_we_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_be_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_cs
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_data
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_rd_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_wr_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/clk
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/reset_n
add wave -noupdate -divider VGA
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst1/outX
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst1/outY
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/outRequest
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/preRequest
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst1/outRed
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst1/outGreen
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst1/outBlue
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/hs
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/vs
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/hCount
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/vCount
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst4/fifo_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {390240000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 113
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1539478856 ps} {1539674798 ps}
