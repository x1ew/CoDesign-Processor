library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity mainn_tb is
end mainn_tb;

architecture TB_ARCHITECTURE of mainn_tb is
	-- Component declaration of the tested unit
	component mainn
	port(
		clk : in STD_LOGIC;
		output0 : out STD_LOGIC_VECTOR(6 downto 0);
		output1 : out STD_LOGIC_VECTOR(6 downto 0);
		output2 : out STD_LOGIC_VECTOR(6 downto 0);
		output3 : out STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output0 : STD_LOGIC_VECTOR(6 downto 0);
	signal output1 : STD_LOGIC_VECTOR(6 downto 0);
	signal output2 : STD_LOGIC_VECTOR(6 downto 0);
	signal output3 : STD_LOGIC_VECTOR(6 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : mainn
		port map (
			clk => clk,
			output0 => output0,
			output1 => output1,
			output2 => output2,
			output3 => output3
		);

	process
	begin 
		clk <= '0';
		wait for 5ns;
		clk <= '1';
		wait for 5ns;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mainn of mainn_tb is
	for TB_ARCHITECTURE
		for UUT : mainn
			use entity work.mainn(mainn);
		end for;
	end for;
end TESTBENCH_FOR_mainn;

