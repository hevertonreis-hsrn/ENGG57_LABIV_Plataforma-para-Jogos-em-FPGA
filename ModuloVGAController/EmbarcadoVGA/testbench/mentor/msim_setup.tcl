
# (C) 2001-2025 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ----------------------------------------
# Auto-generated simulation script msim_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     EmbarcadoVGA_tb
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "mentor.do", and modify the text as directed.
# 
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
# set QSYS_SIMDIR <script generation output directory>
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
# vlog <compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run -a
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If EmbarcadoVGA_tb is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 18.1 625 win32 2025.06.03.20:38:10

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "EmbarcadoVGA_tb"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/intelfpga_lite/18.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VHDL_COMPILE_OPTIONS] { 
  set USER_DEFINED_VHDL_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VERILOG_COMPILE_OPTIONS] { 
  set USER_DEFINED_VERILOG_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_ociram_default_contents.dat ./
  file copy -force $QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_ociram_default_contents.hex ./
  file copy -force $QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_ociram_default_contents.mif ./
  file copy -force $QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_rf_ram_a.dat ./
  file copy -force $QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_rf_ram_a.hex ./
  file copy -force $QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_rf_ram_a.mif ./
  file copy -force $QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_rf_ram_b.dat ./
  file copy -force $QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_rf_ram_b.hex ./
  file copy -force $QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_rf_ram_b.mif ./
  file copy -force $QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_ram.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
  ensure_lib                  ./libraries/altera_ver/      
  vmap       altera_ver       ./libraries/altera_ver/      
  ensure_lib                  ./libraries/lpm_ver/         
  vmap       lpm_ver          ./libraries/lpm_ver/         
  ensure_lib                  ./libraries/sgate_ver/       
  vmap       sgate_ver        ./libraries/sgate_ver/       
  ensure_lib                  ./libraries/altera_mf_ver/   
  vmap       altera_mf_ver    ./libraries/altera_mf_ver/   
  ensure_lib                  ./libraries/altera_lnsim_ver/
  vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver/
  ensure_lib                  ./libraries/cycloneive_ver/  
  vmap       cycloneive_ver   ./libraries/cycloneive_ver/  
}
ensure_lib                                          ./libraries/altera_common_sv_packages/               
vmap       altera_common_sv_packages                ./libraries/altera_common_sv_packages/               
ensure_lib                                          ./libraries/error_adapter_0/                         
vmap       error_adapter_0                          ./libraries/error_adapter_0/                         
ensure_lib                                          ./libraries/rsp_mux/                                 
vmap       rsp_mux                                  ./libraries/rsp_mux/                                 
ensure_lib                                          ./libraries/cmd_mux/                                 
vmap       cmd_mux                                  ./libraries/cmd_mux/                                 
ensure_lib                                          ./libraries/cmd_demux/                               
vmap       cmd_demux                                ./libraries/cmd_demux/                               
ensure_lib                                          ./libraries/sdram_controller_s1_burst_adapter/       
vmap       sdram_controller_s1_burst_adapter        ./libraries/sdram_controller_s1_burst_adapter/       
ensure_lib                                          ./libraries/router_001/                              
vmap       router_001                               ./libraries/router_001/                              
ensure_lib                                          ./libraries/router/                                  
vmap       router                                   ./libraries/router/                                  
ensure_lib                                          ./libraries/avalon_st_adapter/                       
vmap       avalon_st_adapter                        ./libraries/avalon_st_adapter/                       
ensure_lib                                          ./libraries/rsp_mux_001/                             
vmap       rsp_mux_001                              ./libraries/rsp_mux_001/                             
ensure_lib                                          ./libraries/rsp_demux_001/                           
vmap       rsp_demux_001                            ./libraries/rsp_demux_001/                           
ensure_lib                                          ./libraries/cmd_mux_001/                             
vmap       cmd_mux_001                              ./libraries/cmd_mux_001/                             
ensure_lib                                          ./libraries/cmd_demux_001/                           
vmap       cmd_demux_001                            ./libraries/cmd_demux_001/                           
ensure_lib                                          ./libraries/router_003/                              
vmap       router_003                               ./libraries/router_003/                              
ensure_lib                                          ./libraries/router_002/                              
vmap       router_002                               ./libraries/router_002/                              
ensure_lib                                          ./libraries/processor_debug_mem_slave_agent_rsp_fifo/
vmap       processor_debug_mem_slave_agent_rsp_fifo ./libraries/processor_debug_mem_slave_agent_rsp_fifo/
ensure_lib                                          ./libraries/processor_debug_mem_slave_agent/         
vmap       processor_debug_mem_slave_agent          ./libraries/processor_debug_mem_slave_agent/         
ensure_lib                                          ./libraries/processor_data_master_agent/             
vmap       processor_data_master_agent              ./libraries/processor_data_master_agent/             
ensure_lib                                          ./libraries/processor_debug_mem_slave_translator/    
vmap       processor_debug_mem_slave_translator     ./libraries/processor_debug_mem_slave_translator/    
ensure_lib                                          ./libraries/processor_data_master_translator/        
vmap       processor_data_master_translator         ./libraries/processor_data_master_translator/        
ensure_lib                                          ./libraries/cpu/                                     
vmap       cpu                                      ./libraries/cpu/                                     
ensure_lib                                          ./libraries/rst_controller/                          
vmap       rst_controller                           ./libraries/rst_controller/                          
ensure_lib                                          ./libraries/irq_mapper/                              
vmap       irq_mapper                               ./libraries/irq_mapper/                              
ensure_lib                                          ./libraries/mm_interconnect_1/                       
vmap       mm_interconnect_1                        ./libraries/mm_interconnect_1/                       
ensure_lib                                          ./libraries/mm_interconnect_0/                       
vmap       mm_interconnect_0                        ./libraries/mm_interconnect_0/                       
ensure_lib                                          ./libraries/sdram_controller/                        
vmap       sdram_controller                         ./libraries/sdram_controller/                        
ensure_lib                                          ./libraries/ram/                                     
vmap       ram                                      ./libraries/ram/                                     
ensure_lib                                          ./libraries/processor/                               
vmap       processor                                ./libraries/processor/                               
ensure_lib                                          ./libraries/master_interface/                        
vmap       master_interface                         ./libraries/master_interface/                        
ensure_lib                                          ./libraries/key/                                     
vmap       key                                      ./libraries/key/                                     
ensure_lib                                          ./libraries/sdram_controller_my_partner/             
vmap       sdram_controller_my_partner              ./libraries/sdram_controller_my_partner/             
ensure_lib                                          ./libraries/EmbarcadoVGA_inst_sw_conduit_bfm/        
vmap       EmbarcadoVGA_inst_sw_conduit_bfm         ./libraries/EmbarcadoVGA_inst_sw_conduit_bfm/        
ensure_lib                                          ./libraries/EmbarcadoVGA_inst_reset_bfm/             
vmap       EmbarcadoVGA_inst_reset_bfm              ./libraries/EmbarcadoVGA_inst_reset_bfm/             
ensure_lib                                          ./libraries/EmbarcadoVGA_inst_master_conduit_bfm/    
vmap       EmbarcadoVGA_inst_master_conduit_bfm     ./libraries/EmbarcadoVGA_inst_master_conduit_bfm/    
ensure_lib                                          ./libraries/EmbarcadoVGA_inst_clk_bfm/               
vmap       EmbarcadoVGA_inst_clk_bfm                ./libraries/EmbarcadoVGA_inst_clk_bfm/               
ensure_lib                                          ./libraries/EmbarcadoVGA_inst/                       
vmap       EmbarcadoVGA_inst                        ./libraries/EmbarcadoVGA_inst/                       

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
    eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"  -work cycloneive_ver  
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/verbosity_pkg.sv"                                                                                 -work altera_common_sv_packages               
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -L altera_common_sv_packages -work error_adapter_0                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_1_rsp_mux.sv"                           -L altera_common_sv_packages -work rsp_mux                                 
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                         -L altera_common_sv_packages -work rsp_mux                                 
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_1_cmd_mux.sv"                           -L altera_common_sv_packages -work cmd_mux                                 
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                         -L altera_common_sv_packages -work cmd_mux                                 
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_1_cmd_demux.sv"                         -L altera_common_sv_packages -work cmd_demux                               
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_burst_adapter.sv"                                      -L altera_common_sv_packages -work sdram_controller_s1_burst_adapter       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_burst_adapter_uncmpr.sv"                               -L altera_common_sv_packages -work sdram_controller_s1_burst_adapter       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_burst_adapter_13_1.sv"                                 -L altera_common_sv_packages -work sdram_controller_s1_burst_adapter       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_burst_adapter_new.sv"                                  -L altera_common_sv_packages -work sdram_controller_s1_burst_adapter       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_incr_burst_converter.sv"                                      -L altera_common_sv_packages -work sdram_controller_s1_burst_adapter       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_wrap_burst_converter.sv"                                      -L altera_common_sv_packages -work sdram_controller_s1_burst_adapter       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_default_burst_converter.sv"                                   -L altera_common_sv_packages -work sdram_controller_s1_burst_adapter       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_address_alignment.sv"                                  -L altera_common_sv_packages -work sdram_controller_s1_burst_adapter       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                  -L altera_common_sv_packages -work sdram_controller_s1_burst_adapter       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                    -L altera_common_sv_packages -work sdram_controller_s1_burst_adapter       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_1_router_001.sv"                        -L altera_common_sv_packages -work router_001                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_1_router.sv"                            -L altera_common_sv_packages -work router                                  
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_avalon_st_adapter.v"                                               -work avalon_st_adapter                       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_rsp_mux_001.sv"                       -L altera_common_sv_packages -work rsp_mux_001                             
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                         -L altera_common_sv_packages -work rsp_mux_001                             
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_rsp_mux.sv"                           -L altera_common_sv_packages -work rsp_mux                                 
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                         -L altera_common_sv_packages -work rsp_mux                                 
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_rsp_demux_001.sv"                     -L altera_common_sv_packages -work rsp_demux_001                           
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_cmd_mux_001.sv"                       -L altera_common_sv_packages -work cmd_mux_001                             
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                         -L altera_common_sv_packages -work cmd_mux_001                             
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_cmd_mux.sv"                           -L altera_common_sv_packages -work cmd_mux                                 
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                         -L altera_common_sv_packages -work cmd_mux                                 
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_cmd_demux_001.sv"                     -L altera_common_sv_packages -work cmd_demux_001                           
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_cmd_demux.sv"                         -L altera_common_sv_packages -work cmd_demux                               
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_router_003.sv"                        -L altera_common_sv_packages -work router_003                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_router_002.sv"                        -L altera_common_sv_packages -work router_002                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_router_001.sv"                        -L altera_common_sv_packages -work router_001                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0_router.sv"                            -L altera_common_sv_packages -work router                                  
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                                                          -work processor_debug_mem_slave_agent_rsp_fifo
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_slave_agent.sv"                                        -L altera_common_sv_packages -work processor_debug_mem_slave_agent         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                 -L altera_common_sv_packages -work processor_debug_mem_slave_agent         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_master_agent.sv"                                       -L altera_common_sv_packages -work processor_data_master_agent             
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_slave_translator.sv"                                   -L altera_common_sv_packages -work processor_debug_mem_slave_translator    
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_merlin_master_translator.sv"                                  -L altera_common_sv_packages -work processor_data_master_translator        
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu.v"                                                                     -work cpu                                     
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_debug_slave_sysclk.v"                                                  -work cpu                                     
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_debug_slave_tck.v"                                                     -work cpu                                     
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_debug_slave_wrapper.v"                                                 -work cpu                                     
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor_cpu_test_bench.v"                                                          -work cpu                                     
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_reset_controller.v"                                                                        -work rst_controller                          
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_reset_synchronizer.v"                                                                      -work rst_controller                          
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_irq_mapper.sv"                                          -L altera_common_sv_packages -work irq_mapper                              
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_1.v"                                                                 -work mm_interconnect_1                       
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_mm_interconnect_0.v"                                                                 -work mm_interconnect_0                       
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_sdram_controller.v"                                                                  -work sdram_controller                        
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_sdram_controller_test_component.v"                                                   -work sdram_controller                        
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_ram.v"                                                                               -work ram                                     
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_processor.v"                                                                         -work processor                               
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/Master_Interface.v"                                                                               -work master_interface                        
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA_key.v"                                                                               -work key                                     
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_sdram_partner_module.v"                                                                    -work sdram_controller_my_partner             
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_conduit_bfm_0002.sv"                                          -L altera_common_sv_packages -work EmbarcadoVGA_inst_sw_conduit_bfm        
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_avalon_reset_source.sv"                                       -L altera_common_sv_packages -work EmbarcadoVGA_inst_reset_bfm             
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_conduit_bfm.sv"                                               -L altera_common_sv_packages -work EmbarcadoVGA_inst_master_conduit_bfm    
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/altera_avalon_clock_source.sv"                                       -L altera_common_sv_packages -work EmbarcadoVGA_inst_clk_bfm               
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/submodules/EmbarcadoVGA.v"                                                                                   -work EmbarcadoVGA_inst                       
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/EmbarcadoVGA_tb/simulation/EmbarcadoVGA_tb.v"                                                                                                                                         
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L altera_common_sv_packages -L error_adapter_0 -L rsp_mux -L cmd_mux -L cmd_demux -L sdram_controller_s1_burst_adapter -L router_001 -L router -L avalon_st_adapter -L rsp_mux_001 -L rsp_demux_001 -L cmd_mux_001 -L cmd_demux_001 -L router_003 -L router_002 -L processor_debug_mem_slave_agent_rsp_fifo -L processor_debug_mem_slave_agent -L processor_data_master_agent -L processor_debug_mem_slave_translator -L processor_data_master_translator -L cpu -L rst_controller -L irq_mapper -L mm_interconnect_1 -L mm_interconnect_0 -L sdram_controller -L ram -L processor -L master_interface -L key -L sdram_controller_my_partner -L EmbarcadoVGA_inst_sw_conduit_bfm -L EmbarcadoVGA_inst_reset_bfm -L EmbarcadoVGA_inst_master_conduit_bfm -L EmbarcadoVGA_inst_clk_bfm -L EmbarcadoVGA_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -novopt -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L altera_common_sv_packages -L error_adapter_0 -L rsp_mux -L cmd_mux -L cmd_demux -L sdram_controller_s1_burst_adapter -L router_001 -L router -L avalon_st_adapter -L rsp_mux_001 -L rsp_demux_001 -L cmd_mux_001 -L cmd_demux_001 -L router_003 -L router_002 -L processor_debug_mem_slave_agent_rsp_fifo -L processor_debug_mem_slave_agent -L processor_data_master_agent -L processor_debug_mem_slave_translator -L processor_data_master_translator -L cpu -L rst_controller -L irq_mapper -L mm_interconnect_1 -L mm_interconnect_0 -L sdram_controller -L ram -L processor -L master_interface -L key -L sdram_controller_my_partner -L EmbarcadoVGA_inst_sw_conduit_bfm -L EmbarcadoVGA_inst_reset_bfm -L EmbarcadoVGA_inst_master_conduit_bfm -L EmbarcadoVGA_inst_clk_bfm -L EmbarcadoVGA_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                                         -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                                           -- Compile device library files"
  echo
  echo "com                                               -- Compile the design files in correct order"
  echo
  echo "elab                                              -- Elaborate top level design"
  echo
  echo "elab_debug                                        -- Elaborate the top level design with novopt option"
  echo
  echo "ld                                                -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                                          -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                                    -- Top level module name."
  echo "                                                     For most designs, this should be overridden"
  echo "                                                     to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME                              -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                                       -- Platform Designer base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR                               -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS                      -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS                         -- User-defined elaboration options, added to elab/elab_debug aliases."
  echo
  echo "USER_DEFINED_VHDL_COMPILE_OPTIONS                 -- User-defined vhdl compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_VERILOG_COMPILE_OPTIONS              -- User-defined verilog compile options, added to com/dev_com aliases."
}
file_copy
h
