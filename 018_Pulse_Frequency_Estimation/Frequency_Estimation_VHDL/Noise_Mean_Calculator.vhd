library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Noise_Mean_Calculator is

generic (
        	Input_Bit_Width								: 	integer						:= 14;
        	Output_Bit_Width								: 	integer						:= 14;
        	Averaging_Length								:	integer						:=	15;
			Extra_Bits										:	integer						:=	8;
			Outpit_Multiplier_Width						:	integer						:=	4
    		);

port (								
			-------- Input Signals --------
			Input_Signal									:	in		unsigned(Input_Bit_Width-1 downto 0);
			Clock												:  in 	std_logic;
			-------- Output Signals --------
			Output_Signal									:	out	unsigned(Output_Bit_Width-1 downto 0)
			);

end Noise_Mean_Calculator;


architecture Behavioral of Noise_Mean_Calculator is

			---------- Internal Signals ----------
			signal 	Input_Signal_Int					:	unsigned(Input_Bit_Width-1 downto 0)										:=(others=>'0');
			signal 	Input_Signal_Int_Saturate		:	unsigned(Input_Bit_Width-1 downto 0)										:=(others=>'0');
			signal 	Output_Signal_Int					:	unsigned(Output_Bit_Width-1 downto 0)										:=(others=>'0');
			signal 	Internal_1							:	unsigned(Input_Bit_Width+Extra_Bits-1 downto 0)							:=(others=>'0');  
			
			signal 	Output_Signal_Int_Delay 		:	unsigned(Output_Bit_Width+Extra_Bits-1 downto 0)						:=(others=>'0');
			signal	Output_Signal_Int_Int			: 	unsigned(Output_Bit_Width+Extra_Bits-1 downto 0)						:=(others=>'0');
			signal 	Output_Signal_Int3				:	unsigned(Output_Bit_Width+Extra_Bits+Averaging_Length-1 downto 0)	:=(others=>'0');
			signal	Output_Rest_Amount				:	unsigned(Averaging_Length-1 downto 0)										:=(others=>'0');
			
			signal	Output_Signal_Multiplied		:	unsigned	(Output_Bit_Width-1+Outpit_Multiplier_Width downto 0)		:=	(others=>'0');
			signal	Output_Signal_Mul_Offset		:	unsigned	(Output_Bit_Width-1+Outpit_Multiplier_Width downto 0)		:=	(others=>'0');
			signal	Input_Signal_Int_Resized		:	unsigned	(Output_Bit_Width-1+Outpit_Multiplier_Width downto 0)		:=	(others=>'0');

begin						
				
				----- Output Signal ------
				Output_Signal								<=		Output_Signal_Int;
				Output_Signal_Int_Delay					<=		Output_Signal_Int_Int;
				Output_Signal_Int_Int					<=		Output_Signal_Int3(Output_Bit_Width+Averaging_Length+Extra_Bits-1 downto Averaging_Length);
				Internal_1									<=		Input_Signal_Int & to_unsigned(0,Extra_Bits);
				process(Clock)
					begin						
						if rising_edge(Clock) then

							------ Buffering the Input Signal --------
							Input_Signal_Int				<=		Input_Signal;
							Input_Signal_Int_Resized	<=		resize(Input_Signal_Int, Input_Bit_Width + Outpit_Multiplier_Width);
							Input_Signal_Int_Saturate	<=		Input_Signal_Int;
							
							if (Input_Signal_Int_Resized > Output_Signal_Mul_Offset) then
							
								Input_Signal_Int_Saturate<=	resize(Output_Signal_Mul_Offset,Input_Bit_Width);

							end if;
							
						
							Output_Signal_Int3		<=		resize(Internal_1,Output_Bit_Width+Averaging_Length+Extra_Bits) 
																	+ (Output_Signal_Int_Delay & to_unsigned(0,Averaging_Length)) 
																	- resize(Output_Signal_Int_Delay,Output_Bit_Width+Averaging_Length+Extra_Bits) 
																	+ resize(Output_Rest_Amount,Output_Bit_Width+Averaging_Length+Extra_Bits);
																
							
							Output_Signal_Int			<=		Output_Signal_Int3(Output_Bit_Width+Averaging_Length+Extra_Bits-1 downto Averaging_Length+Extra_Bits);
							Output_Rest_Amount		<=		Output_Signal_Int3(Averaging_Length-1 downto 0);
							
							Output_Signal_Multiplied<=		Output_Signal_Int * to_unsigned(3,Outpit_Multiplier_Width);
							Output_Signal_Mul_Offset<=		Output_Signal_Multiplied + to_unsigned(16,Output_Bit_Width+Outpit_Multiplier_Width);
															
						end if;	 							
				end process;			

end Behavioral;
