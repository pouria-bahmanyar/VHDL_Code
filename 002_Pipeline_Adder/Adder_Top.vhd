library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_Top is
    Port ( 
				Clock 	: in  STD_LOGIC;
				X 			: in  unsigned (30 downto 0);
				Y 			: in  unsigned (30 downto 0);
				S 			: out unsigned (30 downto 0)
			);
end Adder_Top;

architecture Behavioral of Adder_Top is

	signal	X_L			:	unsigned (14 downto 0)		:=	(others=>'0');
	signal	X_M			:	unsigned (15 downto 0)		:=	(others=>'0');
	signal	Y_L			:	unsigned (14 downto 0)		:=	(others=>'0');
	signal	Y_M			:	unsigned (15 downto 0)		:=	(others=>'0');
	signal	S_L_Int		:	unsigned (15 downto 0)		:=	(others=>'0');
	signal	S_M_Int		:	unsigned (15 downto 0)		:=	(others=>'0');
	signal	S_L			:	unsigned (14 downto 0)		:=	(others=>'0');
	signal	S_M			:	unsigned (16 downto 0)		:=	(others=>'0');
	
begin

	process(Clock)
	begin
		if rising_edge(Clock) then
			
			X_L					<=	X(14 downto 0);		
			X_M					<=	X(30 downto 15);		
			Y_L					<=	Y(14 downto 0);		
			Y_M					<=	Y(30 downto 15);		
		
			S_L_Int				<=	resize(X_L,16) + Y_L;
			S_M_Int				<=	X_M + Y_M;
			
			S_L					<=	S_L_Int(14 downto 0);
			S_M					<=	S_M_Int&S_L_Int(15) + 1;
			
			S						<=	S_M(16 downto 1) & S_L;
		
		end if;
	end process;
end Behavioral;