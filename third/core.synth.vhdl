library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity core is
  port (
    clk: in std_logic;
    reset: in std_logic
  );
end entity core;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_one_of_many_4 is
  port (
    en : in std_logic;
    d_in : in std_logic_vector (3 downto 0);
    d_out : out std_logic_vector (15 downto 0));
end entity decoder_one_of_many_4;

architecture rtl of decoder_one_of_many_4 is
  constant n228_o : std_logic_vector (15 downto 0) := "0000000000000000";
  signal n232_o : std_logic;
  signal n233_o : std_logic;
  signal n234_o : std_logic;
  signal n235_o : std_logic;
  signal n236_o : std_logic;
  signal n237_o : std_logic;
  signal n238_o : std_logic;
  signal n239_o : std_logic;
  signal n240_o : std_logic;
  signal n241_o : std_logic;
  signal n242_o : std_logic;
  signal n243_o : std_logic;
  signal n244_o : std_logic;
  signal n245_o : std_logic;
  signal n246_o : std_logic;
  signal n247_o : std_logic;
  signal n248_o : std_logic;
  signal n249_o : std_logic;
  signal n250_o : std_logic;
  signal n251_o : std_logic;
  signal n252_o : std_logic;
  signal n253_o : std_logic;
  signal n254_o : std_logic;
  signal n255_o : std_logic;
  signal n256_o : std_logic;
  signal n257_o : std_logic;
  signal n258_o : std_logic;
  signal n259_o : std_logic;
  signal n260_o : std_logic;
  signal n261_o : std_logic;
  signal n262_o : std_logic;
  signal n263_o : std_logic;
  signal n264_o : std_logic;
  signal n265_o : std_logic;
  signal n266_o : std_logic;
  signal n267_o : std_logic;
  signal n268_o : std_logic;
  signal n269_o : std_logic;
  signal n270_o : std_logic;
  signal n271_o : std_logic;
  signal n272_o : std_logic;
  signal n273_o : std_logic;
  signal n274_o : std_logic;
  signal n275_o : std_logic;
  signal n276_o : std_logic;
  signal n277_o : std_logic;
  signal n278_o : std_logic;
  signal n279_o : std_logic;
  signal n280_o : std_logic;
  signal n281_o : std_logic;
  signal n282_o : std_logic;
  signal n283_o : std_logic;
  signal n284_o : std_logic;
  signal n285_o : std_logic;
  signal n286_o : std_logic;
  signal n287_o : std_logic;
  signal n288_o : std_logic;
  signal n289_o : std_logic;
  signal n290_o : std_logic;
  signal n291_o : std_logic;
  signal n292_o : std_logic;
  signal n293_o : std_logic;
  signal n294_o : std_logic;
  signal n295_o : std_logic;
  signal n296_o : std_logic;
  signal n297_o : std_logic;
  signal n298_o : std_logic;
  signal n299_o : std_logic;
  signal n300_o : std_logic_vector (15 downto 0);
