library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity core is
  port(
    clk:         in std_logic;
    reset:       in std_logic
  );
end entity core;

architecture struct of core is

  component tinyrom is
    port(
      addr_in:       in unsigned(2 downto 0);
      d_out:	   out unsigned(7 downto 0)
    );
  end component;

  component reg is
    port(
      clr, load, clk : in  std_logic;
      d_in           : in  unsigned(7 downto 0);
      d_out          : out unsigned(7 downto 0)
    );
  end component reg;

  component upcounter is
    generic(m: natural := 3);
    port(
      reset:	in std_logic;
      clk:      in std_logic;
      d_out:	out unsigned(2 downto 0)
    );
  end component;

  component johnson_counter is
    port(
      clk:         in std_logic;
      reset:       in std_logic;
      d_out:	   out unsigned(7 downto 0)
    );
  end component;

signal pc_out   : unsigned(2 downto 0);
signal data_bus : unsigned(7 downto 0);
signal seq      : unsigned(7 downto 0);

begin
  seqgen: johnson_counter
    port map (
      reset => reset,
      clk => clk,
      d_out => seq
      );

  pc: upcounter
    port map (
      reset => reset,
      clk => seq(0),
      d_out => pc_out
    );

  mem: tinyrom
    port map (
      addr_in => pc_out,
      d_out => data_bus
    );

  a: reg
    port map (
      clr => reset,
      load => '1',
      clk => seq(1),
      d_in => data_bus,
      d_out => open
    );

end struct;
