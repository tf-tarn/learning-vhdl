library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_pc is
end TB_pc;

architecture TB_pc of TB_pc is

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
  

  signal d_in, d_out: unsigned(7 downto 0);
  signal update: std_logic := '0';
  signal increment: std_logic := '0';
  signal clr: std_logic := '0';
  signal clk: std_logic := '0';

procedure pulse(signal clock: out std_logic) is
begin
  wait for 20 ns;
  clock <= '1';
  wait for 20 ns;
  clock <= '0';
end procedure pulse;


    begin

      U_UT: program_counter port map (
        clr,
        clk,
        update,
        increment,
        d_in,
        d_out
        );

    process
    begin

      pulse(clr);

      d_in <= "11001100";
      pulse(clk);
      pulse(update);
      assert(d_out = d_in) report "failed: update when load is 1"
        severity warning;

      d_in <= "00000000";
      pulse(update);
      wait for 10 ns;
      assert(d_out = "11001100") report "failed: no output update when clock not pulsed"
        severity warning;

      d_in <= "00000000";
      pulse(clk);
      pulse(update);
      assert(d_out = d_in) report "failed: update output on clock pulse + update pulse"
        severity warning;

      clr <= '1';
      pulse(clk);
      assert(d_out = "00000000") report "fail: reset"
        severity warning;

      clr <= '0';
      d_in <= "00110011";
      pulse(clk);
      pulse(update);
      assert(d_out = d_in) report "failed: update after clear"
        severity warning;


      for i in 1 to 10 loop
        pulse(clk);
        pulse(increment);
        assert(d_out = d_in + to_unsigned(i, d_in'length))
          report "failed: increment expected "
          & integer'image(to_integer(d_in + to_unsigned(1, d_in'length)))
          & " but got "
          & integer'image(to_integer(d_out))
          severity warning;
      end loop;
      
      d_in <= "00001111";
      pulse(clk);
      pulse(update);
      assert(d_out = d_in) report "failed: update after increment loop"
        severity warning;

      pulse(increment);

        assert(d_out = x"10")
          report "failed: increment expected "
          & integer'image(16)
          & " but got "
          & integer'image(to_integer(d_out))
          severity warning;

      wait for 10 ns;  
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

end TB_pc;

---------------------------------------------------------------
configuration CFG_TB_register of TB_pc is
    for TB_pc
    end for;
end;
---------------------------------------------------------------
