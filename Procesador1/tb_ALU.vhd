--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:20:08 10/17/2017
-- Design Name:   
-- Module Name:   D:/info/Documents/Inge Sistemas/Arquitectura de Computadores/PrimerProcesador/tb_ALU.vhd
-- Project Name:  PrimerProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Aluop : IN  std_logic_vector(5 downto 0);
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Aluop : std_logic_vector(5 downto 0) := (others => '0');
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Aluop => Aluop,
          op1 => op1,
          op2 => op2,
          result => result
        );

   -- Stimulus process
   stim_proc: process
   begin		
        Aluop <="000000";
		  op1 <= "00000000000000000000000000000000"; -- 0
        op2 <= "11111111111111111111111111111110"; -- -2
      wait for 20 ns;	
        Aluop <="000001";
		  op1 <= "00000000000000000000000000000000"; -- 0
        op2 <= "11111111111111111111111111111110"; -- -2
      wait for 20 ns;
        Aluop <="000010";
		  op1 <= "00000000000000000000000000000000"; -- 0
        op2 <= "11111111111111111111111111111110"; -- -2
      wait for 20 ns;
        Aluop <="000011";
		  op1 <= "00000000000000000000000000000000"; -- 0
        op2 <= "11111111111111111111111111111110"; -- -2
      wait for 20 ns;
        Aluop <="000100";
		  op1 <= "00000000000000000000000000000000"; -- 0
        op2 <= "11111111111111111111111111111110"; -- -2
      wait for 20 ns;
        Aluop <="000101";
		  op1 <= "00000000000000000000000000000000"; -- 0
        op2 <= "11111111111111111111111111111110"; -- -2
      wait for 20 ns;
        Aluop <="000110";
		  op1 <= "00000000000000000000000000000000"; -- 0
        op2 <= "11111111111111111111111111111110"; -- -2
      wait for 20 ns;
        Aluop <="000111";
		  op1 <= "00000000000000000000000000000000"; -- 0
        op2 <= "11111111111111111111111111111110"; -- -2
      wait for 20 ns;		
      -- insert stimulus here 

      wait;
   end process;

END;
