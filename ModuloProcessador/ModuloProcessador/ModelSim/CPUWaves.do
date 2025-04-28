onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Clock Principal}
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/CLOCK_50
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/SW
add wave -noupdate -divider {Clock Pipeline}
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst2/c0
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst3/rst_sync
add wave -noupdate -divider {IF Stage}
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/rst
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/state
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/outPC
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/outInstruction
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/actualPC
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/pc_plus_4
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/nextPC_internal
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/outAddress
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/start_read
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/ready
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/IF_Flush
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/HD_HoldPC
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/HD_Hold_IF_ID
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/PCSrc
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/BranchTarget
add wave -noupdate -divider {Instruction Master}
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/reset_n
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/start_read
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/i_address
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/i_read
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/i_waitrequest
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/i_readdata
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/ready
add wave -noupdate /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1249439 ps} 0} {{Cursor 3} {1366389 ps} 0}
quietly wave cursor active 2
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
WaveRestoreZoom {1008309 ps} {1607483 ps}
