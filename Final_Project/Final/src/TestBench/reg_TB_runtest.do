SetActiveLib -work
comp -include "$dsn\src\Reg.vhd" 
comp -include "$dsn\src\TestBench\reg_TB.vhd" 
asim +access +r TESTBENCH_FOR_reg 
wave 
wave -noreg clk
wave -noreg LD
wave -noreg ZR
wave -noreg RIN
wave -noreg ROUT
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\reg_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_reg 
