--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:54:14 10/06/2017
-- Design Name:   
-- Module Name:   D:/lab digital/Union_RS/UnionTb.vhd
-- Project Name:  Union_RS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: union
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
 
ENTITY UnionTb IS
END UnionTb;
 
ARCHITECTURE behavior OF UnionTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT union
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         address : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal address : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: union PORT MAP (
          rst => rst,
          clk => clk,
          address => address
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <= '1';
      wait for 20 ns;	
      rst <= '0';
		wait for 20 ns;	
      rst <= '0';
		wait for 20 ns;
		rst <= '1';
		wait for 20 ns;
		rst <= '0';
		wait for 20 ns;
		rst <= '0';
		wait for 20 ns;
		rst <= '1';
		wait for 50 ns;
		rst <= '0';
		wait for 50 ns;
		rst <= '0';
		wait for 20 ns;
		rst <= '1';
		wait for 10 ns;
		rst <= '0';
		wait for 50 ns;
		rst <= '0';			
      

      -- insert stimulus here 

      wait;
   end process;

END;
