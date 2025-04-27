onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk -radix binary /ModuloProcessador_tb/clk
add wave -noupdate -radix binary /ModuloProcessador_tb/uut/b2v_inst6/c0
add wave -noupdate -label rst -radix binary /ModuloProcessador_tb/uut/rst
add wave -noupdate -radix binary /ModuloProcessador_tb/uut/b2v_inst6/inclk0
add wave -noupdate -label PC -radix unsigned -radixshowbase 0 /ModuloProcessador_tb/uut/b2v_inst/b2v_inst1/inPC
add wave -noupdate -label newPC -radix unsigned -radixshowbase 0 /ModuloProcessador_tb/uut/b2v_inst/b2v_inst1/outPC
add wave -noupdate -label IF_ID_Inst -radix unsigned -radixshowbase 0 /ModuloProcessador_tb/uut/b2v_inst/IF_ID_Inst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {159 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {285 ps}
