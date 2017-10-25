
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end Control_Unit;

architecture Behavioral of Control_Unit is

--Op3:
--"000001" AND
--"000101" NAND
--"000010" OR
--"000110" NOR
--"000011" XOR
--"000111" XNOR
--"000000" ADD
--"000100" SUB

begin

process(Op,Op3)
begin
	if(Op = "10")then
		case Op3 is
			when "000001" => Aluop <= "000001";
			when "000101" => Aluop <= "000101";
			when "000010" => Aluop <= "000010";
			when "000110" => Aluop <= "000110";
			when "000011" => Aluop <= "000011";
			when "000111" => Aluop <= "000111";
			when "000000" => Aluop <= "000000";
			when "000100" => Aluop <= "000100";
			when "100101" => ALUOP <= "100101"; 
			when "100110" => ALUOP <= "100110"; 
			when "010000" => ALUOP <= "010000"; 
			when "010100" => ALUOP <= "010100"; 
			when "010001" => ALUOP <= "010001"; 
			when "010101" => ALUOP <= "010101"; 
			when "010010" => ALUOP <= "010010"; 
			when "010110" => ALUOP <= "010110"; 
			when "010011" => ALUOP <= "010011"; 
			when "010111" => ALUOP <= "010111"; 
			when "001000" => ALUOP <= "001000"; 
			when "001100" => ALUOP <= "001100"; 
			when "011000" => ALUOP <= "011000"; 
			when "011100" => ALUOP <= "011100"; 
			when "111101" => ALUOP <= "000000"; 
			when "111100" => ALUOP <= "000100"; 
			when others => Aluop <= "111111";
		end case;
	end if;
end process;			

end Behavioral;

