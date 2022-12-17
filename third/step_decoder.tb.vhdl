library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_step_decoder is
end TB_step_decoder;

architecture TB of TB_step_decoder is

component step_decoder is
  port(
    step:        in unsigned(2 downto 0);

    send_enable: in std_logic;
    load_enable: in std_logic;

    increment_pc: out std_logic;
    load_control_word: out std_logic;
    load_reg_il: out std_logic;

    execute_instruction: out std_logic;

    send_mem: out std_logic
  );
end component step_decoder;

    signal step:         unsigned(2 downto 0);
    signal send_enable:  std_logic;
    signal load_enable:  std_logic;
    signal increment_pc:  std_logic;
    signal load_control_word:  std_logic;
    signal load_reg_il:  std_logic;
    signal execute_instruction:  std_logic;
    signal send_mem:  std_logic;


procedure pulse(signal clock: out std_logic) is
begin
  wait for 10 ns;
  clock <= '1';
  wait for 10 ns;
  clock <= '0';
end procedure pulse;
begin
  U_UT: step_decoder
    port map (step, send_enable, load_enable, increment_pc, load_control_word, load_reg_il, execute_instruction, send_mem);
  process
  begin
    step <= "000";
    send_enable <= '0';
    load_enable <= '0';

    for i in 0 to 7 loop
      step <= to_unsigned(i, 3);

      send_enable <= '0';
      load_enable <= '0';
      wait for 10 ns;
      
      send_enable <= '1';
      load_enable <= '0';
      wait for 10 ns;

      send_enable <= '1';
      load_enable <= '1';
      wait for 10 ns;

      send_enable <= '1';
      load_enable <= '0';
      wait for 10 ns;

    end loop;

    report "TODO add assertions" severity warning;
    wait;
  end process;
end TB;
