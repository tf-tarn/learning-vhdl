library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_alu is
end TB_alu;

architecture TB of TB_alu is

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

procedure pulse(signal clock: out std_logic) is
begin
  wait for 10 ns;
  clock <= '1';
  wait for 10 ns;
  clock <= '0';
end procedure pulse;

procedure test_case(
  signal a: out unsigned(7 downto 0);
  signal load_a: out std_logic;
  signal b: out unsigned(7 downto 0);
  signal load_b: out std_logic;
  signal op_select:   out unsigned(7 downto 0);
  signal load_select: out std_logic;
  signal clk: out std_logic;
  signal c: in unsigned(7 downto 0);
  signal send_c: out std_logic;
  a_val: in unsigned(7 downto 0);
  b_val: in unsigned(7 downto 0);
  c_val: in unsigned(7 downto 0)) is
begin
  a <= a_val;
  pulse(load_a);
  b <= b_val;
  pulse(load_b);
  op_select <= x"04";
  pulse(load_select);
  pulse(clk);
  send_c <= '1';
  wait for 10 ns;
  assert(c = c_val) report "failed: 000" severity warning;
  send_c <= '0';
end procedure;  
  
signal reset: std_logic;
signal clk: std_logic;
signal a: unsigned(7 downto 0);
signal load_a: std_logic;
signal b: unsigned(7 downto 0);
signal load_b: std_logic;
signal c: unsigned(7 downto 0);
signal send_c: std_logic;
signal op_select: unsigned(7 downto 0);
signal load_select: std_logic;

    begin

      U_UT: alu port map (reset, clk, a, load_a, b, load_b, c, send_c, op_select, load_select);

    process
    begin
      reset <= '0';
      clk <= '0';
      a <= x"00";
      load_a <= '0';
      b <= x"00";
      load_b <= '0';
      send_c <= '0';
      op_select <= x"00";
      load_select <= '0';

      pulse(reset);

      a <= x"01";
      pulse(load_a);
      b <= x"00";
      pulse(load_b);
      op_select <= x"04";
      pulse(load_select);
      pulse(clk);
      send_c <= '1';
      wait for 10 ns;
      assert(c = x"01") report "failed: 000" severity warning;
      send_c <= '0';

      test_case(a, load_a,
                b, load_b,
                op_select, load_select,
                clk,
                c, send_c,
                a_val => x"01",
                b_val => x"01",
                c_val => x"02");

      test_case(a, load_a,
                b, load_b,
                op_select, load_select,
                clk,
                c, send_c,
                a_val => x"01",
                b_val => x"02",
                c_val => x"03");

      
      for i in 1 to 100 loop
        pulse(clk);
      end loop;       

      wait;

    end process;

end TB;
---------------------------------------------------------------
