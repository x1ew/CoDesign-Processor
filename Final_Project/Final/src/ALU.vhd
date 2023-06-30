-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : Final
-- Author      : xahra.ahmadi@yahoo.com
-- Company     : meow
--
-------------------------------------------------------------------------------
--
-- File        : Z:\Apps\ActiveHdl store\Final_Project\Final\src\ALU.vhd
-- Generated   : Mon Jun 26 03:47:34 2023
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
--{entity {ALU} architecture {ALU}}
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;


entity ALU is
	port(	  
		CMD : in std_logic_vector(1 downto 0);
	    IN1 : in std_logic_vector(6 downto 0);
		IN2 : in std_logic_vector(6 downto 0);
		Result : out std_logic_vector(6 downto 0)
	);
end ALU;


architecture ALU of ALU is 
begin
	process(CMD, IN1, IN2)
	variable var : std_logic_vector(13 downto 0);
	begin
		if (CMD = "00") then
				Result <= std_logic_vector(unsigned(IN1) + unsigned(IN2));
		elsif (CMD = "01") then 
				Result <= std_logic_vector(unsigned(IN1) - unsigned(IN2));
		elsif (CMD = "10") then	
				var := std_logic_vector(unsigned(IN1) * unsigned(IN2));
				Result <= var(6 downto 0);
		end if;
	end process;
end ALU;
