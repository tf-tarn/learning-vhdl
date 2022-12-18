library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_instruction_decoder is
end TB_instruction_decoder;

architecture TB of TB_instruction_decoder is

  component instruction_decoder is
    port(
      reset:      in std_logic;
      clk:        in std_logic;
      en:         in std_logic;
      en0:        in std_logic;
      en1:        in std_logic;
      d_in:       in unsigned(7 downto 0);
      out0:	out unsigned(15 downto 0);
      out1:	out unsigned(15 downto 0)
    );
  end component;

  component upcounter is
    generic(m: natural := 8);
    port(
      reset:	in std_logic;
      clk:      in std_logic;
      d_out:	out unsigned(7 downto 0)
    );
  end component;


signal T_reset: std_logic;
signal T_clk: std_logic;
signal T_clk2: std_logic;
signal count: unsigned(7 downto 0);
signal T_out0: unsigned(15 downto 0);
signal T_out1: unsigned(15 downto 0);

procedure pulse(signal clock: out std_logic) is
begin
  wait for 10 ns;
  clock <= '1';
  wait for 10 ns;
  clock <= '0';
end procedure pulse;

    begin
      counter: upcounter
        port map (T_reset, T_clk, count);
      U_UT: instruction_decoder
        port map (T_reset, T_clk2, '1', '1', '1', count, T_out0, T_out1);
    process
    begin
      report "TODO test en*" severity warning;
      T_reset <= '0';
      T_clk <= '0';
      T_clk2 <= '0';
      pulse(T_reset);

      wait for 10 ns;

      for i in 1 to 260 loop
        T_clk <= '1';
        T_clk2 <= '0';
        wait for 10 ns;
        T_clk <= '0';
        T_clk2 <= '1';
        wait for 10 ns;

        assert(count = to_unsigned(i, 9)(7 downto 0))
          report "failed: count "
          & " was " & integer'image(to_integer(count))
          & ", expected " & integer'image(i)
          severity warning;
        assert(to_integer(T_out0) = shift_left(to_unsigned(1, 16), to_integer(to_unsigned(i, 9)(3 downto 0))))
          report "failed: out0 "
          & " was " & integer'image(to_integer(T_out0))
          & ", expected " & integer'image(to_integer(shift_left(to_unsigned(1, 16), to_integer(to_unsigned(i, 9)(3 downto 0)))))
          severity warning;
        assert(to_integer(T_out1) = shift_left(to_unsigned(1, 16), to_integer(to_unsigned(i, 9)(7 downto 4))))
          report "failed: out1 "
          & " was " & integer'image(to_integer(T_out1))
          & ", expected " & integer'image(to_integer(shift_left(to_unsigned(1, 16), to_integer(to_unsigned(i, 9)(7 downto 4)))))
          severity warning;
      end loop;

      wait;

    end process;

end TB;
---------------------------------------------------------------
