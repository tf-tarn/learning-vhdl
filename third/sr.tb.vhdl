library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_sr is
end TB_sr;

architecture TB_sr of TB_sr is

  component sr is
    port(
      set: in std_logic;
      reset: in std_logic;
      q: out std_logic
    );
  end component;


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
      U_UT: sr port map (set, reset, q);
    process
    begin
      pulse(reset);

      wait for 10 ns;
      set <= '1';
      wait for 10 ns;
      set <= '0';
      wait for 10 ns;
      assert(q = '1') report "fail: set"
        severity warning;
      
      wait for 10 ns;
      reset <= '1';
      wait for 10 ns;
      assert(q = '0') report "fail: reset"
        severity warning;

      wait for 10 ns;
      reset <= '1';
      wait for 10 ns;
      set <= '1';
      wait for 10 ns;
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
