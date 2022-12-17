library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity upcounter is
  generic(m: natural := 8);
  port(
    reset:	in std_logic;
    clk:        in std_logic;
    d_out:	out unsigned(m-1 downto 0)
  );
end upcounter;

architecture behavior of upcounter is
    signal count: unsigned(m-1 downto 0);
begin
  process(reset, clk)
  begin
    if reset = '1' then
      count <= to_unsigned(0, count'length);
    else
    if rising_edge(clk) then
      count <= count + 1;
    end if;
  end if;
  end process;

  d_out <= count;

end behavior;
