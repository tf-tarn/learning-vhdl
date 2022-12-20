library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_core is
end TB_core;

architecture TB of TB_core is

component core is
  port(
    clk:         in std_logic;
    reset:       in std_logic
  );
end component;

signal T_reset: std_logic;
signal T_clk: std_logic;

procedure pulse(signal clock: out std_logic) is
begin
  wait for 10 ns;
  clock <= '1';
  wait for 10 ns;
  clock <= '0';
end procedure pulse;

    begin

      U_UT: core port map (T_clk, T_reset);

    process
    begin
      T_clk <= '0';
      T_reset <= '0';
      pulse(T_reset);

      for i in 1 to 5000 loop
        pulse(T_clk);
      end loop;       

      wait;

    end process;

end TB;
---------------------------------------------------------------
