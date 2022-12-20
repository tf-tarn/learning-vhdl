library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tinyrom is
  -- generic(addr_size: natural := 4; word_size: natural := 8);
  port(
    en:      in std_logic;
    addr_in: in unsigned(4-1 downto 0);
    d_out:   out unsigned(8-1 downto 0)
  );
end tinyrom;

architecture behavior of tinyrom is
begin
  process(addr_in, en)
  begin
    if en = '1' then
      case addr_in is
          when "0000"  =>  d_out <=  x"82"; -- jmpl <= 4
          when "0001"  =>  d_out <=  x"04";
          when "0010"  =>  d_out <=  x"8b"; -- r <= 0
          when "0011"  =>  d_out <=  x"00";
          when "0100"  =>  d_out <=  x"8d"; -- alus <= 4
          when "0101"  =>  d_out <=  x"04";
          when "0110"  =>  d_out <=  x"8e"; -- alua <= 1
          when "0111"  =>  d_out <=  x"01";
          when "1000"  =>  d_out <=  x"bf"; -- alub <= r
          when "1001"  =>  d_out <=  x"00";
          when "1010"  =>  d_out <=  x"fb"; -- r <= aluc
          when "1011"  =>  d_out <=  x"00";
          when "1100"  =>  d_out <=  x"c0"; -- jump
          when "1101"  =>  d_out <=  x"00";
          when "1110"  =>  d_out <=  x"00";
          when "1111"  =>  d_out <=  x"00";
          when others  =>  d_out <=  x"00";
        end case;

      -- test register loading
          -- when "0000"  =>  d_out <=  x"8b";
          -- when "0001"  =>  d_out <=  x"aa";
          -- when "0010"  =>  d_out <=  x"85";
          -- when "0011"  =>  d_out <=  x"bb";
          -- when "0100"  =>  d_out <=  x"81";
          -- when "0101"  =>  d_out <=  x"cc";

      -- infinite loop
          -- when "0000"  =>  d_out <=  x"82";
          -- when "0001"  =>  d_out <=  x"02";
          -- when "0010"  =>  d_out <=  x"c0";

      -- case addr_in is
      --     when "000"  =>  d_out <=  x"8b";
      --     when "001"  =>  d_out <=  x"02";
      --     when "010"  =>  d_out <=  x"b5";
      --     when "011"  =>  d_out <=  x"00";
      --     when "100"  =>  d_out <=  x"51";
      --     when "101"  =>  d_out <=  x"00";
      --     when "110"  =>  d_out <=  x"8b";
      --     when "111"  =>  d_out <=  x"00";
      --     when others =>  d_out <=  x"00";
      -- end case;
    else
      d_out <= "ZZZZZZZZ";
    end if;
  end process;
end behavior;
