library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity signed_adder is
    Port ( A 		: in   signed (15 downto 0);
           B 		: in   signed (15 downto 0);
           Cin	   : in   signed (0 downto 0);
           Cout 	: out  STD_LOGIC;
           Sum 	: out  signed (15 downto 0));
end signed_adder;

architecture Behavioral of signed_adder is
---------------------------------------------
--Signals & Decleration
	signal Sum_Int : signed (16 downto 0) := (others => '0');
---------------------------------------------
begin
	Sum_Int   <=   resize(A,17) + B +signed('0'&Cin);
	Cout      <=   Sum_Int(16) xor A(15) xor B(15);
	Sum	    <=   Sum_Int(15 downto 0);
end Behavioral;

