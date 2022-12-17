library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control is
  port(
    clk:        in std_logic;
    en0:        in std_logic;
    en1:        in std_logic;
    d_in:       in unsigned(7 downto 0);
    out0:	out unsigned(15 downto 0);
    out1:	out unsigned(15 downto 0)
  );
end control;

architecture behavior of control is

component decoder_one_of_many is
  port(
    d_in:       in unsigned(3 downto 0);
    d_out:	out unsigned(15 downto 0)
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

begin

  control_reg: reg
    port map (
      clr => '0',
      load => '1',
      clk => clk,
      d_in => d_in,
      d_out => internal
    );

  decoder1: decoder_one_of_many
    port map (
      d_in => internal(7 downto 4),
      d_out => out1
    );

  decoder0: decoder_one_of_many
    port map (
      d_in => internal(3 downto 0),
      d_out => out0
    );
  
end behavior;
