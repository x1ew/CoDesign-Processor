SetActiveLib -work
comp -include "$dsn\src\Control_unit.vhd" 
comp -include "$dsn\src\TestBench\control_unit_TB.vhd" 
asim +access +r TESTBENCH_FOR_control_unit 
wave 
wave -noreg ZR0
wave -noreg ZR1
wave -noreg ZR2
wave -noreg ZR3
wave -noreg ROUTIR
wave -noreg LD0
wave -noreg LD1
wave -noreg LD2
wave -noreg LD3
wave -noreg LDPC
wave -noreg LDIR
wave -noreg Sele0
wave -noreg Sele1
wave -noreg BUS_Sel
wave -noreg CMD
wave -noreg INC
wave -noreg RST
wave -noreg clk
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\control_unit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_control_unit 
