SetActiveLib -work
comp -include "$dsn\src\Ins_Register.vhd" 
comp -include "$dsn\src\TestBench\ins_register_TB.vhd" 
asim +access +r TESTBENCH_FOR_ins_register 
wave 
wave -noreg clk
wave -noreg LD
wave -noreg RIN
wave -noreg ROUT
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\ins_register_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_ins_register 
