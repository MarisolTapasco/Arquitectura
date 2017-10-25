----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:50:57 10/19/2017 
-- Design Name: 
-- Module Name:    Psr - Behavioral 
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

entity Psr is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           ncwp : in  STD_LOGIC;
           cwp : out  STD_LOGIC;
           c : out  STD_LOGIC;
	   icc: out STD_LOGIC_VECTOR(3 downto 0));
end Psr;

architecture Behavioral of Psr is

begin
process(nzvc,clk,rst,ncwp)
	begin
		if(rst = '1')then
			cwp <= '0';
			c <= '0';
			icc <= "0000";
		else
			if(rising_edge(clk))then
				cwp <= ncwp;
				c <= nzvc(0);
				icc <= nzvc;
			end if;
		end if;
end process;

end Behavioral;

