
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sumador is
    Port ( In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Out1 : out  STD_LOGIC_VECTOR (31 downto 0));
end Sumador;

architecture Behavioral of Sumador is

begin
	process(In1, In2)
		begin
		Out1 <= In1 + In2;
	end process;

end Behavioral;

