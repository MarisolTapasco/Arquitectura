----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:35 09/29/2017 
-- Design Name: 
-- Module Name:    instruction_memory - Behavioral 
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

entity instruction_memory is
    Port ( rst : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (31 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is
type memoria_rom is array (0 to 63) of std_logic_vector (31 downto 0);
    signal ROM : memoria_rom := (X"A0102004",X"A2103FF8",X"A4040011",X"9024A02B",
	                              X"B0102004",X"C2103FF8",X"D4040011",X"E024A02B",
	                              X"AB102004",X"B2103FF8",X"A4040011",X"9024A02B",
	                              X"AC102004",X"C2103FF8",X"A4020011",X"1024A02B",
											X"AD102004",X"A2D03FF8",X"44040011",X"2024A02B",
											X"AE102004",X"A21E3FF8",X"A4040051",X"3024A02B",
											X"AF102004",X"A21A3FF8",X"A4040031",X"4024A02B",
											X"B0202004",X"A21C3FF8",X"A4040021",X"5024A02B");
begin
    process (rst)
          if (rst = '1') then
               instruction <="00000000000000000000000000000000";
		 else
			instruction <= ROM(conv_integer(address));
          end if;
    end process;
end Behavioral;


