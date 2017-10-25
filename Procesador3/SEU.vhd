----------------------------------------------------------------------------------
-- Company:         UTP
-- Engineer:        Juan David López
-- 
-- Create Date:    19:58:54 10/02/2017 
-- Design Name:    Unidad de extension de simbolo
-- Module Name:    SEU - Behavioral 
-- Project Name:   
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           out32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture Behavioral of SEU is

begin
process(imm13)
   begin 
	if (imm13(12) = '0') then       
	    out32 <= "0000000000000000000" & imm13;
	else       
	    out32<= "1111111111111111111" & imm13;
	end if;
end process;

end Behavioral;

