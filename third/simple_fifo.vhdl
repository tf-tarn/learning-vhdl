library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity reg_transfer is
  port(
    clr, load, clk : in  std_logic;
    r1_in          : in  unsigned(7 downto 0);
    r2_out         : out unsigned(7 downto 0)
  );
end entity reg_transfer;

architecture struct of reg_transfer is
  component reg is
    port(
      clr, load, clk : in  std_logic;
      d_in           : in  unsigned(7 downto 0);
      d_out          : out unsigned(7 downto 0)
    );
  end component;

  signal internal   : unsigned(7 downto 0);
  
begin

  reg1: reg port map (clr => clr, clk => clk, load => load, d_in => r1_in, d_out => internal);
  reg2: reg port map (clr => clr, clk => clk, load => load, d_in => internal, d_out => r2_out);

end architecture struct;
