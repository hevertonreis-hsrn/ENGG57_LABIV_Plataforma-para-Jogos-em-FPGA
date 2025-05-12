onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ModuloVgaControllerTB/clk50
add wave -noupdate /ModuloVgaControllerTB/rst_n
add wave -noupdate -divider PLL
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/c0
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/c1
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/locked
add wave -noupdate -divider VGA
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/fifo_data
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst1/fifo_empty
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst1/fifo_full
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst1/fifo_rd_en
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/outX
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/outY
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/outRequest
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/preRequest
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/outRed
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/outGreen
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/outBlue
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/hs
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/vs
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/vgaClk
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/vgaBlankN
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/vgaSyncN
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/clk25
add wave -noupdate -divider FIFO
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/data
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/rdclk
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/rdreq
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/wrclk
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/wrreq
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/q
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/rdempty
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/rdfull
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/wrfull
add wave -noupdate -divider Embarcado
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_conduit_1_fifo_full
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_conduit_1_fifo_wr_en
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_conduit_1_exportdata
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_conduit_1_pll_locked
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/reset_reset_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_addr
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_ba
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_cas_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_cke
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_cs_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_dq
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_dqm
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_ras_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_we_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {88601 ps} 0}
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
WaveRestoreZoom {0 ps} {412505 ps}
