library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity gate_or is
  port(
    a, b  : in  std_logic;
    c     : out std_logic
  );
end entity gate_or;

architecture rtl of gate_or is
begin
  c <= a or b;
end architecture rtl;
