----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:54:58 10/25/2017 
-- Design Name: 
-- Module Name:    Seu22 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Seu22 is
    Port ( disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
           outSeu : out  STD_LOGIC_VECTOR (31 downto 0));
end Seu22;

architecture Behavioral of Seu22 is

begin
	process (disp22)
	
	begin
		if(disp22(21) = '0') then
			outSeu <= "0000000000" & disp22;
		else
			outSeu <= "1111111111" & disp22;
		end if;
		
	end process;

end Behavioral;

