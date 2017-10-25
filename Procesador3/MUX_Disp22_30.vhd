----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:48:56 10/25/2017 
-- Design Name: 
-- Module Name:    MUX_Disp22_30 - Behavioral 
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

entity MUX_Disp22_30 is
    Port ( pcDisp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           pcDisp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           pcSource : in  STD_LOGIC_VECTOR (1 downto 0);
           outMux : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_Disp22_30;

architecture Behavioral of MUX_Disp22_30 is

begin
	process(pcDisp30, pcDisp22, pc,aluResult, pcSource)
	begin
		case pcSource is
			when "00" => outMux <= pc;            ---- pasa PC
			when "01" => outMux <= pcDisp30;     ---- Pasa Call
			when "10" => outMux <= pcDisp22;  ---- Pasa Branch
			when "11" => outMux <= aluResult;     ---- Pasa Jmpl
			when others => outMux <= (others =>'0');
		end case;
		
	end process;

end Behavioral;

