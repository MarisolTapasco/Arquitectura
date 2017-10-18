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
    Port ( Aluop: in STD_LOGIC_VECTOR (5 downto 0);
	        op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
process (Aluop,op1,op2)

begin
	case Aluop is 
	 
	 when "000000" =>
	  result <= std_logic_vector(unsigned(op1) + unsigned(op2))  ;   --ADD
	
	 when "000001" =>
	  result <= op1 AND op2;		                                   --AND
	
	 when "000010" =>
	  result <= op1 OR op2;				                                --OR
	
	 when "000011" =>
	  result <= op1 XOR op2;				                             --XOR
	
	 when "000100" =>
	  result <= std_logic_vector(unsigned(op1) - unsigned(op2)) ;	  --SUB
	
	 when "000101" =>
	  result <= op1 NAND op2;				                          --NAND

	 when "000110" =>
	  result <= op1 NOR op2;		                                          --NOR
	
	 when "000111" =>
	  result <= op1 XNOR op2 ;				                             --XNOR	
	
	 when others =>
	  result <="00000000000000000000000000000000";

	 
	end case;
end process;
end Behavioral;

