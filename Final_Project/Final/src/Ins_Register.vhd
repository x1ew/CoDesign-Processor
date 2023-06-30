-------------------------------------------------------------------------------
--
-- Title       : Ins_Register
-- Design      : Final
-- Author      : xahra.ahmadi@yahoo.com
-- Company     : meow
--
-------------------------------------------------------------------------------
--
-- File        : z:\Apps\ActiveHdl store\Final_Project\Final\src\Ins_Register.vhd
-- Generated   : Mon Jun 26 02:35:53 2023
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
--{entity {Ins_Register} architecture {Ins_Register}}
library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity Ins_Register is
	port(	  
		clk : in std_logic;
	    LD : in std_logic;
	    RIN : in std_logic_vector(6 downto 0);
		ROUT : out std_logic_vector(6 downto 0)
	);
end Ins_Register;


architecture Ins_Register of Ins_Register is
signal var : std_logic_vector(6 downto 0);
begin
	process(clk)
	begin 
		if (clk'event and clk = '1') then
			if (LD = '1') then
				var <= RIN;
			end if;	
		end if;
	end process;
	ROUT <= var;
end Ins_Register;
