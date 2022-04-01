LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use ieee.std_logic_textio.all;
use std.textio.all;
 
ENTITY AM_Modulation_VHDL_tb IS
END AM_Modulation_VHDL_tb;
 
ARCHITECTURE behavior OF AM_Modulation_VHDL_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Top_Module
    PORT(
				Clock 			: in  STD_LOGIC;
				Output_Signal	: out	signed	(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';

 	--Outputs
   signal Output_Signal : signed(9 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top_Module PORT MAP (
          Clock => Clock,
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


	write_Output_Vector: process(Clock)
	
		file 		output_text	: text open write_mode is "\Examples\AM_Modulation\AM_Modulation_MATLAB\Output_Vec_HDL.txt";
		variable LO1			: line;
		
	begin
	
		if rising_edge(Clock) then
		
			write(LO1, to_integer(Output_Signal));
			writeline(output_text , LO1);
			
		end if;
	end process;

END;
