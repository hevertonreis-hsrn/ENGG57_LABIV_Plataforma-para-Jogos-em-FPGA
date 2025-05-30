onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ModuloVgaControllerTB/clk50
add wave -noupdate /ModuloVgaControllerTB/rst_n
add wave -noupdate -divider PLL
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/c0
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/c1
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/locked
add wave -noupdate -divider Master
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/init_counter
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/clk
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/reset_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/waitrequest
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/readdatavalid
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/readdata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/read
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/beginbursttransfer
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/chipselect
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/byteenable
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/address
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/exportdata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/pll_locked
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/addr_counter
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/started
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/state
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/nstate
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/burst_word_counter
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/data_d
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/slave_writedata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/slave_write
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/slave_address
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/bg_width
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/bg_height
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/offset_x
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/offset_y
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/next_offset_x
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/next_offset_y
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/start_config
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/curr_x
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/curr_y
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/real_bg_index
add wave -noupdate -divider KEY
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/key/readdata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/key/address
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/key/clk
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/key/in_port
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/key/reset_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/key/data_in
add wave -noupdate /ModuloVgaControllerTB/dut/KEY
add wave -noupdate -divider Processor
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/processor/clk
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/processor/d_address
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/processor/d_byteenable
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/processor/d_read
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/processor/d_readdata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/processor/d_waitrequest
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/processor/d_write
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/processor/d_writedata
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/processor/i_address
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/processor/i_read
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/processor/i_readdata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/processor/i_waitrequest
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3081686 ps} 0}
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
WaveRestoreZoom {584064 ps} {1314144 ps}
