# ------------------------------------------------------------------------------
# Top Level Simulation Script to source msim_setup.tcl
# ------------------------------------------------------------------------------
set QSYS_SIMDIR obj/default/runtime/sim
source msim_setup.tcl
# Copy generated memory initialization hex and dat file(s) to current directory
file copy -force C:/Projects/Quartus/visual_processing_unit/software/nios2_processor/mem_init/hdl_sim/embedded_vpu_ram_data.dat ./ 
file copy -force C:/Projects/Quartus/visual_processing_unit/software/nios2_processor/mem_init/embedded_vpu_ram_data.hex ./ 
