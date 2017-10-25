
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RegistroTB IS
END RegistroTB;
 
ARCHITECTURE behavior OF RegistroTB IS 

 
    COMPONENT Registro
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         dataIn : IN  std_logic_vector(31 downto 0);
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal dataIn : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Registro PORT MAP (
          clk => clk,
          rst => rst,
          dataIn => dataIn,
          dataOut => dataOut
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
		wait for 10 ns;
		rst <= '0';
		dataIn <="00000000000000000000000000000000";
		wait for 10 ns;
		rst <= '0';
		dataIn <="00000001111111111000000000000000";
		wait for 10 ns;
		rst <= '1';
		dataIn <="00001100000000000000111111000000";
		wait for 10 ns;
		rst <= '0';
		dataIn <="11100000000000011100000000110000";
		wait for 10 ns;
		rst <= '0';
		dataIn <="00011111110000001111100000000000";
		
   end process;

END;
