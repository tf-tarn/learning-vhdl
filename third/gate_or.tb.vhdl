library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_gate_or is
end TB_gate_or;

architecture TB of TB_gate_or is

  component gate_or is
    port(
      a, b  : in  std_logic;
      c     : out std_logic
      );
  end component gate_or;

signal a: std_logic;
signal b: std_logic;
signal c: std_logic;

procedure pulse(signal clock: out std_logic) is
begin
  wait for 10 ns;
  clock <= '1';
  wait for 10 ns;
  clock <= '0';
end procedure pulse;
begin
  U_UT: gate_or
    port map (a, b, c);
  process
  begin
    a <= '0';
    b <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    wait for 10 ns;

    report "TODO add assertions" severity warning;
    wait;
  end process;
end TB;
