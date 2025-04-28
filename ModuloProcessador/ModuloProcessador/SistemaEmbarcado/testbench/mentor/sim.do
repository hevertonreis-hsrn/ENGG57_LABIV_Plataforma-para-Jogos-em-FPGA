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
# # set QSYS_SIMDIR "C:/Users/Heverton/Documents/LAB04/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/ModuloProcessador/ModuloProcessador/SistemaEmbarcado/testbench"
set QSYS_SIMDIR "C:/Workspace/Outros/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/ModuloProcessador/ModuloProcessador/SistemaEmbarcado/testbench"

# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/mentor/msim_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# set USER_DEFINED_VHDL_COMPILE_OPTIONS <compilation options for VHDL>
# set USER_DEFINED_VERILOG_COMPILE_OPTIONS <compilation options for Verilog>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
vlog -sv   "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/verbosity_pkg.sv"                                                  -work altera_common_sv_packages                
vlog -sv   "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/altera_merlin_slave_translator.sv"    -L altera_common_sv_packages -work RAM_s1_translator                        
vlog -sv   "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/altera_merlin_master_translator.sv"   -L altera_common_sv_packages -work ProcessadorCentral_data_master_translator
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/altera_reset_controller.v"                                         -work rst_controller                           
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/altera_reset_synchronizer.v"                                       -work rst_controller                           
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/SistemaEmbarcado_mm_interconnect_1.v"                              -work mm_interconnect_1                        
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/SistemaEmbarcado_mm_interconnect_0.v"                              -work mm_interconnect_0                        
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/SistemaEmbarcado_ROM.v"                                            -work ROM                                      
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/SistemaEmbarcado_RAM.v"                                            -work RAM                                      
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/CPU.v"                                                             -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/ALU.v"                                                             -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/ALUControl.v"                                                      -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/AvalonMM_Master_DataInterface.v"                                   -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/AvalonMM_Master_InstInterface.v"                                   -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/Control.v"                                                         -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/EX_STAGE.v"                                                        -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/ForwardingUnit.v"                                                  -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/HazardDetectionUnit.v"                                             -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/ID_STAGE.v"                                                        -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/IF_STAGE.v"                                                        -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/MEM_STAGE.v"                                                       -work ProcessadorCentral                       
vcom       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/PLL.vhd"                                                           -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/RegFile.v"                                                         -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/ResetSync.v"                                                       -work ProcessadorCentral                       
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/WB_STAGE.v"
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/MemoryStallUnit.v"                                                        -work ProcessadorCentral                       
vlog -sv   "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/altera_avalon_reset_source.sv"        -L altera_common_sv_packages -work SistemaEmbarcado_inst_reset_bfm          
vlog -sv   "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/altera_avalon_clock_source.sv"        -L altera_common_sv_packages -work SistemaEmbarcado_inst_clk_bfm            
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/submodules/SistemaEmbarcado.v"                                                -work SistemaEmbarcado_inst                    
vlog       "$QSYS_SIMDIR/SistemaEmbarcado_tb/simulation/SistemaEmbarcado_tb.v"                                                                                                       
# # vlog "C:/Users/Heverton/Documents/LAB04/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/ModuloProcessador/ModuloProcessador/ModuloProcessador.v"
# # vlog "C:/Users/Heverton/Documents/LAB04/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/ModuloProcessador/ModuloProcessador/ModuloProcessador_tb.v"
vlog "C:/Workspace/Outros/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/ModuloProcessador/ModuloProcessador/ModuloProcessador.v"
vlog "C:/Workspace/Outros/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/ModuloProcessador/ModuloProcessador/ModuloProcessador_tb.v"

# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
set TOP_LEVEL_NAME ModuloProcessador_tb
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
elab
do CPUWaves.do
# #
# # Run the simulation.
# run -a
# #
# # Report success to the shell.
# exit -code 0
# #
