library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
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
end alu;

architecture behavior of alu is

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

  signal internal_a: unsigned(7 downto 0) := to_unsigned(0, 8);
  signal internal_b: unsigned(7 downto 0) := to_unsigned(0, 8);
  signal internal_c: unsigned(7 downto 0) := to_unsigned(0, 8);
  signal internal_select: unsigned(7 downto 0) := to_unsigned(0, 8);
  signal instruction_count: unsigned(15 downto 0) := to_unsigned(0, 16);

begin

  reg_a: reg
    port map (
      clr => reset,
      load => '1',
      clk => load_a,
      d_in => a,
      d_out => internal_a
    );
  
  reg_b: reg
    port map (
      clr => reset,
      load => '1',
      clk => load_b,
      d_in => b,
      d_out => internal_b
    );
  
  reg_select: reg
    port map (
      clr => reset,
      load => '1',
      clk => load_select,
      d_in => op_select,
      d_out => internal_select
    );

  reg_c: reg_tristate
    port map (
      clr => reset,
      load => '1',
      clk => clk,
      en => send_c,
      d_in => internal_c,
      d_out => c
    );

  

  process(internal_select, internal_c, internal_a, internal_b)
  begin
    case internal_select is
      when x"00" => internal_c <= internal_a and internal_b;
      when x"01" => internal_c <= internal_a or internal_b;
      when x"02" => internal_c <= not internal_a;
      when x"03" => internal_c <= internal_a + internal_b;
      when x"04" => internal_c <= internal_a + internal_b;
      when others => internal_c <= x"00";
    end case;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      instruction_count <= instruction_count + 1;
    end if;
  end process;
end behavior;
