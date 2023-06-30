library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity reg_tb is
end reg_tb;

architecture TB_ARCHITECTURE of reg_tb is
	-- Component declaration of the tested unit
	component reg
	port(
		clk : in STD_LOGIC;
		LD : in STD_LOGIC;
		ZR : out STD_LOGIC;
		RIN : in STD_LOGIC_VECTOR(6 downto 0);
		ROUT : out STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal LD : STD_LOGIC;
	signal RIN : STD_LOGIC_VECTOR(6 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ZR : STD_LOGIC;
	signal ROUT : STD_LOGIC_VECTOR(6 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : reg
		port map (
			clk => clk,
			LD => LD,
			ZR => ZR,
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
    
    -- Check ZR and ROUT
    assert ZR = '0' report "ZR should be '0'" severity error;
    assert ROUT = "0101010" report "ROUT should be '0101010'" severity error;
    
    -- Load zeros
    LD <= '1';
    RIN <= "0000000";
    wait for 10 ns;
    LD <= '0';
    
    -- Wait for a few clock cycles
    wait for 20 ns;
    
    -- Check ZR and ROUT
    assert ZR = '1' report "ZR should be '1'" severity error;
    assert ROUT = "0000000" report "ROUT should be '0000000'" severity error;
    
    -- End the simulation
    wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_reg of reg_tb is
	for TB_ARCHITECTURE
		for UUT : reg
			use entity work.reg(reg);
		end for;
	end for;
end TESTBENCH_FOR_reg;