begin
  d_out <= n300_o;
  -- ../decoder_1ofN.vhdl:19:5
  n232_o <= d_in (3);
  -- ../decoder_1ofN.vhdl:19:5
  n233_o <= not n232_o;
  -- ../decoder_1ofN.vhdl:19:5
  n234_o <= d_in (2);
  -- ../decoder_1ofN.vhdl:19:5
  n235_o <= not n234_o;
  -- ../decoder_1ofN.vhdl:19:5
  n236_o <= n233_o and n235_o;
  -- ../decoder_1ofN.vhdl:19:5
  n237_o <= n233_o and n234_o;
  -- ../decoder_1ofN.vhdl:19:5
  n238_o <= n232_o and n235_o;
  -- ../decoder_1ofN.vhdl:19:5
  n239_o <= n232_o and n234_o;
  -- ../decoder_1ofN.vhdl:19:5
  n240_o <= d_in (1);
  -- ../decoder_1ofN.vhdl:19:5
  n241_o <= not n240_o;
  -- ../decoder_1ofN.vhdl:19:5
  n242_o <= n236_o and n241_o;
  -- ../decoder_1ofN.vhdl:19:5
  n243_o <= n236_o and n240_o;
  -- ../decoder_1ofN.vhdl:19:5
  n244_o <= n237_o and n241_o;
  -- ../decoder_1ofN.vhdl:19:5
  n245_o <= n237_o and n240_o;
  -- ../decoder_1ofN.vhdl:19:5
  n246_o <= n238_o and n241_o;
  -- ../decoder_1ofN.vhdl:19:5
  n247_o <= n238_o and n240_o;
  -- ../decoder_1ofN.vhdl:19:5
  n248_o <= n239_o and n241_o;
  -- ../decoder_1ofN.vhdl:19:5
  n249_o <= n239_o and n240_o;
  -- ../decoder_1ofN.vhdl:19:5
  n250_o <= d_in (0);
  -- ../decoder_1ofN.vhdl:19:5
  n251_o <= not n250_o;
  -- ../decoder_1ofN.vhdl:19:5
  n252_o <= n242_o and n251_o;
  -- ../decoder_1ofN.vhdl:19:5
  n253_o <= n242_o and n250_o;
  -- ../decoder_1ofN.vhdl:19:5
  n254_o <= n243_o and n251_o;
  -- ../decoder_1ofN.vhdl:19:5
  n255_o <= n243_o and n250_o;
  -- ../decoder_1ofN.vhdl:19:5
  n256_o <= n244_o and n251_o;
  -- ../decoder_1ofN.vhdl:19:5
  n257_o <= n244_o and n250_o;
  -- ../decoder_1ofN.vhdl:19:5
  n258_o <= n245_o and n251_o;
  -- ../decoder_1ofN.vhdl:19:5
  n259_o <= n245_o and n250_o;
  -- ../decoder_1ofN.vhdl:19:5
  n260_o <= n246_o and n251_o;
  -- ../decoder_1ofN.vhdl:19:5
  n261_o <= n246_o and n250_o;
  -- ../decoder_1ofN.vhdl:19:5
  n262_o <= n247_o and n251_o;
  -- ../decoder_1ofN.vhdl:19:5
  n263_o <= n247_o and n250_o;
  -- ../decoder_1ofN.vhdl:19:5
  n264_o <= n248_o and n251_o;
  -- ../decoder_1ofN.vhdl:19:5
  n265_o <= n248_o and n250_o;
  -- ../decoder_1ofN.vhdl:19:5
  n266_o <= n249_o and n251_o;
  -- ../decoder_1ofN.vhdl:19:5
  n267_o <= n249_o and n250_o;
  n268_o <= n228_o (0);
  -- ../decoder_1ofN.vhdl:19:5
  n269_o <= n268_o when n252_o = '0' else en;
  n270_o <= n228_o (1);
  -- ../decoder_1ofN.vhdl:19:5
  n271_o <= n270_o when n253_o = '0' else en;
  n272_o <= n228_o (2);
  -- ../decoder_1ofN.vhdl:19:5
  n273_o <= n272_o when n254_o = '0' else en;
  n274_o <= n228_o (3);
  -- ../decoder_1ofN.vhdl:19:5
  n275_o <= n274_o when n255_o = '0' else en;
  n276_o <= n228_o (4);
  -- ../decoder_1ofN.vhdl:19:5
  n277_o <= n276_o when n256_o = '0' else en;
  n278_o <= n228_o (5);
  -- ../decoder_1ofN.vhdl:19:5
  n279_o <= n278_o when n257_o = '0' else en;
  n280_o <= n228_o (6);
  -- ../decoder_1ofN.vhdl:19:5
  n281_o <= n280_o when n258_o = '0' else en;
  n282_o <= n228_o (7);
  -- ../decoder_1ofN.vhdl:19:5
  n283_o <= n282_o when n259_o = '0' else en;
  n284_o <= n228_o (8);
  -- ../decoder_1ofN.vhdl:19:5
  n285_o <= n284_o when n260_o = '0' else en;
  n286_o <= n228_o (9);
  -- ../decoder_1ofN.vhdl:19:5
  n287_o <= n286_o when n261_o = '0' else en;
  n288_o <= n228_o (10);
  -- ../decoder_1ofN.vhdl:19:5
  n289_o <= n288_o when n262_o = '0' else en;
  n290_o <= n228_o (11);
  -- ../decoder_1ofN.vhdl:19:5
  n291_o <= n290_o when n263_o = '0' else en;
  n292_o <= n228_o (12);
  -- ../decoder_1ofN.vhdl:19:5
  n293_o <= n292_o when n264_o = '0' else en;
  n294_o <= n228_o (13);
  -- ../decoder_1ofN.vhdl:19:5
  n295_o <= n294_o when n265_o = '0' else en;
  n296_o <= n228_o (14);
  -- ../decoder_1ofN.vhdl:19:5
  n297_o <= n296_o when n266_o = '0' else en;
  n298_o <= n228_o (15);
  -- ../decoder_1ofN.vhdl:19:5
  n299_o <= n298_o when n267_o = '0' else en;
  n300_o <= n299_o & n297_o & n295_o & n293_o & n291_o & n289_o & n287_o & n285_o & n283_o & n281_o & n279_o & n277_o & n275_o & n273_o & n271_o & n269_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_8 is
  port (
    clr : in std_logic;
    load : in std_logic;
    clk : in std_logic;
    d_in : in std_logic_vector (7 downto 0);
    d_out : out std_logic_vector (7 downto 0));
