library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity reg_tristate is
  generic(n: natural := 8);
  port(
    clr, load, clk : in  std_logic;
    en             : in std_logic;
    d_in           : in  unsigned(n-1 downto 0);
    d_out          : out unsigned(n-1 downto 0)
  );
end entity reg_tristate;

architecture rtl of reg_tristate is
  signal internal: unsigned(n-1 downto 0);
begin
  process(clk, clr, load) is
  begin
    if clr = '1' then
      internal <= to_unsigned(0, internal'length);
    else
      if rising_edge(clk) then
        if clr = '0' and load = '1' then
          internal <= d_in;
        end if;
      end if;
    end if;
  end process;

  d_out <= internal when en = '1' else "ZZZZZZZZ";

end architecture rtl;
