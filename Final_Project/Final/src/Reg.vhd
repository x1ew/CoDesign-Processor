-------------------------------------------------------------------------------
--
-- Title       : Reg
-- Design      : Final
-- Author      : xahra.ahmadi@yahoo.com
-- Company     : meow
--
-------------------------------------------------------------------------------
--
-- File        : Z:\Apps\ActiveHdl store\Final_Project\Final\src\Reg.vhd
-- Generated   : Tue Jun 27 02:12:16 2023
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
--{entity {Reg} architecture {Reg}}
library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity Reg is
	port(	  
		clk : in std_logic;
	    LD : in std_logic;
		ZR : out std_logic;
	    RIN : in std_logic_vector(6 downto 0);
		ROUT : out std_logic_vector(6 downto 0)
	);
end Reg;


architecture Reg of Reg is
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
	ZR <= '1' when var = "0000000" else '0'; 
	ROUT <= var;
end Reg;