end entity reg_8;

architecture rtl of reg_8 is
  signal n214_o : std_logic;
  signal n215_o : std_logic;
  signal n221_o : std_logic_vector (7 downto 0);
  signal n222_q : std_logic_vector (7 downto 0);
begin
  d_out <= n222_q;
  -- ../register.vhdl:20:12
  n214_o <= not clr;
  -- ../register.vhdl:20:18
  n215_o <= n214_o and load;
  -- ../register.vhdl:19:3
  n221_o <= n222_q when n215_o = '0' else d_in;
  -- ../register.vhdl:19:3
  process (clk, clr)
  begin
    if clr = '1' then
      n222_q <= "00000000";
    elsif rising_edge (clk) then
      n222_q <= n221_o;
    end if;
  end process;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity upcounter_5 is
  port (
    reset : in std_logic;
    clk : in std_logic;
    d_out : out std_logic_vector (4 downto 0));
end entity upcounter_5;

architecture rtl of upcounter_5 is
  signal count : std_logic_vector (4 downto 0);
  signal n204_o : std_logic_vector (4 downto 0);
  signal n209_q : std_logic_vector (4 downto 0);
begin
  d_out <= count;
  -- ../upcounter.vhdl:15:12
  count <= n209_q; -- (signal)
  -- ../upcounter.vhdl:23:22
  n204_o <= std_logic_vector (unsigned (count) + unsigned'("00001"));
  -- ../upcounter.vhdl:22:5
  process (clk, reset)
  begin
    if reset = '1' then
      n209_q <= "00000";
    elsif rising_edge (clk) then
      n209_q <= n204_o;
    end if;
  end process;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tinyrom is
  port (
    en : in std_logic;
    addr_in : in std_logic_vector (2 downto 0);
    d_out : out std_logic_vector (7 downto 0));
end entity tinyrom;

architecture rtl of tinyrom is
  signal n169_o : std_logic;
  signal n171_o : std_logic;
  signal n173_o : std_logic;
  signal n175_o : std_logic;
  signal n177_o : std_logic;
  signal n179_o : std_logic;
  signal n181_o : std_logic;
  signal n183_o : std_logic;
  signal n184_o : std_logic_vector (7 downto 0);
  signal n194_o : std_logic_vector (7 downto 0);
  signal n198_o : std_logic_vector (7 downto 0);
begin
  d_out <= n198_o;
  -- ../tinyrom.vhdl:30:11
  n169_o <= '1' when addr_in = "000" else '0';
  -- ../tinyrom.vhdl:31:11
  n171_o <= '1' when addr_in = "001" else '0';
  -- ../tinyrom.vhdl:32:11
  n173_o <= '1' when addr_in = "010" else '0';
  -- ../tinyrom.vhdl:33:11
  n175_o <= '1' when addr_in = "011" else '0';
  -- ../tinyrom.vhdl:34:11
  n177_o <= '1' when addr_in = "100" else '0';
  -- ../tinyrom.vhdl:35:11
  n179_o <= '1' when addr_in = "101" else '0';
  -- ../tinyrom.vhdl:36:11
  n181_o <= '1' when addr_in = "110" else '0';
  -- ../tinyrom.vhdl:37:11
  n183_o <= '1' when addr_in = "111" else '0';
  n184_o <= n183_o & n181_o & n179_o & n177_o & n175_o & n173_o & n171_o & n169_o;
  -- ../tinyrom.vhdl:29:7
  with n184_o select n194_o <=
    "00000000" when "10000000",
    "10001011" when "01000000",
    "00000000" when "00100000",
    "01010001" when "00010000",
    "00000000" when "00001000",
    "10110101" when "00000100",
    "00000010" when "00000010",
    "10001011" when "00000001",
    "00000000" when others;
  -- ../tinyrom.vhdl:17:5
  n198_o <= n194_o when (en = '1') else "ZZZZZZZZ";
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_tristate_8 is
  port (
    clr : in std_logic;
    load : in std_logic;
    clk : in std_logic;
    en : in std_logic;
    d_in : in std_logic_vector (7 downto 0);
    d_out : out std_logic_vector (7 downto 0));
end entity reg_tristate_8;

architecture rtl of reg_tristate_8 is
  signal internal : std_logic_vector (7 downto 0);
  signal n153_o : std_logic;
  signal n154_o : std_logic;
  signal n162_o : std_logic_vector (7 downto 0);
  signal n163_q : std_logic_vector (7 downto 0);
  signal n164_o : std_logic_vector (7 downto 0);
begin
  d_out <= n164_o;
  -- ../register_tristate.vhdl:15:10
  internal <= n163_q; -- (signal)
  -- ../register_tristate.vhdl:23:16
  n153_o <= not clr;
  -- ../register_tristate.vhdl:23:22
  n154_o <= n153_o and load;
  -- ../register_tristate.vhdl:22:7
  n162_o <= internal when n154_o = '0' else d_in;
  -- ../register_tristate.vhdl:22:7
  process (clk, clr)
  begin
    if clr = '1' then
      n163_q <= "00000000";
    elsif rising_edge (clk) then
      n163_q <= n162_o;
    end if;
  end process;
  -- ../register_tristate.vhdl:30:21
  n164_o <= internal when (en = '1') else "ZZZZZZZZ";
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity upcounter_3 is
  port (
    reset : in std_logic;
    clk : in std_logic;
    d_out : out std_logic_vector (2 downto 0));
end entity upcounter_3;

architecture rtl of upcounter_3 is
  signal count : std_logic_vector (2 downto 0);
  signal n143_o : std_logic_vector (2 downto 0);
  signal n148_q : std_logic_vector (2 downto 0);
begin
  d_out <= count;
  -- ../upcounter.vhdl:15:12
  count <= n148_q; -- (signal)
  -- ../upcounter.vhdl:23:22
  n143_o <= std_logic_vector (unsigned (count) + unsigned'("001"));
  -- ../upcounter.vhdl:22:5
  process (clk, reset)
  begin
    if reset = '1' then
      n148_q <= "000";
    elsif rising_edge (clk) then
      n148_q <= n143_o;
    end if;
  end process;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_decoder is
  port (
    reset : in std_logic;
    clk : in std_logic;
    en : in std_logic;
    en0 : in std_logic;
    en1 : in std_logic;
    d_in : in std_logic_vector (7 downto 0);
    out0 : out std_logic_vector (15 downto 0);
    out1 : out std_logic_vector (15 downto 0));
end entity instruction_decoder;

architecture rtl of instruction_decoder is
  signal internal : std_logic_vector (7 downto 0);
  signal actually_en0 : std_logic;
  signal actually_en1 : std_logic;
  signal n124_o : std_logic;
  signal n125_o : std_logic;
  constant n126_o : std_logic := '1';
  signal instruction_decoder_reg_n127 : std_logic_vector (7 downto 0);
  signal instruction_decoder_reg_c_d_out : std_logic_vector (7 downto 0);
  signal n130_o : std_logic_vector (3 downto 0);
  signal decoder1_n131 : std_logic_vector (15 downto 0);
  signal decoder1_c_d_out : std_logic_vector (15 downto 0);
  signal n134_o : std_logic_vector (3 downto 0);
  signal decoder0_n135 : std_logic_vector (15 downto 0);
  signal decoder0_c_d_out : std_logic_vector (15 downto 0);
begin
  out0 <= decoder0_n135;
  out1 <= decoder1_n131;
  -- ../instruction_decoder.vhdl:39:8
  internal <= instruction_decoder_reg_n127; -- (signal)
  -- ../instruction_decoder.vhdl:40:8
  actually_en0 <= n124_o; -- (signal)
  -- ../instruction_decoder.vhdl:41:8
  actually_en1 <= n125_o; -- (signal)
  -- ../instruction_decoder.vhdl:45:22
  n124_o <= en and en0;
  -- ../instruction_decoder.vhdl:46:22
  n125_o <= en and en1;
  -- ../instruction_decoder.vhdl:54:16
  instruction_decoder_reg_n127 <= instruction_decoder_reg_c_d_out; -- (signal)
  -- ../instruction_decoder.vhdl:48:3
  instruction_decoder_reg : entity work.reg_8 port map (
    clr => reset,
    load => n126_o,
    clk => clk,
    d_in => d_in,
    d_out => instruction_decoder_reg_c_d_out);
  -- ../instruction_decoder.vhdl:60:23
  n130_o <= internal (7 downto 4);
  -- ../instruction_decoder.vhdl:61:16
  decoder1_n131 <= decoder1_c_d_out; -- (signal)
  -- ../instruction_decoder.vhdl:57:3
  decoder1 : entity work.decoder_one_of_many_4 port map (
    en => actually_en1,
    d_in => n130_o,
    d_out => decoder1_c_d_out);
  -- ../instruction_decoder.vhdl:67:23
  n134_o <= internal (3 downto 0);
  -- ../instruction_decoder.vhdl:68:16
  decoder0_n135 <= decoder0_c_d_out; -- (signal)
  -- ../instruction_decoder.vhdl:64:3
  decoder0 : entity work.decoder_one_of_many_4 port map (
    en => actually_en0,
    d_in => n134_o,
    d_out => decoder0_c_d_out);
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity step_decoder is
  port (
    step : in std_logic_vector (2 downto 0);
    send_enable : in std_logic;
    load_enable : in std_logic;
    increment_pc : out std_logic;
    load_instruction_decoder_word : out std_logic;
    load_reg_il : out std_logic;
    execute_instruction : out std_logic;
    send_mem : out std_logic);
end entity step_decoder;

architecture rtl of step_decoder is
  signal n96_o : std_logic;
  signal n98_o : std_logic;
  signal n99_o : std_logic;
  signal n100_o : std_logic;
  signal n103_o : std_logic;
  signal n104_o : std_logic;
  signal n107_o : std_logic;
  signal n108_o : std_logic;
  signal n111_o : std_logic;
  signal n113_o : std_logic;
  signal n114_o : std_logic;
  signal n115_o : std_logic;
  signal n119_o : std_logic;
  signal n120_o : std_logic;
begin
  increment_pc <= n100_o;
  load_instruction_decoder_word <= n104_o;
  load_reg_il <= n108_o;
  execute_instruction <= n120_o;
  send_mem <= n115_o;
  -- ../step_decoder.vhdl:25:48
  n96_o <= '1' when step = "000" else '0';
  -- ../step_decoder.vhdl:25:76
  n98_o <= '1' when step = "001" else '0';
  -- ../step_decoder.vhdl:25:68
  n99_o <= n96_o or n98_o;
  -- ../step_decoder.vhdl:25:38
  n100_o <= '0' when n99_o = '0' else send_enable;
  -- ../step_decoder.vhdl:26:60
  n103_o <= '1' when step = "000" else '0';
  -- ../step_decoder.vhdl:26:50
  n104_o <= '0' when n103_o = '0' else load_enable;
  -- ../step_decoder.vhdl:27:48
  n107_o <= '1' when step = "001" else '0';
  -- ../step_decoder.vhdl:27:38
  n108_o <= '0' when n107_o = '0' else load_enable;
  -- ../step_decoder.vhdl:28:48
  n111_o <= '1' when step = "000" else '0';
  -- ../step_decoder.vhdl:28:76
  n113_o <= '1' when step = "001" else '0';
  -- ../step_decoder.vhdl:28:68
  n114_o <= n111_o or n113_o;
  -- ../step_decoder.vhdl:28:38
  n115_o <= '0' when n114_o = '0' else send_enable;
  -- ../step_decoder.vhdl:29:40
  n119_o <= '1' when step = "010" else '0';
  -- ../step_decoder.vhdl:29:30
  n120_o <= '0' when n119_o = '0' else '1';
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_cycle_generator is
  port (
    clk : in std_logic;
    reset : in std_logic;
    step : out std_logic_vector (2 downto 0);
    send_enable : out std_logic;
    load_enable : out std_logic);
end entity instruction_cycle_generator;

architecture rtl of instruction_cycle_generator is
  signal count : std_logic_vector (4 downto 0);
  signal step_counter_n67 : std_logic_vector (4 downto 0);
  signal step_counter_c_d_out : std_logic_vector (4 downto 0);
  signal n70_o : std_logic_vector (2 downto 0);
  signal n71_o : std_logic;
  signal n72_o : std_logic;
  signal n73_o : std_logic;
  signal n74_o : std_logic;
  signal n75_o : std_logic;
  signal n76_o : std_logic;
  signal n77_o : std_logic;
  signal n78_o : std_logic;
  signal n79_o : std_logic;
  signal n80_o : std_logic;
  signal n81_o : std_logic;
  signal n82_o : std_logic;
  signal n83_o : std_logic;
  signal n84_o : std_logic;
  signal n85_o : std_logic;
  signal n86_o : std_logic;
  signal n87_o : std_logic;
  signal n88_o : std_logic;
  signal n89_o : std_logic;
begin
  step <= n70_o;
  send_enable <= n85_o;
  load_enable <= n89_o;
  -- ../instruction_cycle_generator.vhdl:26:8
  count <= step_counter_n67; -- (signal)
  -- ../instruction_cycle_generator.vhdl:36:14
  step_counter_n67 <= step_counter_c_d_out; -- (signal)
  -- ../instruction_cycle_generator.vhdl:29:3
  step_counter : entity work.upcounter_5 port map (
    reset => reset,
    clk => clk,
    d_out => step_counter_c_d_out);
  -- ../instruction_cycle_generator.vhdl:39:28
  n70_o <= count (4 downto 2);
  -- ../instruction_cycle_generator.vhdl:41:28
  n71_o <= count (0);
  -- ../instruction_cycle_generator.vhdl:41:19
  n72_o <= not n71_o;
  -- ../instruction_cycle_generator.vhdl:41:45
  n73_o <= count (1);
  -- ../instruction_cycle_generator.vhdl:41:36
  n74_o <= not n73_o;
  -- ../instruction_cycle_generator.vhdl:41:32
  n75_o <= n72_o and n74_o;
  -- ../instruction_cycle_generator.vhdl:42:27
  n76_o <= count (0);
  -- ../instruction_cycle_generator.vhdl:42:44
  n77_o <= count (1);
  -- ../instruction_cycle_generator.vhdl:42:35
  n78_o <= not n77_o;
  -- ../instruction_cycle_generator.vhdl:42:31
  n79_o <= n76_o and n78_o;
  -- ../instruction_cycle_generator.vhdl:42:18
  n80_o <= n75_o or n79_o;
  -- ../instruction_cycle_generator.vhdl:43:31
  n81_o <= count (0);
  -- ../instruction_cycle_generator.vhdl:43:22
  n82_o <= not n81_o;
  -- ../instruction_cycle_generator.vhdl:43:44
  n83_o <= count (1);
  -- ../instruction_cycle_generator.vhdl:43:35
  n84_o <= n82_o and n83_o;
  -- ../instruction_cycle_generator.vhdl:43:18
  n85_o <= n80_o or n84_o;
  -- ../instruction_cycle_generator.vhdl:44:23
  n86_o <= count (0);
  -- ../instruction_cycle_generator.vhdl:44:40
  n87_o <= count (1);
  -- ../instruction_cycle_generator.vhdl:44:31
  n88_o <= not n87_o;
  -- ../instruction_cycle_generator.vhdl:44:27
  n89_o <= n86_o and n88_o;
end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of core is
  signal wrap_clk: std_logic;
  signal wrap_reset: std_logic;
  signal pc_out : std_logic_vector (2 downto 0);
  signal data_bus : std_logic_vector (7 downto 0);
  signal step : std_logic_vector (2 downto 0);
  signal send_enable : std_logic;
  signal load_enable : std_logic;
  signal increment_pc : std_logic;
  signal load_instruction_decoder_word : std_logic;
  signal load_reg_il : std_logic;
  signal execute_instruction : std_logic;
  signal send_mem : std_logic;
  signal inst_send_control : std_logic_vector (15 downto 0);
  signal inst_load_control : std_logic_vector (15 downto 0);
  signal icg_n0 : std_logic_vector (2 downto 0);
  signal icg_n1 : std_logic;
  signal icg_n2 : std_logic;
  signal icg_c_step : std_logic_vector (2 downto 0);
  signal icg_c_send_enable : std_logic;
  signal icg_c_load_enable : std_logic;
  signal instruction_cycle_step_decoder_n9 : std_logic;
  signal instruction_cycle_step_decoder_n10 : std_logic;
  signal instruction_cycle_step_decoder_n11 : std_logic;
  signal instruction_cycle_step_decoder_n12 : std_logic;
  signal instruction_cycle_step_decoder_n13 : std_logic;
  signal instruction_cycle_step_decoder_c_increment_pc : std_logic;
  signal instruction_cycle_step_decoder_c_load_instruction_decoder_word : std_logic;
  signal instruction_cycle_step_decoder_c_load_reg_il : std_logic;
  signal instruction_cycle_step_decoder_c_execute_instruction : std_logic;
  signal instruction_cycle_step_decoder_c_send_mem : std_logic;
  signal the_instruction_decoder_n24 : std_logic_vector (15 downto 0);
  signal the_instruction_decoder_n25 : std_logic_vector (15 downto 0);
  signal the_instruction_decoder_c_out0 : std_logic_vector (15 downto 0);
  signal the_instruction_decoder_c_out1 : std_logic_vector (15 downto 0);
  signal pc_n30 : std_logic_vector (2 downto 0);
  signal pc_c_d_out : std_logic_vector (2 downto 0);
  constant n33_o : std_logic := '1';
  signal n34_o : std_logic;
  signal reg_il_n35 : std_logic_vector (7 downto 0);
  signal reg_il_c_d_out : std_logic_vector (7 downto 0);
  signal mem_n38 : std_logic_vector (7 downto 0);
  signal mem_c_d_out : std_logic_vector (7 downto 0);
  constant n41_o : std_logic := '1';
  signal n42_o : std_logic;
  signal n43_o : std_logic;
  signal reg_r_n44 : std_logic_vector (7 downto 0);
  signal reg_r_c_d_out : std_logic_vector (7 downto 0);
  constant n47_o : std_logic := '1';
  signal n48_o : std_logic;
  signal n49_o : std_logic;
  signal reg_x_n50 : std_logic_vector (7 downto 0);
  signal reg_x_c_d_out : std_logic_vector (7 downto 0);
  constant n53_o : std_logic := '1';
  signal n54_o : std_logic;
  signal n55_o : std_logic;
  signal reg_y_n56 : std_logic_vector (7 downto 0);
  signal reg_y_c_d_out : std_logic_vector (7 downto 0);
  signal n59_o : std_logic_vector (7 downto 0);
  signal n60_o : std_logic_vector (7 downto 0);
  signal n61_o : std_logic_vector (7 downto 0);
  signal n62_o : std_logic_vector (7 downto 0);
begin
  wrap_clk <= clk;
  wrap_reset <= reset;
  -- ../core.vhdl:105:8
  pc_out <= pc_n30; -- (signal)
  -- ../core.vhdl:106:8
  data_bus <= n62_o; -- (signal)
  -- ../core.vhdl:108:8
  step <= icg_n0; -- (signal)
  -- ../core.vhdl:110:8
  send_enable <= icg_n1; -- (signal)
  -- ../core.vhdl:111:8
  load_enable <= icg_n2; -- (signal)
  -- ../core.vhdl:113:8
  increment_pc <= instruction_cycle_step_decoder_n9; -- (signal)
  -- ../core.vhdl:114:8
  load_instruction_decoder_word <= instruction_cycle_step_decoder_n10; -- (signal)
  -- ../core.vhdl:115:8
  load_reg_il <= instruction_cycle_step_decoder_n11; -- (signal)
  -- ../core.vhdl:116:8
  execute_instruction <= instruction_cycle_step_decoder_n12; -- (signal)
  -- ../core.vhdl:117:8
  send_mem <= instruction_cycle_step_decoder_n13; -- (signal)
  -- ../core.vhdl:119:8
  inst_send_control <= the_instruction_decoder_n25; -- (signal)
  -- ../core.vhdl:120:8
  inst_load_control <= the_instruction_decoder_n24; -- (signal)
  -- ../core.vhdl:136:15
  icg_n0 <= icg_c_step; -- (signal)
  -- ../core.vhdl:137:22
  icg_n1 <= icg_c_send_enable; -- (signal)
  -- ../core.vhdl:138:22
  icg_n2 <= icg_c_load_enable; -- (signal)
  -- ../core.vhdl:132:3
  icg : entity work.instruction_cycle_generator port map (
    clk => wrap_clk,
    reset => wrap_reset,
    step => icg_c_step,
    send_enable => icg_c_send_enable,
    load_enable => icg_c_load_enable);
  -- ../core.vhdl:147:23
  instruction_cycle_step_decoder_n9 <= instruction_cycle_step_decoder_c_increment_pc; -- (signal)
  -- ../core.vhdl:148:40
  instruction_cycle_step_decoder_n10 <= instruction_cycle_step_decoder_c_load_instruction_decoder_word; -- (signal)
  -- ../core.vhdl:149:22
  instruction_cycle_step_decoder_n11 <= instruction_cycle_step_decoder_c_load_reg_il; -- (signal)
  -- ../core.vhdl:151:30
  instruction_cycle_step_decoder_n12 <= instruction_cycle_step_decoder_c_execute_instruction; -- (signal)
  -- ../core.vhdl:153:19
  instruction_cycle_step_decoder_n13 <= instruction_cycle_step_decoder_c_send_mem; -- (signal)
  -- ../core.vhdl:141:3
  instruction_cycle_step_decoder : entity work.step_decoder port map (
    step => step,
    send_enable => send_enable,
    load_enable => load_enable,
    increment_pc => instruction_cycle_step_decoder_c_increment_pc,
    load_instruction_decoder_word => instruction_cycle_step_decoder_c_load_instruction_decoder_word,
    load_reg_il => instruction_cycle_step_decoder_c_load_reg_il,
    execute_instruction => instruction_cycle_step_decoder_c_execute_instruction,
    send_mem => instruction_cycle_step_decoder_c_send_mem);
  -- ../core.vhdl:164:15
  the_instruction_decoder_n24 <= the_instruction_decoder_c_out0; -- (signal)
  -- ../core.vhdl:165:15
  the_instruction_decoder_n25 <= the_instruction_decoder_c_out1; -- (signal)
  -- ../core.vhdl:156:3
  the_instruction_decoder : entity work.instruction_decoder port map (
    reset => wrap_reset,
    clk => load_instruction_decoder_word,
    en => execute_instruction,
    en0 => load_enable,
    en1 => send_enable,
    d_in => data_bus,
    out0 => the_instruction_decoder_c_out0,
    out1 => the_instruction_decoder_c_out1);
  -- ../core.vhdl:172:16
  pc_n30 <= pc_c_d_out; -- (signal)
  -- ../core.vhdl:168:3
  pc : entity work.upcounter_3 port map (
    reset => wrap_reset,
    clk => increment_pc,
    d_out => pc_c_d_out);
  -- ../core.vhdl:180:30
  n34_o <= inst_send_control (8);
  -- ../core.vhdl:182:16
  reg_il_n35 <= reg_il_c_d_out; -- (signal)
  -- ../core.vhdl:175:3
  reg_il : entity work.reg_tristate_8 port map (
    clr => wrap_reset,
    load => n33_o,
    clk => load_reg_il,
    en => n34_o,
    d_in => data_bus,
    d_out => reg_il_c_d_out);
  -- ../core.vhdl:191:16
  mem_n38 <= mem_c_d_out; -- (signal)
  -- ../core.vhdl:187:3
  mem : entity work.tinyrom port map (
    en => send_mem,
    addr_in => pc_out,
    d_out => mem_c_d_out);
  -- ../core.vhdl:201:31
  n42_o <= inst_load_control (11);
  -- ../core.vhdl:202:30
  n43_o <= inst_send_control (11);
  -- ../core.vhdl:204:16
  reg_r_n44 <= reg_r_c_d_out; -- (signal)
  -- ../core.vhdl:197:3
  reg_r : entity work.reg_tristate_8 port map (
    clr => wrap_reset,
    load => n41_o,
    clk => n42_o,
    en => n43_o,
    d_in => data_bus,
    d_out => reg_r_c_d_out);
  -- ../core.vhdl:211:31
  n48_o <= inst_load_control (5);
  -- ../core.vhdl:212:30
  n49_o <= inst_send_control (5);
  -- ../core.vhdl:214:16
  reg_x_n50 <= reg_x_c_d_out; -- (signal)
  -- ../core.vhdl:207:3
  reg_x : entity work.reg_tristate_8 port map (
    clr => wrap_reset,
    load => n47_o,
    clk => n48_o,
    en => n49_o,
    d_in => data_bus,
    d_out => reg_x_c_d_out);
  -- ../core.vhdl:221:31
  n54_o <= inst_load_control (1);
  -- ../core.vhdl:222:30
  n55_o <= inst_send_control (1);
  -- ../core.vhdl:224:16
  reg_y_n56 <= reg_y_c_d_out; -- (signal)
  -- ../core.vhdl:217:3
  reg_y : entity work.reg_tristate_8 port map (
    clr => wrap_reset,
    load => n53_o,
    clk => n54_o,
    en => n55_o,
    d_in => data_bus,
    d_out => reg_y_c_d_out);
  -- ../core.vhdl:182:16
  n59_o <= reg_il_n35;
  n59_o <= mem_n38;
  -- ../core.vhdl:182:16
  n60_o <= n59_o;
  n60_o <= reg_r_n44;
  -- ../core.vhdl:182:16
  n61_o <= n60_o;
  n61_o <= reg_x_n50;
  -- ../core.vhdl:182:16
  n62_o <= n61_o;
  n62_o <= reg_y_n56;
end rtl;
