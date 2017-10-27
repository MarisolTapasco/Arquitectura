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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity RegisterFile is
    Port ( rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
			  wre : in STD_LOGIC;
			  cRd : out STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

type ram_type is array (39 downto 0) of std_logic_vector (31 downto 0);
    signal RAM: ram_type;
begin
	 RAM(0)<= "00000000000000000000000000000000";--serciora g0
	 
    process (rst,rd,rs1,rs2,dwr,RAM,wre)
    begin
             if rst = '1' then
                RAM <= (others=>"00000000000000000000000000000000");
					 crs1 <="00000000000000000000000000000000";
					 crs2 <="00000000000000000000000000000000";
					 cRd <= "00000000000000000000000000000000";
					 RAM(15)<= "00000000000000000000000000001101";--por el jmpl para que lea el main
             elsif rd /= "000000" and wre='1' then 
					 RAM(conv_integer(rd)) <= dwr;
					 crs1 <= RAM(conv_integer(rs1));
					 crs2 <= RAM(conv_integer(rs2));
					 cRd <= RAM(conv_integer(rd));
				 else 
                crs1 <= RAM(conv_integer(rs1));
					 crs2 <= RAM(conv_integer(rs2));
					 cRd <= RAM(conv_integer(rd));
            end if;
    end process;

end Behavioral;

