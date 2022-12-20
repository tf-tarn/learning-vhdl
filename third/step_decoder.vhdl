library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity step_decoder is
  port(
    step:        in unsigned(2 downto 0);

    inst_clock: out std_logic;  -- ticks once per instruction cycle
    send_enable: in std_logic; -- enables sending on data bus
    load_enable: in std_logic; -- enables loading from data bus

    increment_pc: out std_logic;      -- increment PC
    load_control_word: out std_logic; -- load first instruction byte, control word
    load_reg_il: out std_logic;       -- load second instruction byte,
                                      -- immediate operand

    execute_instruction: out std_logic;
    perform_jump: out std_logic;

    send_mem: out std_logic
  );
end step_decoder;

architecture behavior of step_decoder is
begin

  inst_clock          <= '1' when step = to_unsigned(0, 3) else '0';
  load_control_word   <= load_enable when step = to_unsigned(0, 3) else '0';
  increment_pc        <= load_enable when step = to_unsigned(1, 3) or step = to_unsigned(3, 3) else '0';
  load_reg_il         <= load_enable when step = to_unsigned(2, 3) else '0';
  send_mem            <= send_enable when step = to_unsigned(0, 3) or step = to_unsigned(2, 3) else '0';
  execute_instruction <= '1' when step = to_unsigned(4, 3) else '0';
  perform_jump        <= '1' when step = to_unsigned(5, 3) else '0';
  
end behavior;
