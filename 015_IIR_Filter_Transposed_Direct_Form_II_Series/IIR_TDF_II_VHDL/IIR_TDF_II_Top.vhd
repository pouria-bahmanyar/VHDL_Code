library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IIR_TDF_II_Top is

    Port ( 
				Clock 			: in  STD_LOGIC;
				Input_Signal 	: in  signed (13 downto 0);
				Output_Signal	: out	signed (14 downto 0)
				);
				
end IIR_TDF_II_Top;
	 
architecture Behavioral of IIR_TDF_II_Top is

	------	Internal signal for buffering the input and output ports.
	signal	Input_Signal_Int		:	signed (13 downto 0)		:=	(others=>'0');
	signal	Output_Signal_Int		:	signed (14 downto 0)		:=	(others=>'0');
	signal	Input_Signal_Scaled	:	signed (26 downto 0)		:=	(others=>'0');
	
	------	Biquad port map signal.
	signal	Biquad_Port_Map		:	signed (14 downto 0)		:=	(others=>'0');
	
	------	Scale Coefficient.
	constant	Scale_Value				:	signed (12 downto 0)		:=	to_signed(11,13);
			
begin
		  
	Inst_Biquad_Filter_1: entity work.Biquad_Filter 
		
		Generic MAP(
						------	Feed-Forward Coefficient generics.
						Coeff_b0				=>	2048,
						Coeff_b1				=>	1422,
						Coeff_b2				=>	2048,

						------	Feed-Back Coefficient generics.	
						Coeff_a1				=>	2984,
						Coeff_a2				=>	-1107						
		)

		PORT MAP(
						Clock 				=> Clock,
						Input_Signal 		=> Input_Signal_Scaled(25 downto 12),
						Output_Signal 		=> Biquad_Port_Map
		);

	Inst_Biquad_Filter_2: entity work.Biquad_Filter 
		
		Generic MAP(
						------	Feed-Forward Coefficient generics.
						Coeff_b0				=>	2048,
						Coeff_b1				=>	-1954,
						Coeff_b2				=>	2048,

						------	Feed-Back Coefficient generics.	
						Coeff_a1				=>	3482,
						Coeff_a2				=>	-1622						
		)

		PORT MAP(
						Clock 				=> Clock,
						Input_Signal 		=> resize(Biquad_Port_Map,14),
						Output_Signal 		=> Output_Signal_Int
		);


	Output_Signal						<=	Output_Signal_Int;
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			-- Input signal buffering
			Input_Signal_Int			<=	Input_Signal;
			Input_Signal_Scaled		<=	Input_Signal_Int * Scale_Value;
															
		end if;
	
	end process;

end Behavioral;