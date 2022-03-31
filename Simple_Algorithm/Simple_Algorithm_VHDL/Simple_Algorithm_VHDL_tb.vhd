LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use ieee.std_logic_textio.all;
use std.textio.all;
 
ENTITY Simple_Algorithm_VHDL_tb IS
END Simple_Algorithm_VHDL_tb;
 
ARCHITECTURE behavior OF Simple_Algorithm_VHDL_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Top_Module
    PORT(
         Clock : IN  std_logic;
         Input_Signal : IN  signed(13 downto 0);
         Output_Signal : OUT  signed(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Input_Signal : signed(13 downto 0) := (others => '0');

 	--Outputs
   signal Output_Signal : signed(16 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top_Module PORT MAP (
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
	
		file		input_text	: text open read_mode is "\Examples\Simple_Algorithm\Simple_Algorithm_MATLAB\Input_Vec.txt";
		variable LI1			: line;
		variable LI1_var		: integer;
		
	begin
	
		if rising_edge(Clock) then
		
			readline(input_text,LI1);
			read(LI1,LI1_var);
			Input_Signal				<= to_signed(LI1_var,14);
			
		end if;	
	end process;



	write_Output_Vector: process(Clock)
	
		file 		output_text	: text open write_mode is "\Examples\Simple_Algorithm\Simple_Algorithm_MATLAB\Output_Vec_HDL.txt";
		variable LO1			: line;
		
	begin
	
		if rising_edge(Clock) then
		
			write(LO1, to_integer(Output_Signal));
			writeline(output_text , LO1);
			
		end if;
	end process;

END;
