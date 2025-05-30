# ------------------------------------------------------------------------------
# Top Level Simulation Script to source msim_setup.tcl
# ------------------------------------------------------------------------------
set QSYS_SIMDIR obj/default/runtime/sim
source msim_setup.tcl
# Copy generated memory initialization hex and dat file(s) to current directory
file copy -force C:/Projects/Quartus/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/ModuloVGAController/software/TestProcessor/mem_init/hdl_sim/EmbarcadoVGA_ram.dat ./ 
file copy -force C:/Projects/Quartus/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/ModuloVGAController/software/TestProcessor/mem_init/EmbarcadoVGA_ram.hex ./ 
