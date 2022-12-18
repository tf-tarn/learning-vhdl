library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_decoder is
  port(
    reset:      in std_logic;
    clk:        in std_logic;
    en:         in std_logic;
    en0:        in std_logic;
    en1:        in std_logic;
    d_in:       in unsigned(7 downto 0);
    out0:	out unsigned(15 downto 0);
    out1:	out unsigned(15 downto 0)
  );
end instruction_decoder;

architecture behavior of instruction_decoder is

  component decoder_one_of_many is
    generic(n: natural := 4);
    port(
      en:         in std_logic;
      d_in:       in unsigned(n-1 downto 0);
      d_out:	out unsigned((2**n)-1 downto 0)
    );
  end component;

component reg
  port(
    clr, load, clk : in  std_logic;
    d_in           : in  unsigned(7 downto 0);
    d_out          : out unsigned(7 downto 0)
  );
end component;

-- signal internal0 : unsigned(7 downto 0);
-- signal internal1 : unsigned(7 downto 0);
signal internal : unsigned(7 downto 0);
signal actually_en0 : std_logic;
signal actually_en1 : std_logic;

begin

  actually_en0 <= en and en0;
  actually_en1 <= en and en1;

  instruction_decoder_reg: reg
    port map (
      clr => reset,
      load => '1',
      clk => clk,
      d_in => d_in,
      d_out => internal
    );

  decoder1: decoder_one_of_many
    port map (
      en => actually_en1,
      d_in => internal(7 downto 4),
      d_out => out1
    );

  decoder0: decoder_one_of_many
    port map (
      en => actually_en0,
      d_in => internal(3 downto 0),
      d_out => out0
    );
  
end behavior;
