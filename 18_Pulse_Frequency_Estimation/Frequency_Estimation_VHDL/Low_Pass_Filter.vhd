library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Low_Pass_Filter is
		generic (
			A_WIDTH												: integer := 14;
			B_WIDTH												: integer := 14
		);

		port (	
		
			Input_Signal										: 	in   	signed(A_WIDTH-1 downto 0);		
			Output_Signal										: 	out  	signed(B_WIDTH-1 downto 0);								
			Output_Int_Out										: 	out	signed(37 downto 0);		
			Clock													:  in 	std_logic
			
		);

end Low_Pass_Filter;

architecture Behavioral of Low_Pass_Filter is


			------ FIR Coefficients 
			type 	Coeff_1 is array (0 to 4) of signed	(17 downto 0);
			constant 	Coeff_b									: Coeff_1 :=
			(	to_signed(29360,18),
				to_signed(55575,18),
				to_signed(74449,18),
				to_signed(55575,18),
				to_signed(29360,18)
			);
			--	B  = [0.028   0.053   0.071   0.053   0.028];
						
			------ IIR Coefficients ---- (Feed Backs)		(S.2.15 bits)--------------------
			type 	Coeff_2 is array (0 to 4) of signed	(17 downto 0);
			constant 	Coeff_a									: Coeff_2:=
			(	to_signed(32768,18),
				to_signed(-66388,18),
				to_signed(70386,18),
				to_signed(-37978,18),
				to_signed(9142,18)
			);
			--	A  = [1.0000   -2.0260    2.1480   -1.1590    0.2790];


			------- Delay Signals ---------			
			signal 	Input_Signal_Int0						: 	signed(34 downto 0):=(others=>'0'); 		
			signal 	Input_Signal_Int1						: 	signed(34 downto 0):=(others=>'0'); 		
			signal 	Input_Signal_Int2						: 	signed(34 downto 0):=(others=>'0'); 		
			signal 	Input_Signal_Int3						: 	signed(34 downto 0):=(others=>'0'); 	
			signal 	Input_Signal_Int3_1					: 	signed(35+7-1 downto 0):=(others=>'0'); 		
			signal 	Input_Signal_Int3_2					: 	signed(35+7-1 downto 0):=(others=>'0'); 	
	
			signal 	Input_Signal_D0						: 	signed(23 downto 0):=(others=>'0');		
			signal   Input_Signal_D1						: 	signed(23 downto 0):=(others=>'0'); 		
			signal   Input_Signal_D2						: 	signed(23 downto 0):=(others=>'0'); 	
			signal   Input_Signal_D3						: 	signed(23 downto 0):=(others=>'0'); 		
			signal   Input_Signal_D4						: 	signed(23 downto 0):=(others=>'0'); 		
	
			-------- Multiplying Interference Signals ------	
			signal   Mul_Result_FF_0						: 	signed(35+7-1 downto 0):=(others=>'0'); 		
			signal   Mul_Result_FF_1						: 	signed(35+7-1 downto 0):=(others=>'0'); 		
			signal   Mul_Result_FF_2						: 	signed(35+7-1 downto 0):=(others=>'0'); 	
			signal   Mul_Result_FF_3						: 	signed(35+7-1 downto 0):=(others=>'0'); 		
			signal   Mul_Result_FF_4						: 	signed(35+7-1 downto 0):=(others=>'0'); 		
	
			signal 	Output_Int								: 	signed(37 downto 0):=(others=>'0');	
			signal	Output_Int2								: 	signed(B_WIDTH-1 downto 0);			

begin

				Output_Int_Out					<= 	Output_Int;
				---- 1: Input Signal of Delay Line -----
				Input_Signal_Int0 			<= 	resize(Input_Signal,35);
				Input_Signal_Int1				<=		shift_left(Input_Signal_Int0,15);
		
				Input_Signal_Int2				<=		Input_Signal_Int1 - Input_Signal_Int3_1(35+7-1 downto 7) - Input_Signal_Int3_2(35+7-1 downto 7);

				Input_Signal_D0				<=		Input_Signal_Int2(23+15-7 downto 15-7);
				
				--- 2: Output Signal (Feed Forward)
				Output_Int						<=		resize(Mul_Result_FF_0(35+7-1 downto 7), 38) + resize(Mul_Result_FF_1(35+7-1 downto 7), 38) + resize(Mul_Result_FF_2(35+7-1 downto 7), 38) + resize(Mul_Result_FF_3(35+7-1 downto 7), 38) + resize(Mul_Result_FF_4(35+7-1 downto 7), 38);
				
				-- Output Saturation
				Output_Int2						<=		"01111111111111"	when (Output_Int(37 downto 37-4)>= "00001") else
															"10000000000000"	when (Output_Int(37 downto 37-4)<  "11111") else
															Output_Int(37-4 downto 37-4-(B_WIDTH-1));
				Output_Signal					<=		Output_Int2;

Main_Part:	process(Clock)				
	begin	
		if rising_edge(Clock) then		

				--------- Generating Delay Signals --------
				Input_Signal_D1 	<= Input_Signal_D0;
				Input_Signal_D2	<=	Input_Signal_D1;
				Input_Signal_D3	<=	Input_Signal_D2;
				Input_Signal_D4	<=	Input_Signal_D3;

				--------- Multiplying Signals --------
				-- 1: Feed Forwards --
				Mul_Result_FF_0		<=	Input_Signal_D0 * Coeff_b(0);
				Mul_Result_FF_1		<=	Input_Signal_D1 * Coeff_b(1);
				Mul_Result_FF_2		<=	Input_Signal_D2 * Coeff_b(2);
				Mul_Result_FF_3		<=	Input_Signal_D3 * Coeff_b(3);
				Mul_Result_FF_4		<=	Input_Signal_D4 * Coeff_b(4);

				-- 2: Calculating the Feedbacks ----
				Input_Signal_Int3_1	<=	Input_Signal_D0 * Coeff_a(1) + Input_Signal_D1 * Coeff_a(2);
				Input_Signal_Int3_2	<=	Input_Signal_D2 * Coeff_a(3) + Input_Signal_D3 * Coeff_a(4);

		end if;
	end process;

end Behavioral;
