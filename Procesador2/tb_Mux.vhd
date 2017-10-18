--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:30:27 10/17/2017
-- Design Name:   
-- Module Name:   D:/info/Documents/Inge Sistemas/Arquitectura de Computadores/PrimerProcesador/tb_Mux.vhd
-- Project Name:  PrimerProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux1
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
 
ENTITY tb_Mux IS
END tb_Mux;
 
ARCHITECTURE behavior OF tb_Mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux1
    PORT(
         In1 : IN  std_logic_vector(31 downto 0);
         In2 : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         outMux : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal In1 : std_logic_vector(31 downto 0) := (others => '0');
   signal In2 : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal outMux : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux1 PORT MAP (
          In1 => In1,
          In2 => In2,
          i => i,
          outMux => outMux
        );
 
   stim_proc: process    
	begin 	 
			i<= '0'; 	 
			In1 <= "00000000000000000000000000000000"; 	 
			In2  <= "11111111111111111111111111111111";     
		wait for 20 ns;	 	 
			i<= '1';
			In1 <= "00000000000000000000000000000000";
			In2   <= "11111111111111111111111111111111";
		wait for 20 ns; 	 
			i<= '0'; 	 
			In1 <= "00000000000000000111111111111111"; 	 
			In2   <= "11111111111111111110000000000000";     
		wait for 20 ns;     
		   i<= '1'; 	 
			In1  <= "00000000000000000111111111111111"; 	 
			In2   <= "11111111111111111110000000000000";
		wait for 20 ns;

      wait;
   end process;

END;
