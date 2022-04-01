library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FIR_DF_Top is

    Port ( 
				Clock 			: in  STD_LOGIC;
				Input_Signal 	: in  signed (13 downto 0);
				Output_Signal	: out	signed (13 downto 0)
				);
				
end FIR_DF_Top;

architecture Behavioral of FIR_DF_Top is

	------	Internal signal for buffering the input and output ports.
	signal	Input_Signal_Int		:	signed (13 downto 0)		:=	(others=>'0');
	signal	Output_Signal_Int		:	signed (13 downto 0)		:=	(others=>'0');
	
	------	Delay line registers.
	signal	Input_Signal_D1		:	signed (13 downto 0)		:=	(others=>'0');
	signal	Input_Signal_D2		:	signed (13 downto 0)		:=	(others=>'0');
	signal	Input_Signal_D3		:	signed (13 downto 0)		:=	(others=>'0');
		
	signal	Product_Reg0			:	signed (23 downto 0)		:=	(others=>'0');
	signal	Product_Reg1			:	signed (23 downto 0)		:=	(others=>'0');
	
	------	Coefficient constants.
	Constant	Coeff_b0					:	signed (8 downto 0)		:=	to_signed(31,9);
	Constant	Coeff_b1					:	signed (8 downto 0)		:=	to_signed(87,9);
	Constant	Coeff_b2					:	signed (8 downto 0)		:=	to_signed(87,9);
	Constant	Coeff_b3					:	signed (8 downto 0)		:=	to_signed(31,9);
	
	signal	FIR_Accumulator		:	signed (23 downto 0)		:=	(others=>'0');
	
begin

	Output_Signal						<=	Output_Signal_Int;
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			-- Input signal buffering
			Input_Signal_Int			<=	Input_Signal;
			
			-- FIR delay line
			Input_Signal_D1			<=	Input_Signal_Int;
			Input_Signal_D2			<=	Input_Signal_D1;
			Input_Signal_D3			<=	Input_Signal_D2;
			
			Product_Reg0				<=	Coeff_b0 * (resize(Input_Signal_Int,15) + Input_Signal_D3);
			Product_Reg1				<=	Coeff_b1 * (resize(Input_Signal_D1,15) + Input_Signal_D2);
			
			-- FIR multiply and accumulate
			FIR_Accumulator			<=	Product_Reg0 + 
												Product_Reg1;
			
			Output_Signal_Int			<=	FIR_Accumulator(21 downto 8);
						
		end if;
	
	end process;

end Behavioral;

