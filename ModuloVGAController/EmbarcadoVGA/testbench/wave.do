onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ModuloVgaControllerTB/clk50
add wave -noupdate /ModuloVgaControllerTB/rst_n
add wave -noupdate -divider PLL
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/c0
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/c1
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst/locked
add wave -noupdate -divider VGA
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst1/hCount
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst1/vCount
add wave -noupdate -radix binary /ModuloVgaControllerTB/dut/b2v_inst1/fifo_full
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/outX
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/outY
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/outRequest
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/preRequest
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst1/outRed
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst1/outGreen
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst1/outBlue
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/hs
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/vs
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst1/clk25
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
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/fifo_full
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/fifo_empty
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/fifo_wr_en
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/pll_locked
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/addr_counter
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/started
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/state
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/nstate
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/fifo_used
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/burst_word_counter
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/master_interface/data_d
add wave -noupdate -divider FIFO
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst3/data
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/rdclk
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/rdreq
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/wrclk
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/wrreq
add wave -noupdate -radix hexadecimal /ModuloVgaControllerTB/dut/b2v_inst3/q
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/rdempty
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/rdfull
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst3/wrfull
add wave -noupdate -divider Embarcado
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/za_data
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/za_valid
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/za_waitrequest
add wave -noupdate -radix unsigned -childformat {{{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[12]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[11]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[10]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[9]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[8]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[7]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[6]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[5]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[4]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[3]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[2]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[1]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[0]} -radix unsigned}} -subitemconfig {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[12]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[11]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[10]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[9]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[8]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[7]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[6]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[5]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[4]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[3]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[2]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[1]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr[0]} {-height 15 -radix unsigned}} /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_addr
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_ba
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_cas_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_cke
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_cs_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_dq
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_dqm
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_ras_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/zs_we_n
add wave -noupdate -radix unsigned -childformat {{{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[24]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[23]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[22]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[21]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[20]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[19]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[18]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[17]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[16]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[15]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[14]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[13]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[12]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[11]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[10]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[9]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[8]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[7]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[6]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[5]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[4]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[3]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[2]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[1]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[0]} -radix unsigned}} -subitemconfig {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[24]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[23]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[22]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[21]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[20]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[19]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[18]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[17]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[16]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[15]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[14]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[13]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[12]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[11]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[10]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[9]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[8]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[7]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[6]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[5]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[4]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[3]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[2]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[1]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr[0]} {-height 15 -radix unsigned}} /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_addr
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_be_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_cs
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_data
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_rd_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/az_wr_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/clk
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/reset_n
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/ack_refresh_request
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/active_addr
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/active_bank
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/bank_match
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/f_addr
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/f_bank
add wave -noupdate -radix unsigned -childformat {{{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[12]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[11]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[10]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[9]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[8]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[7]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[6]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[5]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[4]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[3]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[2]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[1]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[0]} -radix unsigned}} -subitemconfig {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[12]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[11]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[10]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[9]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[8]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[7]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[6]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[5]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[4]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[3]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[2]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[1]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr[0]} {-height 15 -radix unsigned}} /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_addr
add wave -noupdate /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_bank
add wave -noupdate -radix unsigned /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_cmd
add wave -noupdate -radix unsigned -childformat {{{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_count[2]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_count[1]} -radix unsigned} {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_count[0]} -radix unsigned}} -subitemconfig {{/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_count[2]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_count[1]} {-height 15 -radix unsigned} {/ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_count[0]} {-height 15 -radix unsigned}} /ModuloVgaControllerTB/dut/b2v_inst2/sdram_controller/m_count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1768512764 ps} 0}
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
WaveRestoreZoom {1768112072 ps} {1779411588 ps}
