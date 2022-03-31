library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IIR_TDF_II_Top is

    Port ( 
				Clock 			: in  STD_LOGIC;
				Output_Signal	: out	signed (14 downto 0)
				);
				
end IIR_TDF_II_Top;
	 
architecture Behavioral of IIR_TDF_II_Top is

	------	Internal signal for buffering the input and output ports.
	signal	Input_Signal_Int		:	signed (13 downto 0)		:=	(others=>'0');
	signal	Output_Signal_Int		:	signed (14 downto 0)		:=	(others=>'0');
	
	------	Delay Accumulator registers.
	signal	Delay_Accumulator_D1	:	signed (31 downto 0)		:=	(others=>'0');
	signal	Delay_Accumulator_D2	:	signed (31 downto 0)		:=	(others=>'0');
	signal	Delay_Accumulator_D3	:	signed (31 downto 0)		:=	(others=>'0');
	signal	Delay_Accumulator_D4	:	signed (31 downto 0)		:=	(others=>'0');
	
	------	Feed-Forward Coefficient constants.
	Constant	Coeff_b0					:	signed (16 downto 0)		:=	to_signed(44,17);
	Constant	Coeff_b1					:	signed (16 downto 0)		:=	to_signed(-12,17);
	Constant	Coeff_b2					:	signed (16 downto 0)		:=	to_signed(59,17);
	Constant	Coeff_b3					:	signed (16 downto 0)		:=	to_signed(-12,17);
	Constant	Coeff_b4					:	signed (16 downto 0)		:=	to_signed(44,17);

	------	Feed-Back Coefficient constants.
	Constant	Coeff_a1					:	signed (16 downto 0)		:=	to_signed(51730,17);
	Constant	Coeff_a2					:	signed (16 downto 0)		:=	to_signed(-62420,17);
	Constant	Coeff_a3					:	signed (16 downto 0)		:=	to_signed(33962,17);
	Constant	Coeff_a4					:	signed (16 downto 0)		:=	to_signed(-7013,17);

	signal	Output_Accumulator	:	signed (31 downto 0)		:=	(others=>'0');

	signal	DATA 						: 	STD_LOGIC_VECTOR(14 DOWNTO 0);
	signal	TRIG0 					: 	STD_LOGIC_VECTOR(0 TO 0);
	signal	SYNC_OUT 				: 	STD_LOGIC_VECTOR(0 TO 0);
	signal	CONTROL0 				: 	STD_LOGIC_VECTOR(35 DOWNTO 0);
	signal	CONTROL1 				: 	STD_LOGIC_VECTOR(35 DOWNTO 0);


	component icon_0
	  PORT (
		 CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CONTROL1 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

	end component;

	component ila_0
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CLK : IN STD_LOGIC;
		 DATA : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
		 TRIG0 : IN STD_LOGIC_VECTOR(0 TO 0));

	end component;

	component vio_o
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CLK : IN STD_LOGIC;
		 SYNC_OUT : OUT STD_LOGIC_VECTOR(0 TO 0));

	end component;
		
begin

	icon_t : icon_0
	  port map (
		 CONTROL0 => CONTROL0,
		 CONTROL1 => CONTROL1);

	ila_t : ila_0
	  port map (
		 CONTROL 		=> CONTROL0,
		 CLK 				=> Clock,
		 DATA 			=> DATA,
		 TRIG0 			=> SYNC_OUT);

	vio_t : vio_o
	  port map (
		 CONTROL 		=> CONTROL1,
		 CLK 				=> Clock,
		 SYNC_OUT 		=> SYNC_OUT);

	DATA									<=	STD_LOGIC_VECTOR(Output_Signal_Int);

	Output_Accumulator				<=	Coeff_b0 * Input_Signal_Int + Delay_Accumulator_D1;
	Output_Signal_Int					<=	Output_Accumulator(28 downto 14);
	Output_Signal						<=	Output_Signal_Int;
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			-- Input signal buffering
			if (SYNC_OUT(0) = '1') then
				Input_Signal_Int			<=	to_signed(8191,14);
			end if;
			
			-- IIR multiply and accumulate
			Delay_Accumulator_D4		<=	Coeff_b4 * Input_Signal_Int + Coeff_a4 * Output_Signal_Int;
			Delay_Accumulator_D3		<=	Coeff_b3 * Input_Signal_Int + Coeff_a3 * Output_Signal_Int + Delay_Accumulator_D4;
			Delay_Accumulator_D2		<=	Coeff_b2 * Input_Signal_Int + Coeff_a2 * Output_Signal_Int + Delay_Accumulator_D3;
			Delay_Accumulator_D1		<=	Coeff_b1 * Input_Signal_Int + Coeff_a1 * Output_Signal_Int + Delay_Accumulator_D2;
												
		end if;
	
	end process;

end Behavioral;