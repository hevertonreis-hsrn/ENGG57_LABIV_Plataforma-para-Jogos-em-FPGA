# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
set QSYS_SIMDIR C:/Projects/Quartus/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/visual_processing_unit/embedded_vpu/testbench
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
vcom $QSYS_SIMDIR/../../clk_divider.vhd
vcom $QSYS_SIMDIR/../../dual_clock_fifo.vhd
vcom $QSYS_SIMDIR/../../fifo_background.vhd
vcom $QSYS_SIMDIR/../../rom_sprites.vhd
vlog $QSYS_SIMDIR/../../sources/vga_controller.v
vlog $QSYS_SIMDIR/../../sources/pixel_reader.v
vlog $QSYS_SIMDIR/../../sources/top4_sprite_selector.v
vlog $QSYS_SIMDIR/../../sources/sprite_visibility_checker.v
vlog $QSYS_SIMDIR/../../sources/border_analyzer.v
vlog $QSYS_SIMDIR/../../sources/collision_sprite_analyzer.v
vlog $QSYS_SIMDIR/../../sources/sprite_pixel_fetcher.v
vlog $QSYS_SIMDIR/../../sources/pixel_counter.v
vlog $QSYS_SIMDIR/../../sources/pixel_composer.v
vlog $QSYS_SIMDIR/../../sources/master_interface.v
vlog $QSYS_SIMDIR/../../sources/background_loader.v
vlog $QSYS_SIMDIR/../../sources/rgb16_to_rgb24.v
vlog $QSYS_SIMDIR/../../sources/gamepad_controller.v
vlog $QSYS_SIMDIR/../../visual_processing_unit.v
vlog $QSYS_SIMDIR/../../visual_processing_unit_tb.v
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
set TOP_LEVEL_NAME visual_processing_unit_tb
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
elab
do wave.do
restart -f -nolog -novirtuals
# #
# # Run the simulation.
# run -a
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
