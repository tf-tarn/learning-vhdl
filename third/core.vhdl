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
      addr_in:       in unsigned(3 downto 0);
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

      inst_clock: out std_logic;  -- ticks once per instruction cycle

      send_enable: in std_logic;
      load_enable: in std_logic;

      increment_pc: out std_logic;
      load_control_word: out std_logic;
      load_reg_il: out std_logic;

      execute_instruction: out std_logic;
      perform_jump: out std_logic;

      send_mem: out std_logic
    );
  end component step_decoder;

  component program_counter is
    generic(n: natural := 8);
    port(
      reset, clk     : in  std_logic;
      update         : in std_logic;
      increment      : in std_logic;
      d_in           : in  unsigned(n-1 downto 0);
      d_out          : out unsigned(n-1 downto 0)
    );
  end component;

  component sr is
    port(
      set: in std_logic;
      reset: in std_logic;
      q: out std_logic
    );
  end component;

  component alu is
    port(
      reset:       in std_logic;
      clk:         in std_logic;
      a:           in unsigned(7 downto 0);
      load_a:      in std_logic;
      b:           in unsigned(7 downto 0);
      load_b:      in std_logic;
      c:           out unsigned(7 downto 0);
      send_c:      in std_logic;
      op_select:   in unsigned(7 downto 0);
      load_select: in std_logic
    );
  end component;


  signal pc_out       : unsigned(3 downto 0);
  signal data_bus     : unsigned(7 downto 0);
  -- signal data_bus     : unsigned(7 downto 0);
  signal step          : unsigned(2 downto 0);
  signal instruction_decoder_word : unsigned(7 downto 0);
  signal send_enable   : std_logic;
  signal load_enable   : std_logic;
  signal inst_clock: std_logic;

  signal increment_pc: std_logic;
  signal load_control_word: std_logic;
  signal load_reg_il: std_logic;
  signal execute_instruction: std_logic;
  signal send_mem: std_logic;
  signal is_time_for_jump: std_logic;
  signal do_jump: std_logic;
  signal jump_requested: std_logic;

  signal inst_send_control: unsigned(15 downto 0);
  signal inst_load_control: unsigned(15 downto 0);

  constant SEND_ALUC_IDX : natural := 15;
  constant SEND_JUMP_IDX : natural := 12;
  constant SEND_R_IDX    : natural := 11;
  constant SEND_IL_IDX   : natural := 8;
  constant SEND_X_IDX    : natural := 5;
  constant SEND_Y_IDX    : natural := 1;

  constant LOAD_ALUB_IDX : natural := 15;
  constant LOAD_ALUA_IDX : natural := 14;
  constant LOAd_ALUS_IDX : natural := 13;
  constant LOAD_R_IDX  : natural := 11;
  constant LOAD_X_IDX  : natural := 5;
  constant LOAD_JMPL   : natural := 2;
  constant LOAD_Y_IDX  : natural := 1;

  -- control signal indices for general purpose registers
  type reg_idx_array is array (0 to 2, 0 to 1) of natural;
  constant gpreg_signal_indices: reg_idx_array := (
    (LOAD_R_IDX, SEND_R_IDX),
    (LOAD_X_IDX, SEND_X_IDX),
    (LOAD_Y_IDX, SEND_Y_IDX));

begin
------------------------------------------------------------
-- Control stuff
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
      inst_clock => inst_clock,
      send_enable => send_enable,
      load_enable => load_enable,

      increment_pc => increment_pc,
      load_control_word => load_control_word,
      load_reg_il => load_reg_il,

      execute_instruction => execute_instruction,
      perform_jump => is_time_for_jump,

      send_mem => send_mem
    );

  the_instruction_decoder: instruction_decoder
    port map (
      reset => reset,
      clk => load_control_word,
      en => execute_instruction,
      en0 => load_enable,
      en1 => send_enable,
      d_in => data_bus,
      out0 => inst_load_control,
      out1 => inst_send_control
      );

  pc: program_counter
    port map (
      reset => reset,
      clk => inst_load_control(LOAD_JMPL),
      update => do_jump,
      increment => increment_pc,
      d_in => data_bus,
      d_out(3 downto 0) => pc_out
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
-- Jump control logic

  jump_flag: sr
    port map (
      reset => inst_clock,
      set => inst_send_control(SEND_JUMP_IDX),
      q => jump_requested
      );

  do_jump <= jump_requested and is_time_for_jump;

------------------------------------------------------------
-- Memory
  mem: tinyrom
    port map (
      addr_in => pc_out,
      en => send_mem,
      d_out => data_bus
    );

------------------------------------------------------------
-- ALU

  the_alu: alu
    port map (
      reset =>       reset,
      clk =>         inst_clock,
      a =>           data_bus,
      load_a =>      inst_load_control(LOAD_ALUA_IDX),
      b =>           data_bus,
      load_b =>      inst_load_control(LOAD_ALUB_IDX),
      op_select =>   data_bus,
      load_select => inst_load_control(LOAD_ALUS_IDX),
      c =>           data_bus,
      send_c =>      inst_send_control(SEND_ALUC_IDX)
    );


------------------------------------------------------------
-- General-purpose registers

  general_purpose_registers: for i in gpreg_signal_indices'range generate
    a_register: reg_tristate
      port map (
        clr => reset,
        load => '1',
        clk => inst_load_control(gpreg_signal_indices(i, 0)),
        en => inst_send_control(gpreg_signal_indices(i, 1)),
        d_in => data_bus,
        d_out => data_bus
      );
  end generate;

end struct;
