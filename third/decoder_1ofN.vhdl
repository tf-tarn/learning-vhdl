library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_one_of_many is
  generic(n: natural := 3);
  port(
    en:         in std_logic;
    d_in:       in unsigned(n-1 downto 0);
    d_out:	out unsigned((2**n)-1 downto 0)
  );
end decoder_one_of_many;

architecture behavior of decoder_one_of_many is
begin
  process(d_in)
  begin
    d_out <= (others => '0');
    d_out(to_integer(unsigned(d_in))) <= en;
  end process;
end behavior;
