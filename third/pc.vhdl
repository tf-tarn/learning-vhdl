library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity program_counter is
  generic(n: natural := 8);
  port(
    reset, clk     : in  std_logic;
    update         : in std_logic;
    increment      : in std_logic;
    d_in           : in  unsigned(n-1 downto 0);
    d_out          : out unsigned(n-1 downto 0)
  );
end entity program_counter;

architecture rtl of program_counter is

  component reg is
    port(
      clr, load, clk : in  std_logic;
      d_in           : in  unsigned(7 downto 0);
      d_out          : out unsigned(7 downto 0)
    );
  end component;

  component reg_incrementable is
    generic(n: natural := 8);
    port(
      clr, load, clk : in  std_logic;
      increment      : in std_logic;
      d_in           : in  unsigned(n-1 downto 0);
      d_out          : out unsigned(n-1 downto 0)
    );
  end component reg_incrementable;

  signal internal: unsigned(7 downto 0);

begin
  pc_in: reg
    port map (
      clr => reset,
      load => '1',
      clk => clk,
      d_in => d_in,
      d_out => internal
    );

  pc_out: reg_incrementable
    port map (
      clr => reset,
      load => '1',
      clk => update,
      increment => increment,
      d_in => internal,
      d_out => d_out
    );

end architecture rtl;
