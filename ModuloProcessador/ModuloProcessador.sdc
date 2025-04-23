derive_clock_uncertainty
create_clock -name clk -period 40.0 [get_ports clk]
set_false_path -from [get_ports altera_reserved_tdi]
set_false_path -from [get_ports altera_reserved_tms]
set_false_path -from [get_ports rst]
set_false_path -from [get_ports altera_reserved_tdo]
