--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:08:07 10/17/2017
-- Design Name:   
-- Module Name:   D:/info/Documents/Inge Sistemas/Arquitectura de Computadores/PrimerProcesador/tb_RegisterFile.vhd
-- Project Name:  PrimerProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterFile
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
 
ENTITY tb_RegisterFile IS
END tb_RegisterFile;
 
ARCHITECTURE behavior OF tb_RegisterFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         rst : IN  std_logic;
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         dwr : IN  std_logic_vector(31 downto 0);
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          rst => rst,
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          dwr => dwr,
          crs1 => crs1,
          crs2 => crs2
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
			rs1<="00000";
			rs2<="11110";
			rd <="10000";
			dwr<="11111111111111111111111111111110";
			rst<='0';
			
		wait for 50 ns;
			rst <= '0';
		   rs1 <= "00000";
		   rs2 <= "00101";
         rd <= "10001";
			dwr<="00000000000000000000000000000101";
      wait for 50 ns;
		
			rst <= '1';
			rs1 <= "10001";
			rs2 <= "10111";
			rd <= "10011";
			dwr <= "00000000000000000000000001110010";		

      wait;
   end process;

END;
