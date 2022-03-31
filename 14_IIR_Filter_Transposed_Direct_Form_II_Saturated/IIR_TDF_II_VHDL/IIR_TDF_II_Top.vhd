library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IIR_TDF_II_Top is

    Port ( 
				Clock 			: in  STD_LOGIC;
				Input_Signal 	: in  signed (13 downto 0);
				Output_Signal	: out	signed (13 downto 0)
				);
				
end IIR_TDF_II_Top;
	 
architecture Behavioral of IIR_TDF_II_Top is

	------	Internal signal for buffering the input and output ports.
	signal	Input_Signal_Int			:	signed (13 downto 0)		:=	(others=>'0');
	signal	Output_Signal_Int			:	signed (14 downto 0)		:=	(others=>'0');
	signal	Output_Signal_Saturated	:	signed (13 downto 0)		:=	(others=>'0');
	
	------	Delay Accumulator registers.
	signal	Delay_Accumulator_D1		:	signed (31 downto 0)		:=	(others=>'0');
	signal	Delay_Accumulator_D2		:	signed (31 downto 0)		:=	(others=>'0');
	signal	Delay_Accumulator_D3		:	signed (31 downto 0)		:=	(others=>'0');
	signal	Delay_Accumulator_D4		:	signed (31 downto 0)		:=	(others=>'0');
	
	------	Feed-Forward Coefficient constants.
	Constant	Coeff_b0						:	signed (16 downto 0)		:=	to_signed(44,17);
	Constant	Coeff_b1						:	signed (16 downto 0)		:=	to_signed(-12,17);
	Constant	Coeff_b2						:	signed (16 downto 0)		:=	to_signed(59,17);
	Constant	Coeff_b3						:	signed (16 downto 0)		:=	to_signed(-12,17);
	Constant	Coeff_b4						:	signed (16 downto 0)		:=	to_signed(44,17);

	------	Feed-Back Coefficient constants.
	Constant	Coeff_a1						:	signed (16 downto 0)		:=	to_signed(51730,17);
	Constant	Coeff_a2						:	signed (16 downto 0)		:=	to_signed(-62420,17);
	Constant	Coeff_a3						:	signed (16 downto 0)		:=	to_signed(33962,17);
	Constant	Coeff_a4						:	signed (16 downto 0)		:=	to_signed(-7013,17);

	signal	Output_Accumulator		:	signed (31 downto 0)		:=	(others=>'0');
		
begin

	Output_Accumulator						<=	Coeff_b0 * Input_Signal_Int + Delay_Accumulator_D1;
	Output_Signal_Int							<=	Output_Accumulator(28 downto 14);
	
	--	Wrap around
--	Output_Signal								<=	Output_Accumulator(27 downto 14);
	
	-- Saturation
	Output_Signal								<=	Output_Signal_Saturated;
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			-- Input signal buffering
			Input_Signal_Int					<=	Input_Signal;
						
			-- IIR multiply and accumulate
			Delay_Accumulator_D4				<=	Coeff_b4 * Input_Signal_Int + Coeff_a4 * Output_Signal_Int;
			Delay_Accumulator_D3				<=	Coeff_b3 * Input_Signal_Int + Coeff_a3 * Output_Signal_Int + Delay_Accumulator_D4;
			Delay_Accumulator_D2				<=	Coeff_b2 * Input_Signal_Int + Coeff_a2 * Output_Signal_Int + Delay_Accumulator_D3;
			Delay_Accumulator_D1				<=	Coeff_b1 * Input_Signal_Int + Coeff_a1 * Output_Signal_Int + Delay_Accumulator_D2;
			
			-- Overflow control
			Output_Signal_Saturated 		<= Output_Signal_Int(13 downto 0); 
			
			if (Output_Signal_Int(14) = '0' and Output_Signal_Int(13) = '1') then 
				 Output_Signal_Saturated	<= to_signed(8191,14); 
			end if; 

			if (Output_Signal_Int(14) = '1' and Output_Signal_Int(13) = '0') then 
				 Output_Signal_Saturated   <= to_signed(-8192,14); 
			end if;
			
		end if;
	
	end process;

end Behavioral;