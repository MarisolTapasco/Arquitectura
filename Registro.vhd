
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           dataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Registro;

architecture Behavioral of Registro is

begin
	process(clk, rst, dataIn)
		begin
			if (rst = '1')then
				dataOut <= "00000000000000000000000000000000";
			elsif rising_edge(clk) then
				dataOut <= dataIn;
			end if;
	end process;
end Behavioral;