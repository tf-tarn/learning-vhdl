library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_tinyrom is
end TB_tinyrom;

architecture TB_tinyrom of TB_tinyrom is

  component tinyrom is
    port(
      en:      in std_logic;
      addr_in:       in unsigned(2 downto 0);
      d_out:	   out unsigned(7 downto 0)
    );
  end component;

  procedure test_case(
    signal addr_in: out unsigned(2 downto 0);
    signal d_out: in unsigned(7 downto 0);
    addr_val: unsigned(2 downto 0);
    d_val: unsigned(7 downto 0)
    ) is
  begin
    -- addr_in <= 3d"0";
    addr_in <= addr_val;
    wait for 10 ns;
    assert(d_out = d_val) report "failed: address "
      & integer'image(to_integer(addr_val))
      & " was " & integer'image(to_integer(unsigned(d_out)))
      & ", expected " & integer'image(to_integer(unsigned(d_val)))
      severity warning;
  end procedure;

  signal en: std_logic;
  signal addr_in: unsigned(2 downto 0);
  signal d_out: unsigned(7 downto 0);
  

begin
  U_UT: tinyrom port map (en, addr_in, d_out);
  process
  begin
    en <= '1';
    test_case(addr_in, d_out, to_unsigned(0, addr_in'length), x"83");
    test_case(addr_in, d_out, to_unsigned(1, addr_in'length), x"00");
    test_case(addr_in, d_out, to_unsigned(2, addr_in'length), x"82");
    test_case(addr_in, d_out, to_unsigned(3, addr_in'length), x"00");
    test_case(addr_in, d_out, to_unsigned(4, addr_in'length), x"c0");
    test_case(addr_in, d_out, to_unsigned(5, addr_in'length), x"00");
    test_case(addr_in, d_out, to_unsigned(6, addr_in'length), x"00");
    test_case(addr_in, d_out, to_unsigned(7, addr_in'length), x"00");

    en <= '0';
    test_case(addr_in, d_out, to_unsigned(0, addr_in'length), x"00");
    test_case(addr_in, d_out, to_unsigned(1, addr_in'length), x"00");
    test_case(addr_in, d_out, to_unsigned(2, addr_in'length), x"00");
    test_case(addr_in, d_out, to_unsigned(3, addr_in'length), x"00");
    test_case(addr_in, d_out, to_unsigned(4, addr_in'length), x"00");
    test_case(addr_in, d_out, to_unsigned(5, addr_in'length), x"00");
    test_case(addr_in, d_out, to_unsigned(6, addr_in'length), x"00");
    test_case(addr_in, d_out, to_unsigned(7, addr_in'length), x"00");

    wait;

  end process;
end;
