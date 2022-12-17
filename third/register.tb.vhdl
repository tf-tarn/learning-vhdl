library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_register is
end TB_register;

architecture TB_register of TB_register is

  component reg is
    port(
      clr, load, clk : in  std_logic;
      d_in           : in  unsigned(7 downto 0);
      d_out          : out unsigned(7 downto 0)
    );
  end component;


    signal d_in, d_out: unsigned(7 downto 0);
    signal clr: std_logic;
    signal clk: std_logic;
    signal load: std_logic;

procedure pulse(signal clock: out std_logic) is
begin
  wait for 20 ns;
  clock <= '1';
  wait for 20 ns;
  clock <= '0';
end procedure pulse;


    begin

      U_UT: reg port map (
        clr,
        load,
        clk,
        d_in,
        d_out
        );

    process
    begin

      clk <= '0';
      clr <= '0';
      load <= '1';
      d_in <= "11001100";

      pulse(clk);
      assert(d_out = d_in) report "failed: update when load is 1"
        severity warning;

      load <= '0';
      d_in <= "00000000";
      pulse(clk);
      assert(d_out = "11001100") report "failed: no update when load is 0"
        severity warning;

      load <= '1';
      d_in <= "00110011";
      pulse(clk);
      assert(d_out = d_in) report "failed: update when load is 1"
        severity warning;

      load <= '0';
      clr <= '1';
      pulse(clk);
      assert(d_out = "00000000") report "fail: reset"
        severity warning;

      wait;

    end process;

end TB_register;

---------------------------------------------------------------
configuration CFG_TB_register of TB_register is
    for TB_register
    end for;
end;
---------------------------------------------------------------
