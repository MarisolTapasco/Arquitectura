----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:24 10/08/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( Aluop: in std_logic_vector (5 downto 0);
	        op1 : in  std_logic_vector (31 downto 0);
           op2 : in  std_logic_vector (31 downto 0);
           result : out  std_logic_vector (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
process (Aluop,op1,op2)

begin
	case Aluop is
		when "000000" =>
			result <= std_logic_vector(unsigned(op1) + unsigned(op2))  ;  --ADD
		when "000001" =>
			result <= op1 AND op2;		                                   --AND
		when "000010" =>
			result <= op1 OR op2;				                             --OR
		when "000011" =>
			result <= op1 XOR op2;				                             --XOR
		when "000100" =>
			result <= std_logic_vector(unsigned(op1) - unsigned(op2)) ;	  --SUB
		when "000101" =>
			result <= op1 AND NOT op2;				                          --NAND
		when "000110" =>
			result <= op1 OR NOT op2;		                                --NOR
		when "000111" =>
			result <= op1 XNOR op2 ;				                          --XNOR	
		when "010000" => 
			result <= std_logic_vector((op1) + (op2)); 						  --ADDcc
		when "010100" => 
			result <= std_logic_vector((op1) - (op2)); 						  --SUBcc
		when "010001" => 
			result <= std_logic_vector((op1) and (op2)); 					  --ANDcc
		when "010101" => 
			result <= std_logic_vector((op1)and (not(op2))); 				  --ANDNcc
		when "010010" => 
			result <= std_logic_vector((op1) or (op2)); 						  --ORcc
		when "010110" => 
			result <= std_logic_vector((op1) or (not(op2))); 			     --ORNcc
		when "010011" => 
			result <= std_logic_vector((op1) xor (op2)); 					  --XORcc
		when "010111" => 
			result <= std_logic_vector((op1) xnor (op2)); 				     --XNORcc
		when "001000" => 
			result <= std_logic_vector((op1) + (op2)+C); 					  --ADDX
		when "001100" => 
			result <= std_logic_vector((op1) - (op2)-C); 					  --SUBx
		when "011000" => 
			result <= std_logic_vector((op1) + (op2)+C); 					  --ADDxcc
		when "011100" => 
			result <= std_logic_vector((op1) - (op2)-C); 					  --SUBxcc
	
	 when others =>
	  result <="00000000000000000000000000000000";

	 
	end case;
end process;
end Behavioral;

