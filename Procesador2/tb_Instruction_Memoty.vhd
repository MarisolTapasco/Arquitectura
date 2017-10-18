--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:59:25 10/17/2017
-- Design Name:   
-- Module Name:   D:/info/Documents/Inge Sistemas/Arquitectura de Computadores/PrimerProcesador/tb_Instruction_Memoty.vhd
-- Project Name:  PrimerProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instruction_memory
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
 
ENTITY tb_Instruction_Memoty IS
END tb_Instruction_Memoty;
 
ARCHITECTURE behavior OF tb_Instruction_Memoty IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instruction_memory
    PORT(
         rst : IN  std_logic;
         address : IN  std_logic_vector(31 downto 0);
         instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal address : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal instruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instruction_memory PORT MAP (
          rst => rst,
          address => address,
          instruction => instruction
        );


   -- Stimulus process
   stim_proc: process
   begin		
      address <= "00000000000000000000000000000000";
		rst <= '1';
		
      wait for 100 ns;	
		
		address <= "00000000000000000000000000000000";
		rst <= '0';
		
      wait for 100 ns;	
		
		address <= "00000000000000000000000000000001";
		rst <= '0';
		
      wait for 100 ns; 

      wait;
   end process;

END;
