library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sequence_Detector is
    
	 Generic (
			 Seq:    unsigned    :=    "10011"
				);
	 
	 Port ( 
			  Input : in   STD_LOGIC;
           Clock : in   STD_LOGIC;
           Alarm : out  STD_LOGIC
		   );
end Sequence_Detector;

architecture Behavioral of Sequence_Detector is
-------------------------------------------------------
--Signals & Declerations
	signal sh: unsigned(4 downto 0) := (others => '0');
-------------------------------------------------------
begin
	
		Process(Clock)
		begin
		if rising_edge(clock) then
		
			sh <= input & sh(4 downto 1);
		
   		Alarm <= '0';
			if (sh = seq) then
				Alarm <= '1';
			end if;
	
        end if;
		end process;


end Behavioral;

