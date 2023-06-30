library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity ins_register_tb is
end ins_register_tb;

architecture TB_ARCHITECTURE of ins_register_tb is
	-- Component declaration of the tested unit
	component ins_register
	port(
		clk : in STD_LOGIC;
		LD : in STD_LOGIC;
		RIN : in STD_LOGIC_VECTOR(6 downto 0);
		ROUT : out STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal LD : STD_LOGIC;
	signal RIN : STD_LOGIC_VECTOR(6 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ROUT : STD_LOGIC_VECTOR(6 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : ins_register
		port map (
			clk => clk,
			LD => LD,
			RIN => RIN,
			ROUT => ROUT
		);

	-- Clock process
  clk_process: process
  begin
    while now < 100 ns loop
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
    end loop;
    wait;
  end process;

  -- Stimulus process
  stim_process: process
  begin
    -- Load data
    LD <= '1';
    RIN <= "0101010";
    wait for 10 ns;
    LD <= '0';
    
    -- Wait for a few clock cycles
    wait for 20 ns;
    
    -- Check ROUT
    assert ROUT = "0101010" report "ROUT should be '0101010'" severity error;
    
    -- Load different data
    LD <= '1';
    RIN <= "1100110";
    wait for 10 ns;
    LD <= '0';
    
    -- Wait for a few clock cycles
    wait for 20 ns;
    
    -- Check ROUT
    assert ROUT = "1100110" report "ROUT should be '1100110'" severity error;
    
    -- End the simulation
    wait;
  end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_ins_register of ins_register_tb is
	for TB_ARCHITECTURE
		for UUT : ins_register
			use entity work.ins_register(ins_register);
		end for;
	end for;
end TESTBENCH_FOR_ins_register;

