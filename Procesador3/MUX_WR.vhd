----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:41:29 10/25/2017 
-- Design Name: 
-- Module Name:    MUX_WR - Behavioral 
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

entity MUX_WR is
    Port ( rd : in  STD_LOGIC_VECTOR (5 downto 0);
           num15 : in  STD_LOGIC_VECTOR (5 downto 0);
           rfDest : in  STD_LOGIC;
           nRd : out  STD_LOGIC_VECTOR (5 downto 0));
end MUX_WR;

architecture Behavioral of MUX_WR is

begin
	process(rd, num15, rfDest)
	begin
	
		if(rfDest = '0') then 
			nRd <= rd;
		elsif(rfDest = '1') then
			nRd <= num15;
		end if;
		
	end process;

end Behavioral;

