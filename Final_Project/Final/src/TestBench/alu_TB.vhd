library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		CMD : in STD_LOGIC_VECTOR(1 downto 0);
		IN1 : in STD_LOGIC_VECTOR(6 downto 0);
		IN2 : in STD_LOGIC_VECTOR(6 downto 0);
		Result : out STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CMD : STD_LOGIC_VECTOR(1 downto 0);
	signal IN1 : STD_LOGIC_VECTOR(6 downto 0);
	signal IN2 : STD_LOGIC_VECTOR(6 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Result : STD_LOGIC_VECTOR(6 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			CMD => CMD,
			IN1 => IN1,
			IN2 => IN2,
			Result => Result
		);

	-- Stimulus process
  stim_process: process
  begin
    -- Test case 1: Addition
    CMD <= "00";
    IN1 <= "0101010";
    IN2 <= "0011001";
    wait for 10 ns;
    assert Result = std_logic_vector(unsigned(IN1) + unsigned(IN2))
      report "Addition operation failed" severity error;
    
    -- Test case 2: Subtraction
    CMD <= "01";
    IN1 <= "1001100";
    IN2 <= "0101010";
    wait for 10 ns;
    assert Result = std_logic_vector(unsigned(IN1) - unsigned(IN2))
      report "Subtraction operation failed" severity error;
    
    -- Test case 3: Multiplication
    CMD <= "10";
    IN1 <= "0110010";
    IN2 <= "0001101";
    wait for 10 ns;
    assert Result = std_logic_vector(unsigned(IN1) * unsigned(IN2))
      report "Multiplication operation failed" severity error;

    -- End the simulation
    wait;
  end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(alu);
		end for;
	end for;
end TESTBENCH_FOR_alu;

