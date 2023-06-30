library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity pc_register_tb is
end pc_register_tb;

architecture TB_ARCHITECTURE of pc_register_tb is
	-- Component declaration of the tested unit
	component pc_register
	port(
		clk : in STD_LOGIC;
		LD : in STD_LOGIC;
		INC : in STD_LOGIC;
		CLR : in STD_LOGIC;
		RIN : in STD_LOGIC_VECTOR(6 downto 0);
		ROUT : out STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal LD : STD_LOGIC;
	signal INC : STD_LOGIC;
	signal CLR : STD_LOGIC;
	signal RIN : STD_LOGIC_VECTOR(6 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ROUT : STD_LOGIC_VECTOR(6 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : pc_register
		port map (
			clk => clk,
			LD => LD,
			INC => INC,
			CLR => CLR,
			RIN => RIN,
			ROUT => ROUT
		);

	-- Clock process
  process
  begin
    while now < 1000 ns loop
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
    end loop;
    wait;
  end process;

  -- Stimulus process
  process
  begin
    LD    <= '0';
    INC   <= '0';
    CLR   <= '0';
    RIN   <= (others => '0');

    wait for 10 ns;

    -- Test case 1
    LD    <= '1';
    RIN   <= "0101010";

    wait for 10 ns;

    -- Test case 2
    LD    <= '0';
    INC   <= '1';

    wait for 10 ns;

    -- Test case 3
    INC   <= '0';
    CLR   <= '1';

    wait for 10 ns;

    -- Test case 4
    CLR   <= '0';

    wait;

  end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_pc_register of pc_register_tb is
	for TB_ARCHITECTURE
		for UUT : pc_register
			use entity work.pc_register(pc_register);
		end for;
	end for;
end TESTBENCH_FOR_pc_register;

