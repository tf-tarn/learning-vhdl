library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity step_decoder is
  port(
    step:        in unsigned(2 downto 0);

    send_enable: in std_logic;
    load_enable: in std_logic;

    increment_pc: out std_logic;
    load_instruction_decoder_word: out std_logic;
    load_reg_il: out std_logic;

    execute_instruction: out std_logic;

    send_mem: out std_logic
  );
end step_decoder;

architecture behavior of step_decoder is
begin

  increment_pc        <= send_enable when step = to_unsigned(0, 3) or step = to_unsigned(1, 3) else '0';
  load_instruction_decoder_word   <= load_enable when step = to_unsigned(0, 3) else '0';
  load_reg_il         <= load_enable when step = to_unsigned(1, 3) else '0';
  send_mem            <= send_enable when step = to_unsigned(0, 3) or step = to_unsigned(1, 3) else '0';
  execute_instruction <= '1' when step = to_unsigned(2, 3) else '0';
  
end behavior;
