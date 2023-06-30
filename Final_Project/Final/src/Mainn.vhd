-------------------------------------------------------------------------------
--
-- Title       : Mainn
-- Design      : Final
-- Author      : xahra.ahmadi@yahoo.com
-- Company     : meow
--
-------------------------------------------------------------------------------
--
-- File        : Z:\Apps\ActiveHdl store\Final_Project\Final\src\Mainn.vhd
-- Generated   : Tue Jun 27 00:04:34 2023
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Mainn} architecture {Mainn}}
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;


entity Mainn is
	port (
		clk : in std_logic;
		output0 : out std_logic_vector(6 downto 0);	 
		output1 : out std_logic_vector(6 downto 0);
		output2 : out std_logic_vector(6 downto 0);
		output3 : out std_logic_vector(6 downto 0)
	);
end Mainn;

										
architecture Mainn of Mainn is
signal LD0, LD1, LD2, LD3, LDPC, LDIR, BUS_Sel, RST, INC, ZR0, ZR1, ZR2, ZR3 : std_logic;
signal S0, S1, CMD : std_logic_vector(1 downto 0);
signal MData, IN1, IN2, Address, ROUTIR, ROUT0, ROUT1, ROUT2, ROUT3, ALURes, BUSs :std_logic_vector(6 downto 0);	
begin
	REG0 : entity work.Reg(Reg)
		port map(
			clk => clk,
	    	LD => LD0,
			ZR => ZR0,
	    	RIN => BUSs,
			ROUT => ROUT0
		);
	REG1 : entity work.Reg(Reg)
		port map(
			clk => clk,
	    	LD => LD1,
			ZR => ZR1,
	    	RIN => BUSs,
			ROUT => ROUT1
		);
	REG2 : entity work.Reg(Reg)
		port map(
			clk => clk,
	    	LD => LD2,
			ZR => ZR2,
	    	RIN => BUSs,
			ROUT => ROUT2
		);
	REG3 : entity work.Reg(Reg)
		port map(
			clk => clk,
	    	LD => LD3,
			ZR => ZR3,
	    	RIN => BUSs,
			ROUT => ROUT3
		);
	PC_Register : entity work.PC_Register(PC_Register)
		port map(
			clk => clk,
			LD => LDPC,
			INC => INC,
			CLR => RST,
	    	RIN => BUSs,
			ROUT => Address		
		);
	Ins_Register : entity work.Ins_Register(Ins_Register)
		port map(
			clk => clk,
			LD => LDIR,
	    	RIN => BUSs,
			ROUT => ROUTIR		
		);
	Memory : entity work.Memory(Memory) 
		port map(	
			Address => Address,
			Data => MData
		);
	ALU : entity work.ALU(ALU)
		port map (
			CMD => CMD,
	    	IN1 => IN1,
			IN2 => IN2,
			Result => ALURes
		);
	Control_unit : entity work.Control_unit(Control_unit)
		port map (
			ZR0 => ZR0,	
			ZR1 => ZR1,
			ZR2 => ZR2,
			ZR3 => ZR3,
			ROUTIR => ROUTIR,
			LD0 => LD0,
			LD1 => LD1,
			LD2 => LD2,
			LD3 => LD3,
			LDPC => LDPC, 
			LDIR => LDIR,
			Sele0 => S0,
			Sele1 => S1,
			BUS_Sel => BUS_Sel,
			CMD => CMD, 
			INC => INC,
			RST => RST,
			clk => clk
		);
			
	
	IN1 <= ROUT0 when S0 = "00" else ROUT1 when S0 = "01" else ROUT2 when S0 = "10" else ROUT3; --Multiplexer1

	--Multiplexer2
	
	IN2 <= ROUT0 when S1 = "00" else ROUT1 when S1 = "01" else ROUT2 when S1 = "10" else ROUT3;
	
	--Multiplexer3 
	BUSs <= MData when BUS_Sel = '0' else ALURes;

	
	output0 <= ROUT0;
	output1 <= ROUT1;
	output2 <= ROUT2;
	output3 <= ROUT3;
	
end Mainn;
