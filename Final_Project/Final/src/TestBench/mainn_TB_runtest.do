SetActiveLib -work
comp -include "$dsn\src\Mainn.vhd" 
comp -include "$dsn\src\TestBench\mainn_TB.vhd" 
asim +access +r TESTBENCH_FOR_mainn 
wave 
wave -noreg clk
wave -noreg output0
wave -noreg output1
wave -noreg output2
wave -noreg output3
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\mainn_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_mainn 
