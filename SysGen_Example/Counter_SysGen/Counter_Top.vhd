library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter_Top is

    Port ( 
				Clock 			: in  STD_LOGIC;
				Up_Down 			: in  STD_LOGIC;
				Counter_Out 	: out  unsigned (7 downto 0)
			);
			
end Counter_Top;

architecture Behavioral of Counter_Top is

	COMPONENT counter_sysgen_cw
	PORT(
		ce : IN std_logic;
		clk : IN std_logic;
		gateway_in : IN std_logic;          
		gateway_out : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	signal	Counter_Out_Int	: std_logic_vector (7 downto 0)		:=	(others=>'0');

begin
	
	Counter_Out				<=	unsigned(Counter_Out_Int);

	Inst_counter_sysgen_cw: counter_sysgen_cw PORT MAP(
		ce 					=> '1',
		clk 					=> Clock,
		gateway_in 			=> Up_Down,
		gateway_out 		=> Counter_Out_Int
	);

end Behavioral;

