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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  c: in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0);
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	process(op1,op2,Aluop)
	begin
	case (Aluop) is
                  when "000000" => -- add 
								result <= op1 + op2;
                  when "000001" =>--AND
								result <= op1 and op2;
						when "000010" =>--OR
								result <= op1 or op2;
						when "000011" =>--xor
								result <= op1 xor op2;
						when "000111" =>--xnor
								result <= op1 xnor op2;
						when  "000100"=>--Sub
								result <= op1 - op2;
						when "000101"=>--and not
								result<=op1 and not op2;
						when "000110"=>--nor
								result<= op1 or not op2;
								
						when "010000"=>--addcc
								result <= op1 + op2;
						when "010100"=>--subcc
								result <= op1 - op2;
						when "010001" =>--andcc
								result<= op1 and op2;
						when "010101" =>--andncc
								result<= op1 and not op2;
						when "010010" => --orcc
								result <= op1 or op2;
						when "010110" =>--orncc
								result <= op1 or not op2;
						when "001000"=>--addx
								result <= op1 + op2 + c;
						when "011000" =>--addxcc
								result <= op1 + op2 + c;
						when "001100" => --subx
								result <= op1- op2 - c;
						when "011100" => --subxcc
								result <= op1 - op2 - c;
								
						when "010011" => --xorcc
								result <=  op1 xor op2;
							when "010111" => --xnorcc
								result <=  op1 xor op2;		
						when "100101" => --sll
								result <= to_stdlogicvector(to_bitvector(op1) sll conv_integer(op2));
						
						when "100110" => --srl
								result <= to_stdlogicvector(to_bitvector(op1) srl conv_integer(op2));		
						
						when "111100" => --save
								result <= op1 + op2;
						
						when "111101" => --restore
								result <= op1 + op2;
						when "011011" => -- jmpl
							result <=op1 + op2;
							
						when "111110" => --st y --ld
							result <= op1 + op2;
						when others => --nops
				          result<= x"00000000";
	
				end case;	
	  end process; 
end Behavioral;


