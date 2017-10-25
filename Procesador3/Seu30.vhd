----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:57:16 10/25/2017 
-- Design Name: 
-- Module Name:    Seu30 - Behavioral 
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

entity Seu30 is
    Port ( disp30 : in  STD_LOGIC_VECTOR (29 downto 0);
           outSeu30 : out  STD_LOGIC_VECTOR (31 downto 0));
end Seu30;

architecture Behavioral of Seu30 is

begin
	process(disp30)
	begin
		if(disp30(29) = '0') then
			outSeu30 <= "00" & disp30;
		else
			outSeu30 <= "11" & disp30;
		end if;
		
	end process;

end Behavioral;

