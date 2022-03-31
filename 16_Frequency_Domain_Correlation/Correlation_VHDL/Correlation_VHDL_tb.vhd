LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use ieee.std_logic_textio.all;
use std.textio.all;
 
ENTITY Correlation_VHDL_tb IS
END Correlation_VHDL_tb;
 
ARCHITECTURE behavior OF Correlation_VHDL_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Correlation_Top
    PORT(
         Clock : IN  std_logic;
         Input_Data_1 : IN  signed(7 downto 0);
         Input_Data_2 : IN  signed(7 downto 0);
         Start_Correlation : IN  std_logic;
         Output_Correlation : OUT  signed(32 downto 0);
         Output_Valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Input_Data_1 : signed(7 downto 0) := (others => '0');
   signal Input_Data_2 : signed(7 downto 0) := (others => '0');
   signal Start_Correlation : std_logic := '0';
   signal Start_Correlation_temp : std_logic := '0';

 	--Outputs
   signal Output_Correlation : signed(32 downto 0);
   signal Output_Valid : std_logic;

	signal Input_Vector_Counter : unsigned (9 downto 0) := (others=>'1');
   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Correlation_Top PORT MAP (
          Clock => Clock,
          Input_Data_1 => Input_Data_1,
          Input_Data_2 => Input_Data_2,
          Start_Correlation => Start_Correlation,
          Output_Correlation => Output_Correlation,
          Output_Valid => Output_Valid
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
	
		file		input_text_a: text open read_mode is "\Examples\40_Frequency_Domain_Correlation\Correlation_MATLAB\Input_Vec_a.txt";
		file		input_text_b: text open read_mode is "\Examples\40_Frequency_Domain_Correlation\Correlation_MATLAB\Input_Vec_b.txt";
		variable LI1			: line;
		variable LI1_var		: integer;
		
	begin
	
		if rising_edge(Clock) then

			Start_Correlation				<=	'0';
		
			if (Start_Correlation_temp = '0') then
				Start_Correlation			<=	'1';
				Start_Correlation_temp	<=	'1';
				Input_Vector_Counter		<=	(others=>'0');
			end if;
			
			Input_Data_1					<=	(others=>'0');
			Input_Data_2					<=	(others=>'0');
			
			if (Input_Vector_Counter < to_unsigned(128,10)) then

				Input_Vector_Counter		<=	Input_Vector_Counter + 1;
				
				readline(input_text_a,LI1);
				read(LI1,LI1_var);
				Input_Data_1				<= to_signed(LI1_var,8);

				readline(input_text_b,LI1);
				read(LI1,LI1_var);
				Input_Data_2				<= to_signed(LI1_var,8);
				
			end if;
			
			
		end if;	
	end process;



	write_Output_Vector: process(Clock)
	
		file 		output_text	: text open write_mode is "\Examples\40_Frequency_Domain_Correlation\Correlation_MATLAB\Output_Vec_HDL.txt";
		variable LO1			: line;
		
	begin
	
		if rising_edge(Clock) then
		
			if (Output_Valid = '1') then
			
				write(LO1, to_integer(Output_Correlation));
				writeline(output_text , LO1);
			
			end if;
			
		end if;
	end process;

END;

