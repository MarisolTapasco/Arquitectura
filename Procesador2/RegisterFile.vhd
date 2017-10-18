----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:10:30 10/14/2017 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
    Port ( rst : in  STD_LOGIC;
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
type Register_File is array (31 downto 0) of std_logic_vector(31 downto 0);
signal registros: Register_file ;

begin
process(rs1,rs2,rd,dwr,rst)
	begin
		if(rst ='1') then
			registros <= (others => "00000000000000000000000000000000");
			crs1 <= "00000000000000000000000000000000";
			crs2 <= "00000000000000000000000000000000";
		else
		   if(rd /= "000000") then
				registros(conv_integer(rd)) <= dwr;
				crs1 <= registros(conv_integer(rs1));
				crs2 <= registros(conv_integer(rs2));				
				
			else
				crs1 <= registros(conv_integer(rs1));
				crs2 <= registros(conv_integer(rs2));
			end if;
		end if;
end process;
end Behavioral;

