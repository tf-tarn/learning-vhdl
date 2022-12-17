library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tinyrom is
  port(
    clk:     in std_logic;
    en:      in std_logic;
    addr_in: in unsigned(2 downto 0);
    d_out:   out unsigned(7 downto 0)
  );
end tinyrom;

architecture behavior of tinyrom is
begin
  process(addr_in, en)
  begin
    if en = '1' then
      report "tinyrom en" severity warning;
      case addr_in is
          when "000"  =>  d_out <=  x"83";  -- mov il jmph
          when "001"  =>  d_out <=  x"00";
          when "010"  =>  d_out <=  x"82";  -- mov il jmpl
          when "011"  =>  d_out <=  x"00";
          when "100"  =>  d_out <=  x"c0";  -- jump
          when "101"  =>  d_out <=  x"00";
          when "110"  =>  d_out <=  x"00";
          when "111"  =>  d_out <=  x"00";
          when others =>  d_out <=  x"00";
        end case;
      else
        report "tinyrom dis" severity warning;
        d_out <= "ZZZZZZZZ";
      end if;
  end process;
end behavior;
