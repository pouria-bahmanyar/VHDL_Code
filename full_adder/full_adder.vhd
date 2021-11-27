
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Full_Adder is
    Port ( 
			  A      : in   STD_LOGIC;
           B      : in   STD_LOGIC;
           Cin    : in   STD_LOGIC;
           Cout   : out  STD_LOGIC;
           Sum 	: out  STD_LOGIC
			  );
end Full_Adder;

architecture Behavioral of Full_Adder is

begin

	Sum  <= A xor B xor Cin;
	Cout <= (A and B) or (A and Cin) or (B or Cin);

end Behavioral;

