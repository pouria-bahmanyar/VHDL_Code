library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IF_FFT_Top is
    Port ( 
				Clock 					:	in 	STD_LOGIC;
				IF_Input					:	in		signed	(13 downto 0)
			);
end IF_FFT_Top;

architecture Behavioral of IF_FFT_Top is

	signal	Signal_I_Int				:	signed	(13 downto 0)				:=	(others=>'0');
	signal	Signal_Q_Int				:	signed	(13 downto 0)				:=	(others=>'0');
	
	Type 		Signal_IQ_Delay is array (0 to 30) of signed (13 downto 0);	
	signal	Signal_I_Delay				:	Signal_IQ_Delay						:=	(others=>(others=>'0'));
	signal	Signal_Q_Delay				:	Signal_IQ_Delay						:=	(others=>(others=>'0'));
	
	signal	Signal_I_Delayed			:	signed (13 downto 0)					:=	(others=>'0');
	signal	Signal_Q_Delayed			:	signed (13 downto 0)					:=	(others=>'0');
		
	signal	Baseband_Signal_Int		:	std_logic_vector	(14 downto 0)	:=	(others=>'0');
	signal	Input_Noise_Mean			:	unsigned	(13 downto 0)				:=	(others=>'0');
	
	signal	Threshold					:	unsigned	(16 downto 0)				:=	(others=>'0');
	signal	Baseband_Signal_Resize	:	unsigned	(16 downto 0)				:=	(others=>'0');
	signal	Pulse_Detection_Counter	:	unsigned	(5 downto 0)				:=	(others=>'0');
	signal	Pulse_Termination_Counter:	unsigned	(5 downto 0)				:=	(others=>'0');
	
	signal	FFT_Output_Real			:	std_logic_vector	(21 downto 0)	:=	(others=>'0');
	signal	FFT_Output_Image			:	std_logic_vector	(21 downto 0)	:=	(others=>'0');
	
	signal	FFT_Start					:	std_logic								:=	'0';
	signal	FFT_Data_Valid				:	std_logic								:=	'0';
	signal	FFT_Amp_Ready				:	std_logic								:=	'0';
	signal	FFT_Amp_Ready_Prev_1		:	std_logic								:=	'0';
	signal	FFT_Amp_Ready_Prev_2		:	std_logic								:=	'0';
	signal	Pulse_Detection_Flag		:	std_logic								:=	'0';
	signal	Pulse_Detection_Flag_Prev:	std_logic								:=	'0';
	
	signal	FFT_Amp						:	std_logic_vector	(22 downto 0)	:=	(others=>'0');
	signal	FFT_Amp_D1					:	unsigned	(22 downto 0)				:=	(others=>'0');
	signal	FFT_Amp_D2					:	unsigned	(22 downto 0)				:=	(others=>'0');
	signal	FFT_Max_Amp_A				:	unsigned	(22 downto 0)				:=	(others=>'0');
	signal	FFT_Max_Amp_B				:	unsigned	(22 downto 0)				:=	(others=>'0');
	signal	FFT_Max_Amp_C				:	unsigned	(22 downto 0)				:=	(others=>'0');
	signal	FFT_Max_Amp_A_Buff		:	unsigned	(22 downto 0)				:=	(others=>'0');
	signal	FFT_Max_Amp_B_Buff		:	unsigned	(22 downto 0)				:=	(others=>'0');
	signal	FFT_Max_Amp_C_Buff		:	unsigned	(22 downto 0)				:=	(others=>'0');
	signal	FFT_Bin_Offset_Num		:	signed	(23 downto 0)				:=	(others=>'0');
	signal	FFT_Bin_Offset_Den		:	signed	(24 downto 0)				:=	(others=>'0');
	signal	Bin_Offset					:	std_logic_vector	(15 downto 0)	:=	(others=>'0');
	
	signal	FFT_Index_Counter			:	unsigned	(6 downto 0)				:=	(others=>'0');
	signal	FFT_Max_Index				:	unsigned	(6 downto 0)				:=	(others=>'0');
	signal	FFT_Max_Index_Buff		:	unsigned	(6 downto 0)				:=	(others=>'0');
	
	signal	Bin_Offset_New_Data		:	std_logic								:=	'0';
	signal	Bin_Offset_New_Ready		:	std_logic								:=	'0';
		
	signal	CONTROL0						:	std_logic_vector (35 downto 0)	:=	(others=>'0');
	signal	DATA							:	std_logic_vector (22 downto 0)	:=	(others=>'0');
	signal	TRIG0							:	std_logic_vector (0 downto 0)		:=	(others=>'0');
	


	COMPONENT SQRT
	  PORT (
		 x_in : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
		 y_in : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
		 x_out : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
		 clk : IN STD_LOGIC
	  );
	END COMPONENT;

	COMPONENT FFT_128p
	  PORT (
		 clk : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 xn_re : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 xn_im : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 fwd_inv : IN STD_LOGIC;
		 fwd_inv_we : IN STD_LOGIC;
		 rfd : OUT STD_LOGIC;
		 xn_index : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 busy : OUT STD_LOGIC;
		 edone : OUT STD_LOGIC;
		 done : OUT STD_LOGIC;
		 dv : OUT STD_LOGIC;
		 xk_index : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 xk_re : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
		 xk_im : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	  );
	END COMPONENT;

