library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity control_unit_tb is
end control_unit_tb;

architecture TB_ARCHITECTURE of control_unit_tb is
	-- Component declaration of the tested unit
	component control_unit
	port(
		ZR0 : in STD_LOGIC;
		ZR1 : in STD_LOGIC;
		ZR2 : in STD_LOGIC;
		ZR3 : in STD_LOGIC;
		ROUTIR : in STD_LOGIC_VECTOR(6 downto 0);
		LD0 : out STD_LOGIC;
		LD1 : out STD_LOGIC;
		LD2 : out STD_LOGIC;
		LD3 : out STD_LOGIC;
		LDPC : out STD_LOGIC;
		LDIR : out STD_LOGIC;
		Sele0 : out STD_LOGIC_VECTOR(1 downto 0);
		Sele1 : out STD_LOGIC_VECTOR(1 downto 0);
		BUS_Sel : out STD_LOGIC;
		CMD : out STD_LOGIC_VECTOR(1 downto 0);
		INC : out STD_LOGIC;
		RST : in STD_LOGIC;
		clk : in STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal ZR0 : STD_LOGIC;
	signal ZR1 : STD_LOGIC;
	signal ZR2 : STD_LOGIC;
	signal ZR3 : STD_LOGIC;
	signal ROUTIR : STD_LOGIC_VECTOR(6 downto 0);
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal LD0 : STD_LOGIC;
	signal LD1 : STD_LOGIC;
	signal LD2 : STD_LOGIC;
	signal LD3 : STD_LOGIC;
	signal LDPC : STD_LOGIC;
	signal LDIR : STD_LOGIC;
	signal Sele0 : STD_LOGIC_VECTOR(1 downto 0);
	signal Sele1 : STD_LOGIC_VECTOR(1 downto 0);
	signal BUS_Sel : STD_LOGIC;
	signal CMD : STD_LOGIC_VECTOR(1 downto 0);
	signal INC : STD_LOGIC;
	signal RST : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : control_unit
		port map (
			ZR0 => ZR0,
			ZR1 => ZR1,
			ZR2 => ZR2,
			ZR3 => ZR3,
			ROUTIR => ROUTIR,
			LD0 => LD0,
			LD1 => LD1,
			LD2 => LD2,
			LD3 => LD3,
			LDPC => LDPC,
			LDIR => LDIR,
			Sele0 => Sele0,
			Sele1 => Sele1,
			BUS_Sel => BUS_Sel,
			CMD => CMD,
			INC => INC,
			RST => RST,
			clk => clk
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
    ZR0     <= '0';
    ZR1     <= '0';
    ZR2     <= '0';
    ZR3     <= '0';
    ROUTIR  <= (others => '0');

    wait for 10 ns;

    -- Test case 1
    ZR0     <= '1';
    ZR1     <= '1';
    ZR2     <= '0';
    ZR3     <= '1';
    ROUTIR  <= "0000100";

    wait for 10 ns;

    -- Test case 2
    ZR0     <= '0';
    ZR1     <= '1';
    ZR2     <= '0';
    ZR3     <= '0';
    ROUTIR  <= "1000011";

    wait;

  end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_control_unit of control_unit_tb is
	for TB_ARCHITECTURE
		for UUT : control_unit
			use entity work.control_unit(control_unit);
		end for;
	end for;
end TESTBENCH_FOR_control_unit;

