library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity reg is
  generic(n: natural := 8);
  port(
    clr, load, clk : in  std_logic;
    d_in           : in  unsigned(n-1 downto 0);
    d_out          : out unsigned(n-1 downto 0)
  );
end entity reg;

architecture rtl of reg is
begin
process(clk) is
begin
  if rising_edge(clk) then
    if clr = '1' then
      d_out <= to_unsigned(0, d_out'length);
    elsif load = '1' then
      d_out <= d_in;
    end if;
  end if;
end process;
end architecture rtl;
