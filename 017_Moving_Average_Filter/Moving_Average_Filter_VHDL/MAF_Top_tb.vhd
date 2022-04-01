LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use ieee.std_logic_textio.all;
use std.textio.all;
 
ENTITY MAF_Top_tb IS
END MAF_Top_tb;
 
ARCHITECTURE behavior OF MAF_Top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MAF_Top
    PORT(
         Clock : IN  std_logic;
         Input_Signal : IN  signed(13 downto 0);
         Output_Signal : OUT  signed(13 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Input_Signal : signed(13 downto 0) := (others => '0');

 	--Outputs
   signal Output_Signal : signed(13 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MAF_Top PORT MAP (
          Clock => Clock,
          Input_Signal => Input_Signal,
          Output_Signal => Output_Signal
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

	Read_Input_Vector: process(Clock)
			
	begin
	
		if rising_edge(Clock) then
		
			Input_Signal				<= to_signed(7373,14);
			
		end if;	
	end process;



	write_Output_Vector: process(Clock)
	
		file 		output_text	: text open write_mode is "\Examples\50_Moving_Average_Filter\Moving_Average_Filter_MATLAB\Output_Vec_HDL.txt";
		variable LO1			: line;
		
	begin
	
		if rising_edge(Clock) then
		
			write(LO1, to_integer(Output_Signal));
			writeline(output_text , LO1);
			
		end if;
	end process;


END;

