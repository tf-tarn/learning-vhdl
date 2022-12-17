----------------------------------------------------------------
-- Test Bench for Tri-state Driver
-- by Weijun Zhang, 05/2001
----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity TB_tridr is
end TB_tridr;

architecture TB of TB_tridr is

    component tristate_buffer is
    port(	d_in:	in std_logic_vector(7 downto 0);
             en:     in std_logic;
             d_out:	out std_logic_vector(7 downto 0)
    );
    end component;

    signal T_d_in, T_d_out: std_logic_vector(7 downto 0);
    signal T_en: std_logic;

    begin

        U_UT: tristate_buffer port map (T_d_in, T_en, T_d_out);

    process
    begin

     T_d_in <= "11000001";
     T_en <= '1';
     wait for 20 ns;
     assert(T_d_out = T_d_in) report "fail: out != in when en high"
     severity warning;

     T_en <= '0';
     wait for 20 ns;
     assert(T_d_out = "ZZZZZZZZ") report "fail: out == Z when en low"
     severity warning;

     T_en <= '1';
     wait for 10 ns;

     wait;
    end process;

end TB;

---------------------------------------------------------------
configuration CFG_TB_tridr of TB_tridr is
     for TB
     end for;
end;
---------------------------------------------------------------




---------------------------------------------------------------
configuration CFG_TB_decoder_one_of_many of TB_decoder_one_of_many is
     for TBA_decoder_one_of_many
     end for;
end;
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_decoder_one_of_many2 is
end TB_decoder_one_of_many2;

architecture TBA_decoder_one_of_many2 of TB_decoder_one_of_many2 is

  component decoder_one_of_many is
    generic(n: natural := 2);
    port(
      d_in:       in unsigned(n-1 downto 0);
      d_out:	out unsigned((2**n)-1 downto 0)
    );
  end component;

    signal T_d_in: unsigned(1 downto 0);
    signal T_d_out: unsigned(3 downto 0);

    begin
        U_UT: decoder_one_of_many port map (T_d_in, T_d_out);
    process
    begin

      T_d_in <= "00";
      wait for 10 ns;
      assert(T_d_out = "0001") report "failed: 000" severity warning;

      T_d_in <= "01";
      wait for 10 ns;
      assert(T_d_out = "0010") report "failed: 001" severity warning;

      T_d_in <= "10";
      wait for 10 ns;
      assert(T_d_out = "0100") report "failed: 010" severity warning;

      T_d_in <= "11";
      wait for 10 ns;
      assert(T_d_out = "1000") report "failed: 011" severity warning;

      wait;
    end process;

end;


---------------------------------------------------------------
configuration CFG_TB_decoder_one_of_many2 of TB_decoder_one_of_many2 is
     for TBA_decoder_one_of_many2
     end for;
end;
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_reg_transfer is
end TB_reg_transfer;

architecture TB of TB_reg_transfer is

  component reg_transfer is
    port(
      clr, load, clk : in  std_logic;
      r1_in          : in  unsigned(7 downto 0);
      r2_out         : out unsigned(7 downto 0)
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

      U_UT: reg_transfer port map (
        clr,
        load,
        clk,
        r1_in => d_in,
        r2_out => d_out
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

end TB;
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_tinyrom is
end TB_tinyrom;

architecture TB_tinyrom of TB_tinyrom is

  component tinyrom is
    port(
      addr_in:     in unsigned(2 downto 0);
      d_out:	   out unsigned(7 downto 0)
    );
  end component;


  procedure test_case(
    signal addr_in: out unsigned(2 downto 0);
    signal d_out: in unsigned(7 downto 0);
    addr_val: unsigned(2 downto 0);
    d_val: unsigned(7 downto 0)
    ) is
  begin
    -- addr_in <= 3d"0";
    addr_in <= addr_val;
    wait for 10 ns;
    assert(d_out = d_val) report "failed: address "
      & integer'image(to_integer(addr_val))
      & " was " & integer'image(to_integer(unsigned(d_out)))
      & ", expected " & integer'image(to_integer(unsigned(d_val)))
      severity warning;
  end procedure;

  signal addr_in: unsigned(2 downto 0);
  signal d_out: unsigned(7 downto 0);
  

begin
  U_UT: tinyrom port map (addr_in, d_out);
  process
  begin

    test_case(addr_in, d_out, to_unsigned(0, addr_in'length), x"01");
    test_case(addr_in, d_out, to_unsigned(1, addr_in'length), x"02");
    test_case(addr_in, d_out, to_unsigned(2, addr_in'length), x"03");
    test_case(addr_in, d_out, to_unsigned(3, addr_in'length), x"04");
    test_case(addr_in, d_out, to_unsigned(4, addr_in'length), x"05");
    test_case(addr_in, d_out, to_unsigned(5, addr_in'length), x"06");
    test_case(addr_in, d_out, to_unsigned(6, addr_in'length), x"07");
    test_case(addr_in, d_out, to_unsigned(7, addr_in'length), x"08");

    wait;

  end process;
end;

---------------------------------------------------------------
configuration CFG_TB_tinyrom of TB_tinyrom is
     for TB_tinyrom
     end for;
end;
---------------------------------------------------------------



---------------------------------------------------------------
configuration CFG_TB_johnson_counter of TB_johnson_counter is
     for TBA_johnson_counter
     end for;
end;
---------------------------------------------------------------
