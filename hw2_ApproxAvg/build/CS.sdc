###################################################################

# Created by write_sdc on Wed Oct 27 16:19:18 2021

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max WCCOM -max_library                               \
fsa0m_a_generic_core_ss1p62v125c\
                         -min BCCOM -min_library                               \
fsa0m_a_generic_core_ff1p98vm40c
set_wire_load_model -name G5K -library fsa0m_a_generic_core_ss1p62v125c
set_load -pin_load 0.1 [get_ports {Y[9]}]
set_load -pin_load 0.1 [get_ports {Y[8]}]
set_load -pin_load 0.1 [get_ports {Y[7]}]
set_load -pin_load 0.1 [get_ports {Y[6]}]
set_load -pin_load 0.1 [get_ports {Y[5]}]
set_load -pin_load 0.1 [get_ports {Y[4]}]
set_load -pin_load 0.1 [get_ports {Y[3]}]
set_load -pin_load 0.1 [get_ports {Y[2]}]
set_load -pin_load 0.1 [get_ports {Y[1]}]
set_load -pin_load 0.1 [get_ports {Y[0]}]
set_max_fanout 20 [get_ports clk]
set_max_fanout 20 [get_ports reset]
set_max_fanout 20 [get_ports {X[7]}]
set_max_fanout 20 [get_ports {X[6]}]
set_max_fanout 20 [get_ports {X[5]}]
set_max_fanout 20 [get_ports {X[4]}]
set_max_fanout 20 [get_ports {X[3]}]
set_max_fanout 20 [get_ports {X[2]}]
set_max_fanout 20 [get_ports {X[1]}]
set_max_fanout 20 [get_ports {X[0]}]
create_clock [get_ports clk]  -period 30  -waveform {0 15}
set_clock_latency 0.5  [get_clocks clk]
set_clock_uncertainty 0.1  [get_clocks clk]
set_input_delay -clock clk  5  [get_ports reset]
set_input_delay -clock clk  5  [get_ports {X[7]}]
set_input_delay -clock clk  5  [get_ports {X[6]}]
set_input_delay -clock clk  5  [get_ports {X[5]}]
set_input_delay -clock clk  5  [get_ports {X[4]}]
set_input_delay -clock clk  5  [get_ports {X[3]}]
set_input_delay -clock clk  5  [get_ports {X[2]}]
set_input_delay -clock clk  5  [get_ports {X[1]}]
set_input_delay -clock clk  5  [get_ports {X[0]}]
set_output_delay -clock clk  0.5  [get_ports {Y[9]}]
set_output_delay -clock clk  0.5  [get_ports {Y[8]}]
set_output_delay -clock clk  0.5  [get_ports {Y[7]}]
set_output_delay -clock clk  0.5  [get_ports {Y[6]}]
set_output_delay -clock clk  0.5  [get_ports {Y[5]}]
set_output_delay -clock clk  0.5  [get_ports {Y[4]}]
set_output_delay -clock clk  0.5  [get_ports {Y[3]}]
set_output_delay -clock clk  0.5  [get_ports {Y[2]}]
set_output_delay -clock clk  0.5  [get_ports {Y[1]}]
set_output_delay -clock clk  0.5  [get_ports {Y[0]}]
set_drive 1  [get_ports clk]
set_drive 1  [get_ports reset]
set_drive 1  [get_ports {X[7]}]
set_drive 1  [get_ports {X[6]}]
set_drive 1  [get_ports {X[5]}]
set_drive 1  [get_ports {X[4]}]
set_drive 1  [get_ports {X[3]}]
set_drive 1  [get_ports {X[2]}]
set_drive 1  [get_ports {X[1]}]
set_drive 1  [get_ports {X[0]}]
