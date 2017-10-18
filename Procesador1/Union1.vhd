
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Union1 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end Union1;

architecture Behavioral of Union1 is

	COMPONENT union
	PORT(
		  rst : IN std_logic;
		  clk : IN std_logic;          
		  address : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT instruction_memory
	PORT(
		  rst : IN std_logic;
		  address : IN std_logic_vector(31 downto 0);          
		  instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;	
	
signal auxdataAdd: std_logic_vector(31 downto 0):= (others=>'0');
begin

	Inst_union: union PORT MAP(
		rst => rst,
		clk => clk,
		address => auxdataAdd
	);

	Inst_instruction_memory: instruction_memory PORT MAP(
		rst => rst,
		address => auxdataAdd,
		instruction => instruction
	);
	


end Behavioral;

