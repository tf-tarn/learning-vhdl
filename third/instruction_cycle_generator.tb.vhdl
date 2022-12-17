library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_instruction_cycle_generator is
end TB_instruction_cycle_generator;

architecture TB of TB_instruction_cycle_generator is

component instruction_cycle_generator is
  port(
    clk:         in std_logic;
    reset:       in std_logic;
    step:	 out unsigned(2 downto 0);
    send_enable: out std_logic;
    load_enable: out std_logic
  );
end component instruction_cycle_generator;

signal clk, reset, send_enable, load_enable: std_logic;
signal step: unsigned(2 downto 0);

procedure pulse(signal clock: out std_logic) is
begin
  wait for 10 ns;
  clock <= '1';
  wait for 10 ns;
  clock <= '0';
end procedure pulse;
begin
  U_UT: instruction_cycle_generator
    port map (clk, reset, step, send_enable, load_enable);
  process
  begin
    reset <= '0';
    clk <= '0';
    pulse(reset);

    for i in 1 to 100 loop
      pulse(clk);
    end loop;

    report "TODO add assertions" severity warning;
    wait;
  end process;
end TB;
