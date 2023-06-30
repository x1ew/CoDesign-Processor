-------------------------------------------------------------------------------
--
-- Title       : Memory
-- Design      : Final
-- Author      : xahra.ahmadi@yahoo.com
-- Company     : meow
--
-------------------------------------------------------------------------------
--
-- File        : Z:\Apps\ActiveHdl store\Final_Project\Final\src\Memory.vhd
-- Generated   : Mon Jun 26 04:11:18 2023
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
--{entity {Memory} architecture {Memory}}
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;


entity Memory is 
	port(
		Address : in std_logic_vector(6 downto 0);
		Data : out std_logic_vector(6 downto 0)
	);
end Memory;

--}} End of automatically maintained section

architecture Memory of Memory is 
type rom is array(63 downto 0) of std_logic_vector(6 downto 0);
signal var : rom;
begin

	var(0) <= "0000011";
	var(1) <= "0000011";
	var(2) <= "0000111";
	var(3) <= "0000010";
	var(4) <= "0001011";
	var(5) <= "0000000"; 
	var(6) <= "0001111";
	var(7) <= "0000001";
	var(8) <= "0011000";
	var(9) <= "0100111";
	var(10) <= "0110100";
	var(11) <= "0001000";
	var(12) <= "0000000";

	
	Data <= var(to_integer(unsigned(Address)));
end Memory;
