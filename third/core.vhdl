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
      en:      in std_logic;
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

  component reg_tristate is
    generic(n: natural := 8);
    port(
      clr, load, clk : in std_logic;
      en             : in std_logic;
      d_in           : in  unsigned(n-1 downto 0);
      d_out          : out unsigned(n-1 downto 0)
    );
  end component reg_tristate;


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

  component instruction_decoder is
    port(
      reset:      in std_logic;
      clk:        in std_logic;
      en:         in std_logic;
      en0:        in std_logic;
      en1:        in std_logic;
      d_in:       in unsigned(7 downto 0);
      out0:	  out unsigned(15 downto 0);
      out1:	  out unsigned(15 downto 0)
    );
  end component;

  component gate_or is
    port(
      a, b  : in  std_logic;
      c     : out std_logic
      );
  end component gate_or;

  component instruction_cycle_generator is
    port(
      clk:         in std_logic;
      reset:       in std_logic;
      step:	 out unsigned(2 downto 0);
      send_enable: out std_logic;
      load_enable: out std_logic
    );
  end component instruction_cycle_generator;
  
component step_decoder is
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
end component step_decoder;

signal pc_out       : unsigned(2 downto 0);
signal data_bus     : unsigned(7 downto 0);
-- signal data_bus     : unsigned(7 downto 0);
signal step          : unsigned(2 downto 0);
signal instruction_decoder_word : unsigned(7 downto 0);
signal send_enable   : std_logic;
signal load_enable   : std_logic;

signal increment_pc: std_logic;
signal load_instruction_decoder_word: std_logic;
signal load_reg_il: std_logic;
signal execute_instruction: std_logic;
signal send_mem: std_logic;

signal inst_send_control: unsigned(15 downto 0);
signal inst_load_control: unsigned(15 downto 0);

constant SEND_IL_IDX : natural := 8;
constant SEND_R_IDX : natural := 11;
constant SEND_X_IDX : natural := 5;
constant SEND_Y_IDX : natural := 1;

constant LOAD_R_IDX : natural := 11;
constant LOAD_X_IDX : natural := 5;
constant LOAD_Y_IDX : natural := 1;

begin
  icg: instruction_cycle_generator
    port map (
      clk => clk,
      reset => reset,
      step => step,
      send_enable => send_enable,
      load_enable => load_enable
      );

  instruction_cycle_step_decoder: step_decoder
    port map (
      step => step,
      send_enable => send_enable,
      load_enable => load_enable,

      increment_pc => increment_pc,
      load_instruction_decoder_word => load_instruction_decoder_word,
      load_reg_il => load_reg_il,

      execute_instruction => execute_instruction,

      send_mem => send_mem
    );

  the_instruction_decoder: instruction_decoder
    port map (
      reset => reset,
      clk => load_instruction_decoder_word,
      en => execute_instruction,
      en0 => load_enable,
      en1 => send_enable,
      d_in => data_bus,
      out0 => inst_load_control,
      out1 => inst_send_control
      );

  pc: upcounter
    port map (
      reset => reset,
      clk => increment_pc,
      d_out => pc_out
    );

  reg_il: reg_tristate
    port map (
      clr => reset,
      load => '1',
      clk => load_reg_il,
      en => inst_send_control(SEND_IL_IDX),
      d_in => data_bus,
      d_out => data_bus
    );

------------------------------------------------------------
-- Memory
  mem: tinyrom
    port map (
      addr_in => pc_out,
      en => send_mem,
      d_out => data_bus
    );

------------------------------------------------------------
-- General-purpose registers
  
  reg_r: reg_tristate
    port map (
      clr => reset,
      load => '1',
      clk => inst_load_control(LOAD_R_IDX),
      en => inst_send_control(SEND_R_IDX),
      d_in => data_bus,
      d_out => data_bus
    );

  reg_x: reg_tristate
    port map (
      clr => reset,
      load => '1',
      clk => inst_load_control(LOAD_X_IDX),
      en => inst_send_control(SEND_X_IDX),
      d_in => data_bus,
      d_out => data_bus
    );

  reg_y: reg_tristate
    port map (
      clr => reset,
      load => '1',
      clk => inst_load_control(LOAD_Y_IDX),
      en => inst_send_control(SEND_Y_IDX),
      d_in => data_bus,
      d_out => data_bus
    );

end struct;
