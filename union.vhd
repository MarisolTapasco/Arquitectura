
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity union is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end union;

architecture Behavioral of union is

--senales
signal auxdataOut1,auxdataOut2:std_logic_vector(31 downto 0);

begin
	COMPONENT Registro
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		dataIn : IN std_logic_vector(31 downto 0);          
		dataOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Registro2
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		dataIn : IN std_logic_vector(31 downto 0);          
		dataOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Sumador
	PORT(
		In1 : IN std_logic_vector(31 downto 0);
		In2 : IN std_logic_vector(31 downto 0);          
		Out1 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT instruction_memory
	PORT(
		rst : IN std_logic;
		address : IN std_logic_vector(31 downto 0);          
		instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Registro: Registro PORT MAP(
		clk => clk,
		rst => rst,
		dataIn => Out1,
		dataOut => auxdataOut1
	);
	
	Inst_Registro2: Registro PORT MAP(
		clk => clk,
		rst => rst,
		dataIn => auxdataOut1,
		dataOut => auxdataOut2
	);
	
	Inst_Sumador: Sumador PORT MAP(
		In1 => In1,
		In2 => auxdataOut2,
		Out1 => Out1
	);

	Inst_instruction_memory: instruction_memory PORT MAP(
		rst => rst,
		address => auxdataOut2,
		instruction => instruction
	);

end Behavioral;

