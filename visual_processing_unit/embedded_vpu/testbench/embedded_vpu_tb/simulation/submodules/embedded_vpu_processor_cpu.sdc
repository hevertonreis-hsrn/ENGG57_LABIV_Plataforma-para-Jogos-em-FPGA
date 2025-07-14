# Legal Notice: (C)2025 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	embedded_vpu_processor_cpu 	embedded_vpu_processor_cpu:*
set 	embedded_vpu_processor_cpu_oci 	embedded_vpu_processor_cpu_nios2_oci:the_embedded_vpu_processor_cpu_nios2_oci
set 	embedded_vpu_processor_cpu_oci_break 	embedded_vpu_processor_cpu_nios2_oci_break:the_embedded_vpu_processor_cpu_nios2_oci_break
set 	embedded_vpu_processor_cpu_ocimem 	embedded_vpu_processor_cpu_nios2_ocimem:the_embedded_vpu_processor_cpu_nios2_ocimem
set 	embedded_vpu_processor_cpu_oci_debug 	embedded_vpu_processor_cpu_nios2_oci_debug:the_embedded_vpu_processor_cpu_nios2_oci_debug
set 	embedded_vpu_processor_cpu_wrapper 	embedded_vpu_processor_cpu_debug_slave_wrapper:the_embedded_vpu_processor_cpu_debug_slave_wrapper
set 	embedded_vpu_processor_cpu_jtag_tck 	embedded_vpu_processor_cpu_debug_slave_tck:the_embedded_vpu_processor_cpu_debug_slave_tck
set 	embedded_vpu_processor_cpu_jtag_sysclk 	embedded_vpu_processor_cpu_debug_slave_sysclk:the_embedded_vpu_processor_cpu_debug_slave_sysclk
set 	embedded_vpu_processor_cpu_oci_path 	 [format "%s|%s" $embedded_vpu_processor_cpu $embedded_vpu_processor_cpu_oci]
set 	embedded_vpu_processor_cpu_oci_break_path 	 [format "%s|%s" $embedded_vpu_processor_cpu_oci_path $embedded_vpu_processor_cpu_oci_break]
set 	embedded_vpu_processor_cpu_ocimem_path 	 [format "%s|%s" $embedded_vpu_processor_cpu_oci_path $embedded_vpu_processor_cpu_ocimem]
set 	embedded_vpu_processor_cpu_oci_debug_path 	 [format "%s|%s" $embedded_vpu_processor_cpu_oci_path $embedded_vpu_processor_cpu_oci_debug]
set 	embedded_vpu_processor_cpu_jtag_tck_path 	 [format "%s|%s|%s" $embedded_vpu_processor_cpu_oci_path $embedded_vpu_processor_cpu_wrapper $embedded_vpu_processor_cpu_jtag_tck]
set 	embedded_vpu_processor_cpu_jtag_sysclk_path 	 [format "%s|%s|%s" $embedded_vpu_processor_cpu_oci_path $embedded_vpu_processor_cpu_wrapper $embedded_vpu_processor_cpu_jtag_sysclk]
set 	embedded_vpu_processor_cpu_jtag_sr 	 [format "%s|*sr" $embedded_vpu_processor_cpu_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$embedded_vpu_processor_cpu_oci_break_path|break_readreg*] -to [get_keepers *$embedded_vpu_processor_cpu_jtag_sr*]
set_false_path -from [get_keepers *$embedded_vpu_processor_cpu_oci_debug_path|*resetlatch]     -to [get_keepers *$embedded_vpu_processor_cpu_jtag_sr[33]]
set_false_path -from [get_keepers *$embedded_vpu_processor_cpu_oci_debug_path|monitor_ready]  -to [get_keepers *$embedded_vpu_processor_cpu_jtag_sr[0]]
set_false_path -from [get_keepers *$embedded_vpu_processor_cpu_oci_debug_path|monitor_error]  -to [get_keepers *$embedded_vpu_processor_cpu_jtag_sr[34]]
set_false_path -from [get_keepers *$embedded_vpu_processor_cpu_ocimem_path|*MonDReg*] -to [get_keepers *$embedded_vpu_processor_cpu_jtag_sr*]
set_false_path -from *$embedded_vpu_processor_cpu_jtag_sr*    -to *$embedded_vpu_processor_cpu_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$embedded_vpu_processor_cpu_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$embedded_vpu_processor_cpu_oci_debug_path|monitor_go
