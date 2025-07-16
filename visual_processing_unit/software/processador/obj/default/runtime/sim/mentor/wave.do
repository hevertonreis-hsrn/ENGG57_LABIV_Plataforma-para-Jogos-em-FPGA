onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider VGA
add wave -noupdate /visual_processing_unit_tb/dut/vga/inRed
add wave -noupdate /visual_processing_unit_tb/dut/vga/inGreen
add wave -noupdate /visual_processing_unit_tb/dut/vga/inBlue
add wave -noupdate /visual_processing_unit_tb/dut/vga/fifo_full
add wave -noupdate /visual_processing_unit_tb/dut/vga/outX
add wave -noupdate /visual_processing_unit_tb/dut/vga/outY
add wave -noupdate /visual_processing_unit_tb/dut/vga/outRequest
add wave -noupdate /visual_processing_unit_tb/dut/vga/preRequest
add wave -noupdate /visual_processing_unit_tb/dut/vga/outRed
add wave -noupdate /visual_processing_unit_tb/dut/vga/outGreen
add wave -noupdate /visual_processing_unit_tb/dut/vga/outBlue
add wave -noupdate /visual_processing_unit_tb/dut/vga/hs
add wave -noupdate /visual_processing_unit_tb/dut/vga/vs
add wave -noupdate /visual_processing_unit_tb/dut/vga/vgaClk
add wave -noupdate /visual_processing_unit_tb/dut/vga/vgaBlankN
add wave -noupdate /visual_processing_unit_tb/dut/vga/vgaSyncN
add wave -noupdate /visual_processing_unit_tb/dut/vga/clk
add wave -noupdate /visual_processing_unit_tb/dut/vga/rst_n
add wave -noupdate -divider FIFO_Pixel
add wave -noupdate /visual_processing_unit_tb/dut/pixel_fifo/data
add wave -noupdate /visual_processing_unit_tb/dut/pixel_fifo/rdclk
add wave -noupdate /visual_processing_unit_tb/dut/pixel_fifo/rdreq
add wave -noupdate /visual_processing_unit_tb/dut/pixel_fifo/wrclk
add wave -noupdate /visual_processing_unit_tb/dut/pixel_fifo/wrreq
add wave -noupdate /visual_processing_unit_tb/dut/pixel_fifo/q
add wave -noupdate /visual_processing_unit_tb/dut/pixel_fifo/rdempty
add wave -noupdate /visual_processing_unit_tb/dut/pixel_fifo/rdfull
add wave -noupdate /visual_processing_unit_tb/dut/pixel_fifo/wrfull
add wave -noupdate -divider Composer
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/clk
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/rst_n
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/avalon_write
add wave -noupdate -radix unsigned /visual_processing_unit_tb/dut/vpu/composer/avalon_address
add wave -noupdate -radix hexadecimal /visual_processing_unit_tb/dut/vpu/composer/avalon_writedata
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/avalon_read
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/new_frame
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/avalon_readdata
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/bg_fifo_q
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/bg_fifo_empty
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/bg_fifo_full
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/bg_fifo_rdreq
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/wrfull
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetch_done
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/wrreq
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/pixel_out
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/pixel_x
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/pixel_y
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/pc_enable
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/sprites_ready
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/vis_out
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/h0
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/h1
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/h2
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/h3
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/spixel
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/selected_pixel
add wave -noupdate -divider FETCHER
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/IDLE
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/CHECK
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/clk
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/rst_n
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/start
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/h0_in
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/h1_in
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/h2_in
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/h3_in
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/rom_data
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/rom_addr
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/done
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/pixel_out
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/state
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/sprite_regs
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/fetcher/current_index
add wave -noupdate -divider colision
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/clk
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/rst_n
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/new_pixel
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/reset_after_read
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/registers_collision_sprites
add wave -noupdate -radix unsigned /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/address
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/new_frame
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/read
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/readdata
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/h0_in
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/h1_in
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/h2_in
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/h3_in
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/collision
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/h_ins
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/id
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/level
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/offset_x
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/offset_y
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/aux_reg
add wave -noupdate /visual_processing_unit_tb/dut/vpu/composer/collision_sprite/i
add wave -noupdate -divider cpu
add wave -noupdate /visual_processing_unit_tb/dut/vpu/processor/cpu/d_address
add wave -noupdate /visual_processing_unit_tb/dut/vpu/processor/cpu/d_byteenable
add wave -noupdate /visual_processing_unit_tb/dut/vpu/processor/cpu/d_read
add wave -noupdate /visual_processing_unit_tb/dut/vpu/processor/cpu/d_write
add wave -noupdate /visual_processing_unit_tb/dut/vpu/processor/cpu/d_writedata
add wave -noupdate /visual_processing_unit_tb/dut/vpu/processor/cpu/debug_mem_slave_waitrequest
add wave -noupdate -radix unsigned /visual_processing_unit_tb/dut/vpu/processor/cpu/irq
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17245340000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 137
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {1159361 ps}
