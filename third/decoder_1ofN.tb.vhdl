library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_decoder_one_of_many is
end TB_decoder_one_of_many;

architecture TB_decoder_one_of_many of TB_decoder_one_of_many is

  component decoder_one_of_many is
    generic(n: natural := 3);
    port(
      en:         in std_logic;
      d_in:       in unsigned(n-1 downto 0);
      d_out:	out unsigned((2**n)-1 downto 0)
    );
  end component;

  signal T_en: std_logic;
  signal T_d_in: unsigned(2 downto 0);
  signal T_d_out: unsigned(7 downto 0);

begin
  U_UT: decoder_one_of_many port map (T_en, T_d_in, T_d_out);
  process
  begin

    T_en <= '1';

    for i in 0 to 7 loop
      T_d_in <= to_unsigned(i, 3);
      wait for 10 ns;
      assert(to_integer(T_d_out) = shift_left(to_unsigned(1, 8), to_integer(to_unsigned(i, 8)))) report "failed: 000" severity warning;

    end loop;

    T_en <= '0';

    for i in 0 to 7 loop
      T_d_in <= to_unsigned(i, 3);
      wait for 10 ns;
      assert(T_d_out = "00000000") report "failed: 000" severity warning;
    end loop;

      -- T_d_in <= "000";
      -- wait for 10 ns;
      -- assert(T_d_out = "00000001") report "failed: 000" severity warning;

      -- T_d_in <= "001";
      -- wait for 10 ns;
      -- assert(T_d_out = "00000010") report "failed: 001" severity warning;

      -- T_d_in <= "010";
      -- wait for 10 ns;
      -- assert(T_d_out = "00000100") report "failed: 010" severity warning;

      -- T_d_in <= "011";
      -- wait for 10 ns;
      -- assert(T_d_out = "00001000") report "failed: 011" severity warning;

      -- T_d_in <= "100";
      -- wait for 10 ns;
      -- assert(T_d_out = "00010000") report "failed: 100" severity warning;

      -- T_d_in <= "101";
      -- wait for 10 ns;
      -- assert(T_d_out = "00100000") report "failed: 101" severity warning;

      -- T_d_in <= "110";
      -- wait for 10 ns;
      -- assert(T_d_out = "01000000") report "failed: 110" severity warning;

      -- T_d_in <= "111";
      -- wait for 10 ns;
      -- assert(T_d_out = "10000000") report "failed: 111" severity warning;


      wait;
    end process;

end;

---------------------------------------------------------------
configuration CFG of TB_decoder_one_of_many is
     for TB_decoder_one_of_many
     end for;
end;
---------------------------------------------------------------
