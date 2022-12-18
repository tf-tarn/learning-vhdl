library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tinyrom is
  port(
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
      -- case addr_in is
      --     when "000"  =>  d_out <=  x"82";  -- mov jmpl ih, 2
      --     when "001"  =>  d_out <=  x"02";
      --     when "010"  =>  d_out <=  x"83";  -- mov jmph il, 0
      --     when "011"  =>  d_out <=  x"00";
      --     when "100"  =>  d_out <=  x"c0";  -- jump
      --     when "101"  =>  d_out <=  x"00";
      --     when "110"  =>  d_out <=  x"00";
      --     when "111"  =>  d_out <=  x"00";
      --     when others =>  d_out <=  x"00";
      --   end case;
      case addr_in is
          when "000"  =>  d_out <=  x"8b";  -- mov jmpl ih, 2
          when "001"  =>  d_out <=  x"02";
          when "010"  =>  d_out <=  x"b5";  -- mov jmph il, 0
          when "011"  =>  d_out <=  x"00";
          when "100"  =>  d_out <=  x"51";  -- jump
          when "101"  =>  d_out <=  x"00";
          when "110"  =>  d_out <=  x"8b";
          when "111"  =>  d_out <=  x"00";
          when others =>  d_out <=  x"00";
      end case;
    else
      d_out <= "ZZZZZZZZ";
    end if;
  end process;
end behavior;
