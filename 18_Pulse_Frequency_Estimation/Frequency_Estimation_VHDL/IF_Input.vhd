library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity IF_Input is
	port (
			Clock						: in 		std_logic;			
			Read_Address 			: in 		unsigned	(3 downto 0); 
			Data_Out					: out 	unsigned	(4 downto 0)
		);
	
end IF_Input;

architecture Behavioral of IF_Input is
	
	type Mem_type1 is array (0 to 15) of unsigned(4 downto 0);
	constant Mem_Signal 	: Mem_type1 		:= (
																"00000",
																"00000",
																"00000",
																"00000",
																"00000",
																"00000",
																"00000",
																"00000",
																"00000",
																"00000",
																"00000",
																"00000",
																"00000",
																"00000",
																"00000",
																"00000"
																);                        
	
	signal Mem_Signal_Int	:	unsigned (4 downto 0) := (others=>'0');
	
begin


	Mem_Signal_Int	<=		Mem_Signal(to_integer(Read_Address));

	
aa:	process (Clock)
	begin
		
		if (Clock'event and Clock = '1') then
								
			Data_Out	<=		Mem_Signal_Int;
			
		end if;
	end process;
	
end Behavioral;