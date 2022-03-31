library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_4bit is
    Port ( 
			  A   : in   STD_LOGIC_VECTOR (3 downto 0);
           B   : in   STD_LOGIC_VECTOR (3 downto 0);
           Cin : in   STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           Cou : out  STD_LOGIC
			  );
end Full_Adder_4bit;

architecture Behavioral of Full_Adder_4bit is
-------------------------------------------
--Deleration & Signals

	signal C_int: std_logic_vector (2 downto 0) := "000";
	COMPONENT Full_Adder
	PORT(
		A	 	: IN std_logic;
		B	 	: IN std_logic;
		Cin 	: IN std_logic;          
		Cout 	: OUT std_logic;
		Sum 	: OUT std_logic
		);
	END COMPONENT;
-------------------------------------------
begin
-------------------------------------------
--Instantiation
	F0: Full_Adder PORT MAP(
		A	  	=> A(0),
		B    	=> B(0),
		Cin  	=> Cin,
		Cout 	=> C_int(0),
		Sum  	=> Sum(0)
	);

	F1: Full_Adder PORT MAP(
		A	  	=> A(1),
		B    	=> B(1),
		Cin  	=> C_int(0),
		Cout 	=> C_int(1),
		Sum  	=> Sum(1)
	);

	F2: Full_Adder PORT MAP(
		A	  	=> A(2),
		B    	=> B(2),
		Cin  	=> C_int(1),
		Cout 	=> C_int(2),
		Sum  	=> Sum(2)
	);
	
	F3: Full_Adder PORT MAP(
		A	  	=> A(3),
		B    	=> B(3),
		Cin  	=> C_int(2),
		Cout 	=> Cou,
		Sum  	=> Sum(3)
	);
-------------------------------------------

end Behavioral;

