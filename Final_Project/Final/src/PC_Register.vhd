-------------------------------------------------------------------------------
--
-- Title       : PC_Register
-- Design      : Final
-- Author      : xahra.ahmadi@yahoo.com
-- Company     : meow
--
-------------------------------------------------------------------------------
--
-- File        : z:\Apps\ActiveHdl store\Final_Project\Final\src\PC_Register.vhd
-- Generated   : Mon Jun 26 02:38:05 2023
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
--{entity {PC_Register} architecture {PC_Register}}
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;


entity PC_Register is
	port(	  
		clk : in std_logic;
	    LD : in std_logic;
		INC : in std_logic;
		CLR : in std_logic;
	    RIN : in std_logic_vector(6 downto 0);
		ROUT : out std_logic_vector(6 downto 0)
	);
end PC_Register;


architecture PC_Register of PC_Register is
signal vir : std_logic_vector(6 downto 0);
begin
	process(clk, CLR) 
	variable var : std_logic_vector(6 downto 0) := (others => '0');
	begin 
		if (CLR = '1') then 
			var := "0000000";
		elsif (clk'event and clk = '1') then
			if (LD = '1') then
				var := RIN;
			end if;
			if (INC = '1') then
				var := std_logic_vector(unsigned(var) + 1);
			end if;
		end if;
		vir <= var;
	end process;
	ROUT <= vir;
end PC_Register;