COMPONENT FFT_SQRT
  PORT (
    x_in : IN STD_LOGIC_VECTOR(22 DOWNTO 0);
    y_in : IN STD_LOGIC_VECTOR(22 DOWNTO 0);
    nd : IN STD_LOGIC;
    x_out : OUT STD_LOGIC_VECTOR(22 DOWNTO 0);
    rdy : OUT STD_LOGIC;
    clk : IN STD_LOGIC
  );
END COMPONENT;

component Bin_Offset_Calculator
	port (
	clk: in std_logic;
	nd: in std_logic;
	rdy: out std_logic;
	rfd: out std_logic;
	dividend: in std_logic_vector(23 downto 0);
	divisor: in std_logic_vector(25 downto 0);
	quotient: out std_logic_vector(23 downto 0);
	fractional: out std_logic_vector(15 downto 0));
end component;

component ICON_T
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

end component;

component ILA_T
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    DATA : IN STD_LOGIC_VECTOR(22 DOWNTO 0);
    TRIG0 : IN STD_LOGIC_VECTOR(0 TO 0));

end component;

begin

	icon0 : ICON_T
	  port map (
		 CONTROL0 => CONTROL0);

	ila0 : ILA_T
	  port map (
		 CONTROL => CONTROL0,
		 CLK => Clock,
		 DATA => DATA,
		 TRIG0 => TRIG0);

		DATA		<=	std_logic_vector(FFT_Max_Index_Buff) & Bin_Offset;
		TRIG0(0)	<=	Bin_Offset_New_Ready;

	Inst_IQ_Demodulator: entity work.IQ_Demodulator 
		PORT MAP(
					Clock 			=> Clock,
					Signal_IF 		=> IF_Input,
					Signal_I 		=> Signal_I_Int,
					Signal_Q 		=> Signal_Q_Int					
				);

	sqrt_core : SQRT
	  PORT MAP (
		 x_in 		=> std_logic_vector(resize(Signal_I_Int,15)),
		 y_in 		=> std_logic_vector(resize(Signal_Q_Int,15)),
		 x_out 		=> Baseband_Signal_Int,
		 clk 			=> Clock
	  );

	Inst_Noise_Mean_Calculator: entity work.Noise_Mean_Calculator 
		PORT MAP(
					Input_Signal 	=> unsigned(Baseband_Signal_Int(13 downto 0)),
					Clock 			=> Clock,
					Output_Signal 	=> Input_Noise_Mean
				);
	
		
	FFT_128p_Core : FFT_128p
	  PORT MAP (
					clk 				=> Clock,
					start 			=> FFT_Start,
					xn_re 			=> std_logic_vector(Signal_I_Delayed),
					xn_im 			=> std_logic_vector(Signal_Q_Delayed),
					fwd_inv 			=> '1',
					fwd_inv_we 		=> '1',
					rfd 				=> open,
					xn_index 		=> open,
					busy 				=> open,
					edone 			=> open,
					done 				=> open,
					dv 				=> FFT_Data_Valid,
					xk_index 		=> open,
					xk_re 			=> FFT_Output_Real,
					xk_im 			=> FFT_Output_Image
				);	

	FFT_SQRT_Core : FFT_SQRT
	  PORT MAP (
					 x_in 			=> std_logic_vector(resize(signed(FFT_Output_Real),23)),
					 y_in 			=> std_logic_vector(resize(signed(FFT_Output_Image),23)),
					 x_out 			=> FFT_Amp,
					 nd 				=> FFT_Data_Valid,
					 rdy 				=> FFT_Amp_Ready,			 
					 clk 				=> Clock
				);

	Bin_Offset_Calculator0 : Bin_Offset_Calculator
			port map (
					clk 				=> Clock,
					nd 				=> Bin_Offset_New_Data,
					rdy 				=> Bin_Offset_New_Ready,
					rfd 				=> open,
					dividend 		=> std_logic_vector(FFT_Bin_Offset_Num),
					divisor 			=> std_logic_vector(FFT_Bin_Offset_Den&'0'),
					quotient 		=> open,
					fractional 		=> Bin_Offset
				);

	process(Clock)
	begin
	
		if rising_edge(Clock) then
					
			Signal_I_Delay(0)				<=	Signal_I_Int;
			Signal_Q_Delay(0)				<=	Signal_Q_Int;
			Signal_I_Delayed				<=	Signal_I_Delay(30);
			Signal_Q_Delayed				<=	Signal_Q_Delay(30);

			for I in 0 to 29 loop

				Signal_I_Delay(I+1)		<=	Signal_I_Delay(I);
				Signal_Q_Delay(I+1)		<=	Signal_Q_Delay(I);
			
			end loop;
			
			if (Pulse_Detection_Flag = '0') then

				Signal_I_Delayed			<=	(others=>'0');
				Signal_Q_Delayed			<=	(others=>'0');
			
			end if;
			
			Threshold						<=	to_unsigned(782,17);--Input_Noise_Mean * to_unsigned(3,3);
			Baseband_Signal_Resize		<=	resize(unsigned(Baseband_Signal_Int),17);
			
			Pulse_Detection_Counter		<=	(others=>'0');
			Pulse_Termination_Counter	<=	(others=>'0');
			FFT_Start						<=	'0';
			
			if (Baseband_Signal_Resize	>	Threshold and Pulse_Detection_Flag = '0') then

				Pulse_Detection_Counter	<=	Pulse_Detection_Counter + 1;

				if (Pulse_Detection_Counter > to_unsigned(4,6)) then
					FFT_Start					<=	'1';			
					Pulse_Detection_Flag		<=	'1';			
				end if;

			end if;

			if (Baseband_Signal_Resize	<	Threshold and Pulse_Detection_Flag = '1') then
			
				Pulse_Termination_Counter<=	Pulse_Termination_Counter + 1;
				
				if (Pulse_Termination_Counter > to_unsigned(3,6)) then
					Pulse_Detection_Flag		<=	'0';			
				end if;

			end if;
				
			
			FFT_Amp_Ready_Prev_1				<=	FFT_Amp_Ready;
			FFT_Amp_Ready_Prev_2				<=	FFT_Amp_Ready_Prev_1;
			FFT_Amp_D1							<=	unsigned(FFT_Amp);
			FFT_Amp_D2							<=	FFT_Amp_D1;

			Bin_Offset_New_Data				<=	'0';
			
			
			if (FFT_Amp_Ready_Prev_1 = '1') then

				FFT_Index_Counter				<=	FFT_Index_Counter + 1;
				
				if (FFT_Amp_D1 > FFT_Max_Amp_B) then

					FFT_Max_Amp_A					<=	FFT_Amp_D2;
					FFT_Max_Amp_B					<=	FFT_Amp_D1;
					FFT_Max_Amp_C					<=	unsigned(FFT_Amp);
					FFT_Max_Index					<=	FFT_Index_Counter;
					
				end if;
				
			end if;
			
			if (FFT_Amp_Ready_Prev_1 = '1' and FFT_Amp_Ready_Prev_2 = '0') then

				FFT_Max_Index					<=	to_unsigned(0,7);
				FFT_Max_Amp_A					<=	(others=>'0');
				FFT_Max_Amp_B					<=	FFT_Amp_D1;
				FFT_Max_Amp_C					<=	unsigned(FFT_Amp);
				FFT_Index_Counter				<=	to_unsigned(1,7);
				
			end if;

			if (FFT_Amp_Ready_Prev_1 = '0' and FFT_Amp_Ready_Prev_2 = '1') then

				FFT_Max_Amp_A_Buff			<=	FFT_Max_Amp_A;
				FFT_Max_Amp_B_Buff			<=	FFT_Max_Amp_B;
				FFT_Max_Amp_C_Buff			<=	FFT_Max_Amp_C;
				FFT_Max_Index_Buff			<=	FFT_Max_Index;
				
				FFT_Bin_Offset_Num			<=	signed('0'&FFT_Max_Amp_A) - signed('0'&FFT_Max_Amp_C);
				FFT_Bin_Offset_Den			<=	resize(signed('0'&FFT_Max_Amp_A),25) + signed('0'&FFT_Max_Amp_C) - signed('0'&FFT_Max_Amp_B&'0');

				Bin_Offset_New_Data			<=	'1';
				
			end if;
			
		end if;
	
	end process;
	
end Behavioral;

