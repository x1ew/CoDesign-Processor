-------------------------------------------------------------------------------
--
-- Title       : Control_unit
-- Design      : Final
-- Author      : xahra.ahmadi@yahoo.com
-- Company     : meow
--
-------------------------------------------------------------------------------
--
-- File        : Z:\Apps\ActiveHdl store\Final_Project\Final\src\Control_unit.vhd
-- Generated   : Mon Jun 26 04:39:24 2023
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
--{entity {Control_unit} architecture {Control_unit}}
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;


entity Control_unit is 
	port(
		ZR0 : in std_logic;	
		ZR1 : in std_logic;
		ZR2 : in std_logic;
		ZR3 : in std_logic;
		ROUTIR : in std_logic_vector(6 downto 0);
		LD0 : out std_logic;
		LD1 : out std_logic;
		LD2 : out std_logic;
		LD3 : out std_logic;
		LDPC : out std_logic;
		LDIR : out std_logic;
		Sele0 : out std_logic_vector(1 downto 0);
		Sele1 : out std_logic_vector(1 downto 0);
		BUS_Sel : out std_logic;
		CMD : out std_logic_vector(1 downto 0);
		INC : out std_logic;
		RST : in std_logic;
		clk : in std_logic
	);	
end Control_unit;


architecture Control_unit of Control_unit is   
type state is(s0, s1, s2, s3, s4, s5, s6, s7, s8, D);
Signal statereg, statenext : state := s0;	
Signal ZR : std_logic_vector(3 downto 0);
Signal index : integer;
begin
	index <= to_integer(unsigned(ROUTIR(3 downto 2)));
	ZR(0) <= ZR0;
	ZR(1) <= ZR1;
	ZR(2) <= ZR2;
	ZR(3) <= ZR3;
	
	process(clk, RST) 
	begin
		if (RST = '1') then
			statereg <= s0;
		elsif (clk'event and clk = '1') then
			statereg <= statenext;
		end if;
	end process; 
	
	process(statereg, ZR0, ZR1, ZR2, ZR3, ROUTIR)
	begin
	LD0 <= '0';
	LD1 <= '0';
	LD2 <= '0';
	LD3 <= '0';
	LDPC <= '0';
	LDIR <= '0';
	BUS_Sel <= '0';
	INC <= '0';
	Sele0 <= "UU";
	Sele1 <= "UU";
	case statereg is
		when s0 =>
			statenext <= s1;
			LD0 <= '0';
			LD1 <= '0';
			LD2 <= '0';
			LD3 <= '0';
			LDPC <= '0';
			LDIR <= '0';
			BUS_Sel <= '0';
			INC <= '0';
			CMD <= "00";
		when s1 =>
			statenext <= D;
			LDIR <= '1';
			INC <= '1';
			BUS_Sel <= '0';	
			LD0 <= '0';
			LD1 <= '0';
			LD2 <= '0';
			LD3 <= '0';
			LDPC <= '0';
		when D =>
			if ROUTIR = "0000000" then
				statenext <= s2;
			else 
				if ROUTIR(6 downto 4) = "000" then
					statenext <= s3;
				elsif ROUTIR(6 downto 4) = "001" then
					statenext <= s4;
				elsif ROUTIR(6 downto 4) = "010" then 
					statenext <= s5;
				elsif ROUTIR(6 downto 4) = "011" then
					if ZR(index) = '0' then
						statenext <= s6;
					else 
						statenext <= s7;
					end if;
				elsif ROUTIR(6 downto 4) = "100" then 
					statenext <= s8;
				end if;
			end if;
		when s2 => 
			statenext <= s2;
	    when s3 => 
			statenext <= s1;
			if ROUTIR(3 downto 2) = "00" then
				LD0 <= '1';	 
				LD1 <= '0';
				LD2 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "01" then
				LD1 <= '1';
				LD0 <= '0';
				LD2 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "10" then
				LD2 <= '1';
				LD1 <= '0';
				LD0 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "11" then
				LD3 <= '1';	
				LD1 <= '0';
				LD2 <= '0';
				LD0 <= '0';
			end if;
			INC <= '1';
		when s4 => 
			statenext <= s1;
			if ROUTIR(3 downto 2) = "00" then
				LD0 <= '1';
				LD1 <= '0';
				LD2 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "01" then
				LD1 <= '1';
				LD0 <= '0';
				LD2 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "10" then
				LD2 <= '1';
				LD1 <= '0';
				LD0 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "11" then
				LD3 <= '1';
				LD1 <= '0';
				LD2 <= '0';
				LD0 <= '0';
			end if;	
			CMD <= "00";
			Sele0 <= ROUTIR(3 downto 2);
			Sele1 <= ROUTIR(1 downto 0);
			BUS_Sel <= '1';
		when s5 =>
			statenext <= s1;
			if ROUTIR(3 downto 2) = "00" then
				LD0 <= '1';	
				LD1 <= '0';
				LD2 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "01" then
				LD1 <= '1';
				LD0 <= '0';
				LD2 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "10" then
				LD2 <= '1';	
				LD1 <= '0';
				LD0 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "11" then
				LD3 <= '1';
				LD1 <= '0';
				LD2 <= '0';
				LD0 <= '0';
			end if;	
			CMD <= "01";
			Sele0 <= ROUTIR(3 downto 2);
			Sele1 <= ROUTIR(1 downto 0);
			BUS_Sel <= '1';	
		when s6 =>
			statenext <= s1;
			LDPC <= '1';
		when s7 => 
			statenext <= s1;
			INC <= '1'; 
		when s8 =>
			statenext <= s1;
			if ROUTIR(3 downto 2) = "00" then
				LD0 <= '1';
				LD1 <= '0';
				LD2 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "01" then
				LD1 <= '1';
				LD0 <= '0';
				LD2 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "10" then
				LD2 <= '1';
				LD1 <= '0';
				LD0 <= '0';
				LD3 <= '0';
			elsif ROUTIR(3 downto 2) = "11" then
				LD3 <= '1';
				LD1 <= '0';
				LD2 <= '0';
				LD0 <= '0';
			end if;	
			CMD <= "10";
			Sele0 <= ROUTIR(3 downto 2);
			Sele1 <= ROUTIR(1 downto 0);
			BUS_Sel <= '1';
		end case;	
	end process;			
end Control_unit;
