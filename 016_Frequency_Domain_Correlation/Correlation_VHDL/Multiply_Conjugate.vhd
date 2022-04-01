library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiply_Conjugate is
    Port ( 
				Clock 	: in  STD_LOGIC;
				X_Real 	: in  signed (15 downto 0);
				X_Imag 	: in  signed (15 downto 0);
				Y_Real 	: in  signed (15 downto 0);
				Y_Imag 	: in  signed (15 downto 0);
				F_Real 	: out signed (24 downto 0);
				F_Imag 	: out signed (24 downto 0)
			);
end Multiply_Conjugate;

architecture Behavioral of Multiply_Conjugate is

	signal	X_Real_Int		:	signed (15 downto 0)		:=	(others=>'0');
	signal	X_Imag_Int		:	signed (15 downto 0)		:=	(others=>'0');
	signal	Y_Real_Int		:	signed (15 downto 0)		:=	(others=>'0');
	signal	Y_Imag_Int		:	signed (15 downto 0)		:=	(others=>'0');
	
	signal	F_Real_P1		:	signed (31 downto 0)		:=	(others=>'0');
	signal	F_Real_P2		:	signed (31 downto 0)		:=	(others=>'0');
	signal	F_Imag_P1		:	signed (31 downto 0)		:=	(others=>'0');
	signal	F_Imag_P2		:	signed (31 downto 0)		:=	(others=>'0');
	
	signal	F_Real_Int		:	signed (32 downto 0)		:=	(others=>'0');
	signal	F_Imag_Int		:	signed (32 downto 0)		:=	(others=>'0');

begin

	F_Real							<=	F_Real_Int(31 downto 7);
	F_Imag							<=	F_Imag_Int(31 downto 7);
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			X_Real_Int				<=	X_Real;
			X_Imag_Int				<=	X_Imag;
			Y_Real_Int				<=	Y_Real;
			Y_Imag_Int				<=	Y_Imag;
			
			F_Real_P1				<=	X_Real_Int * Y_Real_Int;
			F_Real_P2				<=	X_Imag_Int * Y_Imag_Int;
			F_Imag_P1				<=	X_Imag_Int * Y_Real_Int;
			F_Imag_P2				<=	X_Real_Int * Y_Imag_Int;
			
			F_Real_Int				<= resize(F_Real_P1,33) + F_Real_P2;
			F_Imag_Int				<= resize(F_Imag_P1,33) - F_Imag_P2;
		
		end if;
	
	end process;

end Behavioral;