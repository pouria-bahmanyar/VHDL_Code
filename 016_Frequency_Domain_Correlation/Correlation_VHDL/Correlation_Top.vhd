library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Correlation_Top is
    Port ( 
				Clock 					: in  STD_LOGIC;
				Input_Data_1 			: in  signed (7 downto 0);
				Input_Data_2 			: in  signed (7 downto 0);
				Start_Correlation 	: in	STD_LOGIC;
				Output_Correlation 	: out signed (32 downto 0);
				Output_Valid 			: out	STD_LOGIC
			);
			
end Correlation_Top;

architecture Behavioral of Correlation_Top is
	
	COMPONENT Input_FFT_1
	  PORT (
		 clk : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 xn_re : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 xn_im : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 fwd_inv : IN STD_LOGIC;
		 fwd_inv_we : IN STD_LOGIC;
		 rfd : OUT STD_LOGIC;
		 xn_index : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 busy : OUT STD_LOGIC;
		 edone : OUT STD_LOGIC;
		 done : OUT STD_LOGIC;
		 dv : OUT STD_LOGIC;
		 xk_index : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 xk_re : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 xk_im : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
	END COMPONENT;

COMPONENT Output_IFFT
  PORT (
    clk : IN STD_LOGIC;
    start : IN STD_LOGIC;
    xn_re : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
    xn_im : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
    fwd_inv : IN STD_LOGIC;
    fwd_inv_we : IN STD_LOGIC;
    rfd : OUT STD_LOGIC;
    xn_index : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    busy : OUT STD_LOGIC;
    edone : OUT STD_LOGIC;
    done : OUT STD_LOGIC;
    dv : OUT STD_LOGIC;
    xk_index : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    xk_re : OUT STD_LOGIC_VECTOR(32 DOWNTO 0);
    xk_im : OUT STD_LOGIC_VECTOR(32 DOWNTO 0)
  );
END COMPONENT;

	signal	Input_Data_1_Int				:	signed	(7 downto 0)				:=	(others=>'0');
	signal	Input_Data_1_Int_D1			:	signed	(7 downto 0)				:=	(others=>'0');
	signal	Input_Data_1_Int_D2			:	signed	(7 downto 0)				:=	(others=>'0');
	signal	Input_Data_2_Int				:	signed	(7 downto 0)				:=	(others=>'0');
	signal	Input_Data_2_Int_D1			:	signed	(7 downto 0)				:=	(others=>'0');
	signal	Input_Data_2_Int_D2			:	signed	(7 downto 0)				:=	(others=>'0');
	signal	Start_Correlation_Int		:	std_logic								:=	'0';
	signal	Start_Correlation_Prev		:	std_logic								:=	'0';

	signal	FFT1_Start						:	std_logic								:=	'0';
	signal	FFT1_Fwd_Inv					:	std_logic								:=	'0';
	signal	FFT1_Fwd_Inv_WE				:	std_logic								:=	'0';
	signal	FFT1_Busy						:	std_logic								:=	'0';
	signal	FFT1_Edone						:	std_logic								:=	'0';
	signal	FFT1_Done						:	std_logic								:=	'0';
	signal	FFT1_Done_D1					:	std_logic								:=	'0';
	signal	FFT1_DV							:	std_logic								:=	'0';
	signal	FFT1_Output_Data_Real		:	std_logic_vector	(15 downto 0)	:=	(others=>'0');
	signal	FFT1_Output_Data_Imag		:	std_logic_vector	(15 downto 0)	:=	(others=>'0');

	signal	FFT2_Start						:	std_logic								:=	'0';
	signal	FFT2_Fwd_Inv					:	std_logic								:=	'0';
	signal	FFT2_Fwd_Inv_WE				:	std_logic								:=	'0';
	signal	FFT2_Busy						:	std_logic								:=	'0';
	signal	FFT2_Edone						:	std_logic								:=	'0';
	signal	FFT2_Done						:	std_logic								:=	'0';
	signal	FFT2_DV							:	std_logic								:=	'0';
	signal	FFT2_Output_Data_Real		:	std_logic_vector	(15 downto 0)	:=	(others=>'0');
	signal	FFT2_Output_Data_Imag		:	std_logic_vector	(15 downto 0)	:=	(others=>'0');

	signal	FFT_Out_Start					:	std_logic								:=	'0';
	signal	FFT_Out_Fwd_Inv_WE			:	std_logic								:=	'0';
	signal	FFT_Out_Busy					:	std_logic								:=	'0';
	signal	FFT_Out_Edone					:	std_logic								:=	'0';
	signal	FFT_Out_Done					:	std_logic								:=	'0';
	signal	FFT_Out_DV						:	std_logic								:=	'0';
	signal	FFT_Out_Output_Data_Real	:	std_logic_vector	(32 downto 0)	:=	(others=>'0');
	signal	Muliplier_Real_Output		:	signed	(24 downto 0)				:=	(others=>'0');
	signal	Muliplier_Imag_Output		:	signed	(24 downto 0)				:=	(others=>'0');
		
begin

	Input_Data_1_FFT : Input_FFT_1
		PORT MAP (
						clk 				=> Clock,
						start 			=> FFT1_Start,
						xn_re 			=> std_logic_vector(Input_Data_1_Int_D2),
						xn_im 			=> (others=>'0'),
						fwd_inv 			=> '1',
						fwd_inv_we 		=> '0',
						rfd	 			=> open,
						xn_index 		=> open,
						busy 				=> open,
						edone 			=> open,
						done 				=> FFT1_Done,
						dv 				=> open,
						xk_index 		=> open,
						xk_re 			=> FFT1_Output_Data_Real,
						xk_im 			=> FFT1_Output_Data_Imag
					);

	Input_Data_2_FFT : Input_FFT_1
		PORT MAP (
						clk 				=> Clock,
						start 			=> FFT2_Start,
						xn_re 			=> std_logic_vector(Input_Data_2_Int_D2),
						xn_im 			=> (others=>'0'),
						fwd_inv 			=> '1',
						fwd_inv_we 		=> '0',
						rfd	 			=> open,
						xn_index 		=> open,
						busy 				=> open,
						edone 			=> open,
						done 				=> open,
						dv 				=> open,
						xk_index 		=> open,
						xk_re 			=> FFT2_Output_Data_Real,
						xk_im 			=> FFT2_Output_Data_Imag
					);

	Inst_Multiply_Conjugate: entity work.Multiply_Conjugate 
		PORT MAP(
						Clock 			=> Clock,
						X_Real		 	=> signed(FFT1_Output_Data_Real),
						X_Imag 			=> signed(FFT1_Output_Data_Imag),
						Y_Real 			=> signed(FFT2_Output_Data_Real),
						Y_Imag 			=> signed(FFT2_Output_Data_Imag),
						F_Real 			=> Muliplier_Real_Output,
						F_Imag 			=> Muliplier_Imag_Output
					);

	Output_Data_FFT : Output_IFFT
		PORT MAP (
						clk 				=> Clock,
						start 			=> FFT_Out_Start,
						xn_re 			=> std_logic_vector(Muliplier_Real_Output),
						xn_im 			=> std_logic_vector(Muliplier_Imag_Output),
						fwd_inv 			=> '0',
						fwd_inv_we 		=> FFT_Out_Fwd_Inv_WE,
						rfd 				=> open,
						xn_index 		=> open,
						busy 				=> open,
						edone 			=> open,
						done 				=> open,
						dv 				=> FFT_Out_DV,
						xk_index 		=> open,
						xk_re 			=> FFT_Out_Output_Data_Real,
						xk_im 			=> open
					);

	Output_Correlation						<=	signed(FFT_Out_Output_Data_Real);
	Output_Valid								<=	FFT_Out_DV;			

	process(Clock)
	begin
	
		if rising_edge(Clock) then

			Input_Data_1_Int					<=	Input_Data_1;	
			Input_Data_1_Int_D1				<=	Input_Data_1;	
			Input_Data_1_Int_D2				<=	Input_Data_1_Int_D1;	
			Input_Data_2_Int					<=	Input_Data_2;		
			Input_Data_2_Int_D1				<=	Input_Data_2;		
			Input_Data_2_Int_D2				<=	Input_Data_2_Int_D1;		
			Start_Correlation_Int			<=	Start_Correlation;	
			Start_Correlation_Prev			<=	Start_Correlation_Int;	
			FFT1_Start							<=	'0';
			FFT2_Start							<=	'0';
			FFT_Out_Fwd_Inv_WE				<=	'0';				
			FFT1_Done_D1						<=	FFT1_Done;
			FFT_Out_Start						<=	FFT1_Done_D1;
			
			if (Start_Correlation_Int = '1' and Start_Correlation_Prev = '0') then
			
				FFT1_Start						<=	'1';
				FFT2_Start						<=	'1';
				FFT_Out_Fwd_Inv_WE			<=	'1';	
				
			end if;
		
		end if;
	
	end process;
end Behavioral;

