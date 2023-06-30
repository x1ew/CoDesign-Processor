library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity memory_tb is
end memory_tb;

architecture TB_ARCHITECTURE of memory_tb is
	-- Component declaration of the tested unit
	component memory
	port(
		Address : in STD_LOGIC_VECTOR(6 downto 0);
		Data : out STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Address : STD_LOGIC_VECTOR(6 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Data : STD_LOGIC_VECTOR(6 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : memory
		port map (
			Address => Address,
			Data => Data
		);

	-- Stimulus process
  stim_process: process
  begin
    -- Test case 1: Read from address 0
    Address <= "0000000";
    wait for 10 ns;
    assert Data = "0000011"
      report "Read from address 0 failed" severity error;
    
    -- Test case 2: Read from address 5
    Address <= "0000101";
    wait for 10 ns;
    assert Data = "0000000"
      report "Read from address 5 failed" severity error;
    
    -- Test case 3: Read from address 10
    Address <= "0001010";
    wait for 10 ns;
    assert Data = "0110100"
      report "Read from address 10 failed" severity error;
    
    -- Test case 4: Read from address 12
    Address <= "0001100";
    wait for 10 ns;
    assert Data = "0001000"
      report "Read from address 12 failed" severity error;

    -- End the simulation
    wait;
  end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_memory of memory_tb is
	for TB_ARCHITECTURE
		for UUT : memory
			use entity work.memory(memory);
		end for;
	end for;
end TESTBENCH_FOR_memory;

