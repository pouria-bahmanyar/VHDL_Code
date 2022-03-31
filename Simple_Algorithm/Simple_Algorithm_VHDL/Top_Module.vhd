library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Top_Module is

    Port ( 
				Clock 			: in  STD_LOGIC;
				Input_Signal 	: in  signed 	(13 downto 0);
				Output_Signal	: out	signed	(16 downto 0)
			);
			
end Top_Module;

architecture Behavioral of Top_Module is

	constant	Coefficient			:	signed 				(8 downto 0)				:=	to_signed(201,9);
	signal	DDS_Sin_2MHz		:	std_logic_vector	(11 downto 0)				:=	(others=>'0');
	signal	Product				:	signed				(20 downto 0)				:=	(others=>'0');
	signal	Input_Signal_Int	:	signed				(13 downto 0)				:=	(others=>'0');
	signal	Output_Signal_Int	:	signed				(16 downto 0)				:=	(others=>'0');

	COMPONENT Sin_2MHz
	  PORT (
		 clk : IN STD_LOGIC;
		 sine : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	  );
	END COMPONENT;

begin

	Sin_2MHz_Inst : Sin_2MHz
	  PORT MAP (
		 clk 			=> Clock,
		 sine 		=> DDS_Sin_2MHz
	  );

	Output_Signal					<=	Output_Signal_Int;
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			Input_Signal_Int		<=	Input_Signal;
			Product					<=	Coefficient * signed(DDS_Sin_2MHz);
			Output_Signal_Int		<=	Input_Signal_Int + Product(20 downto 4);
		
		end if;
	
	end process;

end Behavioral;