----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:35 09/29/2017 
-- Design Name: 
-- Module Name:    instruction_memory - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_memory is
    Port ( rst : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (31 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is
	type memoria_rom is array (0 to 63) of std_logic_vector (31 downto 0);
    signal ROM : memoria_rom := ("10000010000100000010000000000101","10100000000100000011111111111000","10100010000100000010000000000100","10110001001010000110000000000010",
	                              "10110011001101000110000000000001","10000001111010000010000000000000","10100000000000000110000000000011","10000001111000000010000000000000",
	                              "10000000101000000010000000000100","10000110010000000000000000000001","10010000000100000000000000010000","00000000000000000000000000000000",
											"00000000000000000000000000000000","11000010000100000011111111111000","11010100000001000000000000010001","11100000001001001010000000101011",
											"10100000000100000010000000000100","10100010000100000011111111111000","10100100000001000000000000010001","10010000001001001010000000101011",
	                              "10110000000100000010000000000100","11000010000100000011111111111000","11010100000001000000000000010001","11100000001001001010000000101011",
											"10100000000100000010000000000100","10100010000100000011111111111000","10100100000001000000000000010001","10010000001001001010000000101011",
	                              "10110000000100000010000000000100","11000010000100000011111111111000","11010100000001000000000000010001","11100000001001001010000000101011",
	                              "10100000000100000010000000000100","10100010000100000011111111111000","10100100000001000000000000010001","10010000001001001010000000101011",
	                              "10110000000100000010000000000100","11000010000100000011111111111000","11010100000001000000000000010001","11100000001001001010000000101011",
	                              "10100000000100000010000000000100","10100010000100000011111111111000","10100100000001000000000000010001","10010000001001001010000000101011",
	                              "10110000000100000010000000000100","11000010000100000011111111111000","11010100000001000000000000010001","11100000001001001010000000101011",
											"10100000000100000010000000000100","10100010000100000011111111111000","10100100000001000000000000010001","10010000001001001010000000101011",
	                              "10110000000100000010000000000100","11000010000100000011111111111000","11010100000001000000000000010001","11100000001001001010000000101011",
											"10100000000100000010000000000100","10100010000100000011111111111000","10100100000001000000000000010001","10010000001001001010000000101011",
	                              "10110000000100000010000000000100","11000010000100000011111111111000","11010100000001000000000000010001","11100000001001001010000000101011");
					
begin
   process (rst,address)
		begin
         if (rst = '1') then
				instruction <="00000000000000000000000000000000";
			else 
				instruction <= ROM(conv_integer(address(5 downto 0)));  -- RETORNA LA POSICION EN LA MATRIZ DE CADA INSTRUCCION 
         end if;
    end process;
end Behavioral;


