library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MAF_Top is

    Port ( 
				Clock 			: in  STD_LOGIC;
				Input_Signal 	: in  signed (13 downto 0);
				Output_Signal	: out	signed (13 downto 0)
				);
				
end MAF_Top;

architecture Behavioral of MAF_Top is

	------	Internal signal for buffering the input and output ports.
	signal	Input_Signal_Int		:	signed (13 downto 0)		:=	(others=>'0');
	signal	Output_Signal_Int		:	signed (13 downto 0)		:=	(others=>'0');
	
	------	Delay line registers.
	signal	Input_Signal_D1		:	signed (13 downto 0)		:=	(others=>'0');
	signal	Input_Signal_D2		:	signed (13 downto 0)		:=	(others=>'0');
	signal	Input_Signal_D3		:	signed (13 downto 0)		:=	(others=>'0');
	signal	Input_Signal_D4		:	signed (13 downto 0)		:=	(others=>'0');
		
	signal	MAF_Accumulator		:	signed (15 downto 0)		:=	(others=>'0');
	
begin

	Output_Signal						<=	Output_Signal_Int;
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			-- Input signal buffering
			Input_Signal_Int			<=	Input_Signal;
			
			-- MAF delay line
			Input_Signal_D1			<=	Input_Signal_Int;
			Input_Signal_D2			<=	Input_Signal_D1;
			Input_Signal_D3			<=	Input_Signal_D2;
			Input_Signal_D4			<=	Input_Signal_D3;
			
			-- MAF accumulator
			MAF_Accumulator			<=	MAF_Accumulator + Input_Signal_Int - Input_Signal_D4;
			
			Output_Signal_Int			<=	MAF_Accumulator(15 downto 2);
						
		end if;
	
	end process;

end Behavioral;

