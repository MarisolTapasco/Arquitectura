----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:31:27 10/25/2017 
-- Design Name: 
-- Module Name:    MUX_AluDm - Behavioral 
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

entity MUX_AluDm is
    Port ( dataTomem : in  STD_LOGIC_VECTOR (31 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           rfSource : in  STD_LOGIC_VECTOR (1 downto 0);
           dataToreg : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_AluDm;

architecture Behavioral of MUX_AluDm is

begin
process(dataTomem,aluResult,pc,rfSource)
	begin
		if(rfSource = "00") then
			dataToreg <= dataTomem;
		elsif(rfSource = "01") then
			dataToreg <= aluResult;
			elsif(rfSource = "10") then 
				dataToreg <= pc;
			else
				dataToreg <= (others => '0');
		end if;
end process;

end Behavioral;

