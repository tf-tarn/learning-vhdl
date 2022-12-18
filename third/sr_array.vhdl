library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sr is
  generic(n: natural := 1);
  port(
    clk: in std_logic;
    set: in unsigned(n-1 downto 0);
    reset: in unsigned(n-1 downto 0);
    q: out unsigned(n-1 downto 0) := to_unsigned(0, n)
  );
end sr;

architecture behavior of sr is
begin

  process(set, reset, clk)
  begin
    if rising_edge(clk) then
      q <= set and not reset;
    end if;
  end process;
    

end behavior;
