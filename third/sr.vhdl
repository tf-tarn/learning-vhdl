library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sr is
  port(
    clk: in std_logic;
    set: in std_logic;
    reset: in std_logic;
    q: out std_logic := '0'
  );
end sr;

architecture behavior of sr is
begin

  process(set, reset, clk)
  begin
    if reset = '1' then
      q <= '0';
    elsif rising_edge(clk) then
      q <= set and not reset;
    end if;
  end process;
    

end behavior;
