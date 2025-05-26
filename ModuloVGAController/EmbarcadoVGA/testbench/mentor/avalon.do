onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ModuloVgaControllerTB/clk50
add wave -noupdate /ModuloVgaControllerTB/rst_n
add wave -noupdate -divider PLL
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/c0
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/c1
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/locked
add wave -noupdate -divider Embarcado
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/za_data
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/za_valid
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/za_waitrequest
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_ba
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_cas_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_cke
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_cs_n
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_dq
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_dqm
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_ras_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_we_n
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_be_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_cs
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_data
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_rd_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_wr_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/waitrequest
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/readdatavalid
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/readdata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/read
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/chipselect
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/byteenable
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/address
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/exportdata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/fifo_full
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/fifo_wr_en
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/pll_locked
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/addr_counter
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/state
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/started
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100649750 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {100426023 ps} {101135090 ps}
