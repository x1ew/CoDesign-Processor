-------------------------------------------------------------------------------
--
-- Title       : \Register\
-- Design      : Final
-- Author      : xahra.ahmadi@yahoo.com
-- Company     : meow
--
-------------------------------------------------------------------------------
--
-- File        : z:\Apps\ActiveHdl store\Final_Project\Final\src\Register.vhd
-- Generated   : Mon Jun 26 01:32:51 2023
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
--{entity {\Register\} architecture {\Register\}}
library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity \Register\ is  
	port(	  
		clk : in std_logic;
	    LD : in std_logic;
		ZR : out std_logic;
	    RIN : in std_logic_vector(5 downto 0);
		ROUT : out std_logic_vector(5 downto 0)
	);
end \Register\;



architecture \Register\ of \Register\ is 
signal var : std_logic_vector(5 downto 0) := "000000";
begin
	process(clk)
	begin 
		if (clk'event and clk = '1') then
			if (LD = '1') then
				var <= RIN;
			end if;	
		end if;
	end process;
	ZR <= '1' when var = "000000" else '0'; 
	ROUT <= var;
end \Register\;
