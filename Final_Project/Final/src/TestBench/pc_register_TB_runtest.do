SetActiveLib -work
comp -include "$dsn\src\PC_Register.vhd" 
comp -include "$dsn\src\TestBench\pc_register_TB.vhd" 
asim +access +r TESTBENCH_FOR_pc_register 
wave 
wave -noreg clk
wave -noreg LD
wave -noreg INC
wave -noreg CLR
wave -noreg RIN
wave -noreg ROUT
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\pc_register_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_pc_register 
