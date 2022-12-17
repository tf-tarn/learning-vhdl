library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tinyrom is
  port(
    addr_in:       in unsigned(2 downto 0);
    d_out:	   out unsigned(7 downto 0)
  );
end tinyrom;

architecture behavior of tinyrom is
begin
  with addr_in select d_out <=
    x"83" when "000", -- mov il jmph
    x"00" when "001",
    x"82" when "010", -- mov il jmpl
    x"00" when "011",
    x"c0" when "100", -- jump
    x"00" when "101",
    x"00" when "110",
    x"00" when "111",
    x"00" when others;
end behavior;
