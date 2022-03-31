LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use ieee.std_logic_textio.all;
use std.textio.all;
 
ENTITY IIR_TDF_II_tb IS
END IIR_TDF_II_tb;
 
ARCHITECTURE behavior OF IIR_TDF_II_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IIR_TDF_II_Top
    PORT(
         Clock : IN  std_logic;
         Input_Signal : IN  signed(13 downto 0);
         Output_Signal : OUT  signed(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Input_Signal : signed(13 downto 0) := (others => '0');

 	--Outputs
   signal Output_Signal : signed(14 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IIR_TDF_II_Top PORT MAP (
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
		
			Input_Signal				<= to_signed(8191,14);
			
		end if;	
	end process;



	write_Output_Vector: process(Clock)
	
		file 		output_text	: text open write_mode is "\Examples\33_IIR_Filter_Transposed_Direct_Form_II_Series\IIR_TDR_II_MATLAB\Output_Vec_HDL.txt";
		variable LO1			: line;
		
	begin
	
		if rising_edge(Clock) then
		
			write(LO1, to_integer(Output_Signal));
			writeline(output_text , LO1);
			
		end if;
	end process;

END;