library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_register_incrementable is
end TB_register_incrementable;

architecture TB_register of TB_register_incrementable is

  component reg_incrementable is
    generic(n: natural := 8);
    port(
      clr, load, clk : in  std_logic;
      increment      : in std_logic;
      d_in           : in  unsigned(n-1 downto 0);
      d_out          : out unsigned(n-1 downto 0)
    );
  end component;
  

  signal d_in, d_out: unsigned(7 downto 0);
  signal en: std_logic;
  signal increment: std_logic;
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

      U_UT: reg_incrementable port map (
        clr,
        load,
        clk,
        increment,
        d_in,
        d_out
        );

    process
    begin

      increment <= '0';
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

      clr <= '0';
      load <= '1';
      d_in <= "00110011";
      pulse(clk);
      assert(d_out = d_in) report "failed: update when load is 1"
        severity warning;
      for i in 1 to 10 loop
        pulse(increment);
        wait for 10 ns;
        assert(d_out = d_in + to_unsigned(i, d_in'length))
          report "failed: increment expected "
          & integer'image(to_integer(d_in + to_unsigned(1, d_in'length)))
          & " but got "
          & integer'image(to_integer(d_out))
          severity warning;
      end loop;

      clr <= '0';
      load <= '1';
      d_in <= "10101010";
      pulse(clk);
      assert(d_out = d_in) report "failed: update when load is 1"
        severity warning;
      
      
      -- How to do?
      
      -- en <= '0';

      -- clk <= '0';
      -- clr <= '0';
      -- load <= '1';
      -- d_in <= "11001100";

      -- pulse(clk);
      -- assert(d_out /= d_in) report "failed: update when load is 1"
      --   severity warning;

      -- load <= '0';
      -- d_in <= "00000000";
      -- pulse(clk);
      -- assert(d_out /= d_in) report "failed: no update when load is 0"
      --   severity warning;

      -- load <= '1';
      -- d_in <= "00110011";
      -- pulse(clk);
      -- assert(d_out = "ZZZZZZZZ") report "failed: update when load is 1"
      --   severity warning;

      -- load <= '0';
      -- clr <= '1';
      -- pulse(clk);
      -- assert(d_out = "ZZZZZZZZ") report "fail: reset"
      --   severity warning;
      
      
      
      wait;

    end process;

end TB_register;

---------------------------------------------------------------
configuration CFG_TB_register of TB_register_incrementable is
    for TB_register
    end for;
end;
---------------------------------------------------------------
