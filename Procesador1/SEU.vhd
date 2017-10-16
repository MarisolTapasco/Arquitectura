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
	if(imm13(12) = '1')then 
	   out32(12 downto 0) <= imm13;
		out32(31 downto 13) <= (others=>'1');
	else 
	   out32(12 downto 0) <= imm13;
		out32(31 downto 0) <= (others=>'0');
	end if;
end process;

end Behavioral;

