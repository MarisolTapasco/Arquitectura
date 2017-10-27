
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Control_Unit is
    Port ( Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Op : in  STD_LOGIC_VECTOR (1 downto 0);
	 
           Aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end Control_Unit;

architecture Behavioral of Control_Unit is

begin
	process(Op, Op3) begin
		case(Op) is
		
			when "10" =>
				if(Op3="000001") then--AND
					Aluop <= "000001";
				end if;
				if(Op3="000010") then--	OR
					Aluop <= "000010";
				end if;
				if(Op3="000011") then--	XOR
					Aluop <= "000011";
				end if;
				if(Op3="000111") then--	XNOR
					Aluop <= "000111";
				end if;
		
				
				if(Op3="000000") then--	ADD
					Aluop <= "000000";
				end if;
				if(Op3="000100") then--	SUB
					Aluop <= "000100";
				end if;
				if(Op3="000101") then--	ANDN
					Aluop <= "000101";
				end if;
					if(Op3="000110") then--	ORN
					Aluop <= "000110";
				end if;
				
			
				--instrucciones con Conditional Codes
				if(Op3="010100") then--SUBcc
					Aluop <= "010100";
				end if;
				if(Op3="010000") then--ADDcc
					Aluop <= "010000";
				end if;
				if(Op3="010001") then--ANDcc
					Aluop <= "010001";
				end if;
				if(Op3="010010") then--ORcc
					Aluop <= "010010";
				end if;
				if(Op3="010101") then--ANDNcc
					Aluop <= "010101";
				end if;
				if(Op3="010110") then--ORNcc
					Aluop <= "010110";
				end if;
				if(Op3="010011") then--XORcc
					Aluop <= "010011";
				end if;
				
				if(Op3="010111") then--XNORcc
					Aluop <= "010111";
				end if;
				
				
				--instrucciones con Carry
				if(Op3="001100") then--SUBX
					Aluop <= "001100";
				end if;
				if(Op3="001000") then--ADDX
					Aluop <= "001000";
				end if;
				
				--instrucciones con carry y Conditional Codes
				if(Op3="011000") then--ADDxcc
					Aluop <= "011000";
				end if;
				
				if(Op3="011100") then--SUBxcc
					Aluop <= "011100";
				end if;
				
				--instrucciones con
				
				if(Op3="100101") then--sll
					Aluop <= "100101";
				end if;
				
				if(Op3="100110") then--slr
					Aluop <= "100110";
				end if; 
			--- instrucciones save y restore
			if(Op3="111100") then--save
					Aluop <= "111100";
				end if; 
			if(Op3="111101") then--restore
					Aluop <= "111101";
				end if; 
		
			--when "11" =>
			when others => Aluop<= "111111";
		end case;
	
	
	end process;

end Behavioral;

