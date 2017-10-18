----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:42:14 10/14/2017 
-- Design Name: 
-- Module Name:    Union2 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Union2 is
    Port ( rest : in  STD_LOGIC;
           registerIn : in  STD_LOGIC_VECTOR (31 downto 0);
           aluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Union2;

architecture Behavioral of Union2 is

	COMPONENT ALU
	PORT(
		Aluop : IN std_logic_vector(5 downto 0);
		op1 : IN std_logic_vector(31 downto 0);
		op2 : IN std_logic_vector(31 downto 0);          
		result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Control_Unit
	PORT(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);          
		Aluop : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT Mux1
	PORT(
		In1 : IN std_logic_vector(31 downto 0);
		In2 : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		outMux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RegisterFile
	PORT(
		rst : IN std_logic;
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		dwr : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		out32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

SIGNAL outAluop: STD_LOGIC_VECTOR(5 downto 0);
SIGNAL outRs1: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL outRs2: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL outMuxx: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL outSeu: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL outResult: STD_LOGIC_VECTOR(31 downto 0);

begin

	Inst_Mux1: Mux1 PORT MAP(
		In1 => outRs2,
		In2 => outSeu,
		i => registerIn(13),
		outMux => outMuxx
	);
	
	Inst_RegisterFile: RegisterFile PORT MAP(
		rst => rest,
		rs1 => registerIn(18 downto 14),
		rs2 => registerIn(4 downto 0),
		rd => registerIn(29 downto 25),
		dwr => outResult,
		crs1 => outRs1,
		crs2 => outRs2
	);
	
	Inst_SEU: SEU PORT MAP(
		imm13 => registerIn(12 downto 0),
		out32 => outSeu
	);

	Inst_ALU: ALU PORT MAP(
		Aluop => outAluop,
		op1 => outRs1,
		op2 => outMuxx,
		result => outResult
	);
	
	Inst_Control_Unit: Control_Unit PORT MAP(
		Op => registerIn(31 downto 30),
		Op3 => registerIn(24 downto 19),
		Aluop => outAluop
	);
	aluResult<=outResult;

end Behavioral;
