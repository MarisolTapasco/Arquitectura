--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:31:59 10/17/2017
-- Design Name:   
-- Module Name:   D:/info/Documents/Inge Sistemas/Arquitectura de Computadores/PrimerProcesador/tb_Union2.vhd
-- Project Name:  PrimerProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Union2
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
 
ENTITY tb_Union2 IS
END tb_Union2;
 
ARCHITECTURE behavior OF tb_Union2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Union2
    PORT(
         rest : IN  std_logic;
         registerIn : IN  std_logic_vector(31 downto 0);
         aluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rest : std_logic := '0';
   signal registerIn : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal aluResult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Union2 PORT MAP (
          rest => rest,
          registerIn => registerIn,
          aluResult => aluResult
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
			rest <='0';
			registerIn <="10000010000000000010000000001000";
      wait for 100 ns;
			rest <='0';
			registerIn <="10000010000100000010000000001000";
      wait for 100 ns;
			rest <='0';
			registerIn <="10000100000100000011111111111001";
      wait for 100 ns;	
			rest <='1';
			registerIn <="10000010000100000010000000001000";
      wait for 100 ns;
			rest <='0';
			registerIn <="10000100000100000011111111111001";
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
