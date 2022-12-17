library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_cycle_generator is
  port(
    clk:         in std_logic;
    reset:       in std_logic;
    step:	 out unsigned(2 downto 0);
    send_enable: out std_logic;
    load_enable: out std_logic
  );
end entity instruction_cycle_generator;

architecture struct of instruction_cycle_generator is

component upcounter is
  generic(m: natural := 8);
  port(
    reset:	in std_logic;
    clk:        in std_logic;
    d_out:	out unsigned(m-1 downto 0)
  );
end component;

signal count   : unsigned(4 downto 0);

begin
  step_counter: upcounter
    generic map (
      m => 5
    )
    port map (
    reset => reset,
    clk => clk,
    d_out => count
    );

  step(2 downto 0) <= count(4 downto 2);

  send_enable <= (not count(0) and not count(1))
                 or (count(0) and not count(1))
                 or (not count(0) and count(1));
  load_enable <= count(0) and not count(1);

end struct;
