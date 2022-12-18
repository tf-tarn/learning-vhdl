library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_sr is
end TB_sr;

architecture TB_sr of TB_sr is

  component sr is
    port(
      clk: in std_logic;
      set: in std_logic;
      reset: in std_logic;
      q: out std_logic
    );
  end component;


  signal clk: std_logic := '0';
  signal set: std_logic := '0';
  signal reset: std_logic := '0';
  signal q: std_logic := '0';

  procedure pulse(signal clock: out std_logic) is
  begin
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
    clock <= '0';
  end procedure pulse;
  
    begin
      U_UT: sr port map (clk, set, reset, q);
    process
    begin
      pulse(reset);

      set <= '1';
      pulse(clk);
      set <= '0';
      wait for 10 ns;
      assert(q = '1') report "fail: set"
        severity warning;
      
      reset <= '1';
      wait for 10 ns;
      assert(q = '0') report "fail: reset"
        severity warning;

      reset <= '1';
      set <= '1';
      pulse(clk);
      set <= '0';
      wait for 10 ns;
      assert(q = '0') report "fail: reset with set = '1'"
        severity warning;

      wait;

    end process;

end TB_sr;

---------------------------------------------------------------
configuration CFG_TB_register of TB_sr is
    for TB_sr
    end for;
end;
---------------------------------------------------------------
