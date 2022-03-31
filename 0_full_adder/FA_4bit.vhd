----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:47:10 09/01/2021 
-- Design Name: 
-- Module Name:    FA_4bit - Behavioral 
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

entity FA_4bit is
    Port ( A     : in   STD_LOGIC_VECTOR (3 downto 0);
           B     : in   STD_LOGIC_VECTOR (3 downto 0);
           Cin   : in   STD_LOGIC;
           Cout  : out  STD_LOGIC;
           sum   : out  STD_LOGIC_VECTOR (3 downto 0));
end FA_4bit;

architecture Behavioral of FA_4bit is

	COMPONENT full_adder
	PORT(
		A     : IN     std_logic;
		B     : IN     std_logic;
		Cin   : IN     std_logic;          
		Cout  : OUT    std_logic;
		SUM   : OUT    std_logic
		);
	END COMPONENT;

   signal C_int : std_logic_vector (2 downto 0) := "000";

begin

		F0: full_adder PORT MAP(
		A =>A(0) ,
		B =>B(0) ,
		Cin => Cin,
		Cout => C_int(0) ,
		SUM =>Sum(0) 
	           );
				  
				  
      F1: full_adder PORT MAP(
		A =>A(1),
		B =>B(1) ,
		Cin => C_int(0) ,
		Cout => C_int(1),
		SUM => sum(1)
	           );
				  
				  
      F2: full_adder PORT MAP(
		A =>A(2) ,
		B =>B(2) ,
		Cin => C_int(1) ,
		Cout => C_int(2),
		SUM =>sum(2) 
	           );
				  
				  
      F3: full_adder PORT MAP(
		A =>A(3),
		B =>B(3) ,
		Cin => C_int(2) ,
		Cout => Cout,
		SUM =>sum(3) 
	           );
  

end Behavioral;

