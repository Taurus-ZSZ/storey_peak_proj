## Generated SDC file "E:/share/02_Learning/01_FPGA/04_SOC/01_Nios_II/01_proj/01_hello/src/01_constarint/timing.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus Prime License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Standard Edition"

## DATE    "Tue Nov 02 21:14:17 2021"

##
## DEVICE  "5SGSMD5K1F40C1"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 33.333 -waveform { 0.000 16.666 } [get_ports {altera_reserved_tck}]
create_clock -name {CLK_125M} -period 8.000 -waveform { 0.000 4.000 } [get_ports {CLK_125M}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {CLK_125M}] -rise_to [get_clocks {CLK_125M}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLK_125M}] -rise_to [get_clocks {CLK_125M}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {CLK_125M}] -fall_to [get_clocks {CLK_125M}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLK_125M}] -fall_to [get_clocks {CLK_125M}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {CLK_125M}] -rise_to [get_clocks {CLK_125M}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLK_125M}] -rise_to [get_clocks {CLK_125M}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {CLK_125M}] -fall_to [get_clocks {CLK_125M}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLK_125M}] -fall_to [get_clocks {CLK_125M}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.030  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.030  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.030  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.030  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]
set_false_path -from [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_nios2_oci_break:the_mysystem_nios2_nios2_oci_break|break_readreg*}] -to [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_jtag_debug_module_wrapper:the_mysystem_nios2_jtag_debug_module_wrapper|mysystem_nios2_jtag_debug_module_tck:the_mysystem_nios2_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_nios2_oci_debug:the_mysystem_nios2_nios2_oci_debug|*resetlatch}] -to [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_jtag_debug_module_wrapper:the_mysystem_nios2_jtag_debug_module_wrapper|mysystem_nios2_jtag_debug_module_tck:the_mysystem_nios2_jtag_debug_module_tck|*sr[33]}]
set_false_path -from [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_nios2_oci_debug:the_mysystem_nios2_nios2_oci_debug|monitor_ready}] -to [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_jtag_debug_module_wrapper:the_mysystem_nios2_jtag_debug_module_wrapper|mysystem_nios2_jtag_debug_module_tck:the_mysystem_nios2_jtag_debug_module_tck|*sr[0]}]
set_false_path -from [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_nios2_oci_debug:the_mysystem_nios2_nios2_oci_debug|monitor_error}] -to [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_jtag_debug_module_wrapper:the_mysystem_nios2_jtag_debug_module_wrapper|mysystem_nios2_jtag_debug_module_tck:the_mysystem_nios2_jtag_debug_module_tck|*sr[34]}]
set_false_path -from [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_nios2_ocimem:the_mysystem_nios2_nios2_ocimem|*MonDReg*}] -to [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_jtag_debug_module_wrapper:the_mysystem_nios2_jtag_debug_module_wrapper|mysystem_nios2_jtag_debug_module_tck:the_mysystem_nios2_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_jtag_debug_module_wrapper:the_mysystem_nios2_jtag_debug_module_wrapper|mysystem_nios2_jtag_debug_module_tck:the_mysystem_nios2_jtag_debug_module_tck|*sr*}] -to [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_jtag_debug_module_wrapper:the_mysystem_nios2_jtag_debug_module_wrapper|mysystem_nios2_jtag_debug_module_sysclk:the_mysystem_nios2_jtag_debug_module_sysclk|*jdo*}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_jtag_debug_module_wrapper:the_mysystem_nios2_jtag_debug_module_wrapper|mysystem_nios2_jtag_debug_module_sysclk:the_mysystem_nios2_jtag_debug_module_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*mysystem_nios2:*|mysystem_nios2_nios2_oci:the_mysystem_nios2_nios2_oci|mysystem_nios2_nios2_oci_debug:the_mysystem_nios2_nios2_oci_debug|monitor_go}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

