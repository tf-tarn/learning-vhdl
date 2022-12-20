library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sr is
  port(
    set: in std_logic;
    reset: in std_logic;
    q: out std_logic := '0'
  );
end sr;

architecture behavior of sr is
begin

  process(set, reset)
  begin
    if reset = '1' then
      q <= '0';
    elsif rising_edge(set) then
      q <= '1';
    end if;
  end process;
    

end behavior;
