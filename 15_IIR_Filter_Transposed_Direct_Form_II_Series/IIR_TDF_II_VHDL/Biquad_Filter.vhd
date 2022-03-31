library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Biquad_Filter is
	
		Generic (
					------	Feed-Forward Coefficient generics.
					Coeff_b0			:	integer	:=	44;
					Coeff_b1			:	integer	:=	44;
					Coeff_b2			:	integer	:=	44;

					------	Feed-Back Coefficient generics.	
					Coeff_a1			:	integer	:=	44;
					Coeff_a2			:	integer	:=	44				
				);

		Port ( 
					Clock 			: in  STD_LOGIC;
					Input_Signal 	: in  signed (13 downto 0);
					Output_Signal	: out	signed (14 downto 0)
				);
				
end Biquad_Filter;
	 
architecture Behavioral of Biquad_Filter is

	------	Internal signal for buffering the input and output ports.
	signal	Input_Signal_Int		:	signed (13 downto 0)		:=	(others=>'0');
	signal	Output_Signal_Int		:	signed (14 downto 0)		:=	(others=>'0');
	signal	Input_Signal_Scaled	:	signed (26 downto 0)		:=	(others=>'0');
	
	------	Delay Accumulator registers.
	signal	Delay_Accumulator_D1	:	signed (27 downto 0)		:=	(others=>'0');
	signal	Delay_Accumulator_D2	:	signed (27 downto 0)		:=	(others=>'0');
		
	------	Feed-Forward Multiplier Pipeline Registers.
	signal	Multiplier_b0_Pipe	:	signed (26 downto 0)		:=	(others=>'0');
	signal	Multiplier_b1_Pipe	:	signed (26 downto 0)		:=	(others=>'0');
	signal	Multiplier_b2_Pipe	:	signed (26 downto 0)		:=	(others=>'0');
	
	signal	Output_Accumulator	:	signed (27 downto 0)		:=	(others=>'0');
		
begin

	Output_Accumulator				<=	Multiplier_b0_Pipe + Delay_Accumulator_D1;
	Output_Signal_Int					<=	Output_Accumulator(25 downto 11);
	Output_Signal						<=	Output_Signal_Int;
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			-- Input signal buffering
			Input_Signal_Int			<=	Input_Signal;
			
			--	Feed-forward pipeline stage
			Multiplier_b0_Pipe		<=	to_signed(Coeff_b0,13) * Input_Signal_Int;
			Multiplier_b1_Pipe		<=	to_signed(Coeff_b1,13) * Input_Signal_Int;
			Multiplier_b2_Pipe		<=	to_signed(Coeff_b2,13) * Input_Signal_Int;
			
			-- IIR multiply and accumulate
			Delay_Accumulator_D2		<=	Multiplier_b2_Pipe + to_signed(Coeff_a2,13) * Output_Signal_Int;
			Delay_Accumulator_D1		<=	Multiplier_b1_Pipe + to_signed(Coeff_a1,13) * Output_Signal_Int + Delay_Accumulator_D2;
												
		end if;
	
	end process;

end Behavioral;