----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:28:15 10/15/2017 
-- Design Name: 
-- Module Name:    Procesador - Behavioral 
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

entity Procesador is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador;

architecture Behavioral of Procesador is

	COMPONENT Union1
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;          
		instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Union2
	PORT(
		rst : IN std_logic;
		registerIn : IN std_logic_vector(31 downto 0);          
		aluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
SIGNAL outReg: STD_LOGIC_VECTOR(31 downto 0);

begin

	Inst_Union2: Union2 PORT MAP(
		rst => rst,
		registerIn => outReg,
		aluResult => result
	);
	
	Inst_Union1: Union1 PORT MAP(
		rst => rst,
		clk => clk,
		instruction => outReg
	);
	
end Behavioral;

