--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:13:07 10/17/2017
-- Design Name:   
-- Module Name:   D:/info/Documents/Inge Sistemas/Arquitectura de Computadores/PrimerProcesador/tb_Control_Unit.vhd
-- Project Name:  PrimerProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Control_Unit
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
 
ENTITY tb_Control_Unit IS
END tb_Control_Unit;
 
ARCHITECTURE behavior OF tb_Control_Unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control_Unit
    PORT(
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         Aluop : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Aluop : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control_Unit PORT MAP (
          Op => Op,
          Op3 => Op3,
          Aluop => Aluop
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
       Op <="10";
		 Op3<="000000";
      wait for 20 ns;
       Op <="10";
		 Op3<="000001";
      wait for 20 ns;
       Op <="10";
		 Op3<="000010";
      wait for 20 ns;
       Op <="10";
		 Op3<="000011";
      wait for 20 ns;
       Op <="10";
		 Op3<="000100";
      wait for 20 ns;
       Op <="10";
		 Op3<="000101";
      wait for 20 ns;
       Op <="10";
		 Op3<="000110";
      wait for 20 ns;
       Op <="10";
		 Op3<="000111";
      wait for 20 ns;		
      -- insert stimulus here 

      wait;
   end process;

END;
