---------------------------------------------------------
-- VHDL model for tri state driver				  
-- by Weijun Zhang, 05/2001
--
-- this friver often used to control system outputs	
---------------------------------------------------------

-- library ieee;
-- use ieee.std_logic_1164.all;
-- entity tristate_dr is
-- port(
--     d_in:	in std_logic_vector(7 downto 0);
-- 	en: 	in std_logic;
-- 	d_out:	out std_logic_vector(7 downto 0)
-- );			  
-- end tristate_dr;

-- architecture behavior of tristate_dr is
-- begin

--   process(d_in, en)
--   begin
-- 	if en='1' then
-- 	  d_out <= d_in;
-- 	else				   
-- 	  -- array can be created simply by using vector
-- 	  d_out <= "ZZZZZZZZ";
-- 	end if;
--   end process;

-- end behavior;

library ieee ;
use ieee.std_logic_1164.all;

--------------------------------------------

entity D_latch is
port(	data_in:	in std_logic;
	enable:		in std_logic;
	data_out:	out std_logic
);
end D_latch;

--------------------------------------------

architecture behv of D_latch is
begin		

    -- compare this to D flipflop

    process(data_in, enable)
    begin
        if (enable='1') then
            -- no clock signal here
	    data_out <= data_in;  
	end if;
    end process;	
	
end behv;

