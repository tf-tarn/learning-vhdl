library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity johnson_counter is
  port(
    clk:         in std_logic;
    reset:       in std_logic;
    d_out:	 out unsigned(7 downto 0)
  );
end entity johnson_counter;

architecture struct of johnson_counter is

component upcounter is
  generic(m: natural := 3);
  port(
    reset:	in std_logic;
    clk:        in std_logic;
    d_out:	out unsigned(2 downto 0)
  );
end component;

  component decoder_one_of_many is
    generic(n: natural := 3);
    port(
      en:         in std_logic;
      d_in:       in unsigned(n-1 downto 0);
      d_out:	out unsigned((2**n)-1 downto 0)
    );
  end component;

signal count   : unsigned(2 downto 0);

begin
  counter: upcounter port map (
    reset => reset,
    clk => clk,
    d_out => count
    );
  decoder: decoder_one_of_many port map (
    en => '1',
    d_in => unsigned(count),
    d_out => d_out
    );

end struct;
