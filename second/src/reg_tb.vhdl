----------------------------------------------------------------
-- Test Bench for Tri-state Driver
-- by Weijun Zhang, 05/2001
----------------------------------------------------------------	

library ieee;
use ieee.std_logic_1164.all;

entity TB_reg is
end TB_reg;

architecture TB of TB_reg is

  component reg is
    port(
      clr, load, clk : in  std_logic;
      d_in           : in  std_logic_vector(7 downto 0);
      d_out          : out std_logic_vector(7 downto 0)
    );
  end component;

    
    signal T_d_in, T_d_out: std_logic_vector(7 downto 0);
    signal T_clr: std_logic;
    signal T_clk: std_logic;
    signal T_load: std_logic;

    begin											   

        U_UT: reg port map (T_d_in, T_en, T_d_out);
	
    process
    begin

	T_clk <= '1';
	T_clr <= '0';


    -- update when load is 1
    T_load <= '1';
	T_d_in <= "11001100";
	wait for 20 ns;
	assert(T_d_out = T_d_in) report "Error detected!"
	severity warning;

    -- no update when load is 0
    T_load <= '0';
	T_d_in <= "00000000";
	wait for 20 ns;
	assert(T_d_out = "11001101") report "Error detected!"
	severity warning;

    -- update when clk is 1
	T_clk <= '1';
    T_load <= '1';
	T_d_in <= "00110011";
	wait for 20 ns;
	assert(T_d_out = T_d_in) report "Error detected!"
	severity warning;

    -- no update when clk is 0
	T_clk <= '0';
    T_load <= '1';
	T_d_in <= "00000000";
	wait for 20 ns;
	assert(T_d_out = "00110011") report "Error detected!"
	severity warning;

    -- reset
    T_clr <= '1';
	wait for 20 ns;
	assert(T_d_out = "00000000") report "Error detected!"
	severity warning;

		
	T_en <= '1';
	wait for 10 ns;
		
	wait;
		
    end process;

end TB;

---------------------------------------------------------------
configuration CFG_TB of TB_reg is
	for TB
	end for;
end CFG_TB;
---------------------------------------------------------------
