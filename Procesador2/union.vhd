
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity union is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           address : out  STD_LOGIC_VECTOR (31 downto 0));
end union;

architecture Behavioral of union is

	COMPONENT Registro
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

--senales
signal auxdataOut1,auxdataOut2, auxdataSum:std_logic_vector(31 downto 0);
begin

	Inst_Sumador: Sumador PORT MAP(
		In1 => "00000000000000000000000000000001",
		In2 => auxdataOut2,
		Out1 => auxdataSum
	);
	
	Inst_Registro: Registro PORT MAP(
		clk => clk,
		rst => rst,
		dataIn => auxdataSum,
		dataOut => auxdataOut1
	);
	
	Inst_Registro2: Registro PORT MAP(
		clk => clk,
		rst => rst,
		dataIn => auxdataOut1,
		dataOut => auxdataOut2
	);
	

	
	address <= auxdataOut2;

end Behavioral;

