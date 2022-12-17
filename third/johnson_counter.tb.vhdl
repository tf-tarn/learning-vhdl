library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_johnson_counter is
end TB_johnson_counter;

architecture TBA_johnson_counter of TB_johnson_counter is

  component johnson_counter is
    port(
      clk:         in std_logic;
      reset:       in std_logic;
      d_out:	 out unsigned(7 downto 0)
    );
  end component johnson_counter;
  
  procedure pulse(signal clock: out std_logic) is
  begin
    wait for 20 ns;
    clock <= '1';
    wait for 20 ns;
    clock <= '0';
  end procedure pulse;
  
  procedure test_case(
    signal d_out: in unsigned(7 downto 0);
    signal clk: out std_logic;
    expected_val: unsigned(7 downto 0)
    ) is
  begin
    wait for 10 ns;
    assert(d_out = expected_val) report "failed: 00" severity warning;
      -- & integer'image(to_integer(addr_val))
      -- & " was " & integer'image(to_integer(unsigned(d_out)))
      -- & ", expected " & integer'image(to_integer(unsigned(d_val)))
    pulse(clk);
  end procedure;


    signal T_reset: std_logic;
    signal T_clk: std_logic;
    signal T_d_out: unsigned(7 downto 0);

    begin
        U_UT: johnson_counter port map (T_clk, T_reset, T_d_out);
    process
    begin
      T_reset <= '0';
      T_clk <= '0';
      pulse(T_reset);

      test_case(T_d_out, T_clk, x"01");
      test_case(T_d_out, T_clk, x"02");
      test_case(T_d_out, T_clk, x"04");
      test_case(T_d_out, T_clk, x"08");
      test_case(T_d_out, T_clk, x"10");
      test_case(T_d_out, T_clk, x"20");
      test_case(T_d_out, T_clk, x"40");
      test_case(T_d_out, T_clk, x"80");
      test_case(T_d_out, T_clk, x"01");
      test_case(T_d_out, T_clk, x"02");
      pulse(T_reset);
      test_case(T_d_out, T_clk, x"01");
      test_case(T_d_out, T_clk, x"02");
      wait;
    end process;

end;
