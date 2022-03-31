LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
 
ENTITY IF_IFF_Top_tb IS
END IF_IFF_Top_tb;
 
ARCHITECTURE behavior OF IF_IFF_Top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IF_FFT_Top
    PORT(
         Clock : IN  std_logic;
         IF_Input : IN  signed(13 downto 0);
--         Signal_I1 : OUT  signed(13 downto 0);
--         Signal_Q1 : OUT  signed(13 downto 0);
			Baseband_Signal_Out	:	out	unsigned	(13 downto 0);				
			Input_Noise_Mean_Out	:	out	unsigned	(13 downto 0);
			FFT_Output_Index_Out	:	out	std_logic_vector	(6 downto 0);
			FFT_Amp_Out	:	out	std_logic_vector	(22 downto 0)	

        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal IF_Input : signed(13 downto 0) := (others => '0');

 	--Outputs
--   signal Signal_I1 : signed(13 downto 0);
--   signal Signal_Q1 : signed(13 downto 0);

	signal Baseband_Signal_Out	: unsigned	(13 downto 0);
	signal Input_Noise_Mean_Out	: unsigned	(13 downto 0);

	signal FFT_Output_Index_Out	:	std_logic_vector	(6 downto 0);
	signal FFT_Amp_Out		:	std_logic_vector	(22 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 7.8125 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IF_FFT_Top PORT MAP (
          Clock => Clock,
          IF_Input => IF_Input,
--          Signal_I1 => Signal_I1,
--          Signal_Q1 => Signal_Q1,
			 Baseband_Signal_Out => Baseband_Signal_Out,
			 Input_Noise_Mean_Out => Input_Noise_Mean_Out,
			 FFT_Output_Index_Out	=> FFT_Output_Index_Out,
			 FFT_Amp_Out		=>	FFT_Amp_Out
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

	Read_IF_Signal: process(Clock)
		file	input_text	: text open read_mode is "D:\Projects\37\Digital IFM\Simulation\IF_Input.txt";
		variable LI1		: line;
		variable LI1_var	: integer;
	begin
--		while not (endfile(input_text)) loop
		if rising_edge(Clock) then
			readline(input_text,LI1);
			read(LI1,LI1_var);
			IF_Input					<= to_signed(LI1_var,14);
--			wait for Clock_period;
--		end loop;
--		wait for Clock_period*7;
--		wait;
		end if;
	end process;



--	write_I_Signal: process(Clock)
--		file output_text	: text open write_mode is "D:\Projects\37\Digital IFM\Simulation\I_Sign_HDL.txt";
--		variable LO1		: line;
--		Variable counter	: unsigned(20 downto 0) := (others => '0');
--	begin
--		if rising_edge(Clock) then
----		while not (counter = to_unsigned(70001,21)) loop
--			write(LO1, to_integer(Signal_I1));
--			writeline(output_text , LO1);
--			counter						:= counter + 1;
----			wait for Clock_period;
----		end loop;
----		wait;
--		end if;
--	end process;






--	write_sqrt: process(Clock)
--		file output_text	: text open write_mode is "D:\Projects\37\Digital IFM\Simulation\SQRT_HDL.txt";
--		variable LO1		: line;
--		Variable counter	: unsigned(20 downto 0) := (others => '0');
--	begin
--		if rising_edge(Clock) then
----		while not (counter = to_unsigned(70001,21)) loop
--			write(LO1, to_integer(Baseband_Signal_Out));
--			writeline(output_text , LO1);
--			counter						:= counter + 1;
----			wait for Clock_period;
----		end loop;
----		wait;
--		end if;
--
--
--	end process;




	write_noise_mean: process(Clock)
		file output_text	: text open write_mode is "D:\Projects\37\Digital IFM\Simulation\Noise_Mean_HDL.txt";
		variable LO1		: line;
		Variable counter	: unsigned(20 downto 0) := (others => '0');
	begin
		if rising_edge(Clock) then
--		while not (counter = to_unsigned(70001,21)) loop
			write(LO1, to_integer(Input_Noise_Mean_Out));
			writeline(output_text , LO1);
			counter						:= counter + 1;
--			wait for Clock_period;
--		end loop;
--		wait;
		end if;


	end process;



	write_fft_amp: process(Clock)
		file output_text	: text open write_mode is "D:\Projects\37\Digital IFM\Simulation\FFT_Amp_HDL.txt";
		variable LO1		: line;
		Variable counter	: unsigned(20 downto 0) := (others => '0');
	begin
		if rising_edge(Clock) then
--		while not (counter = to_unsigned(70001,21)) loop
			write(LO1, conv_integer(FFT_Amp_Out));
			writeline(output_text , LO1);
			counter						:= counter + 1;
--			wait for Clock_period;
--		end loop;
--		wait;
		end if;


	end process;




	write_fft_index: process(Clock)
		file output_text	: text open write_mode is "D:\Projects\37\Digital IFM\Simulation\FFT_Output_Index_HDL.txt";
		variable LO1		: line;
		Variable counter	: unsigned(20 downto 0) := (others => '0');
	begin
		if rising_edge(Clock) then
--		while not (counter = to_unsigned(70001,21)) loop
			write(LO1, conv_integer(FFT_Output_Index_Out));
			writeline(output_text , LO1);
			counter						:= counter + 1;
--			wait for Clock_period;
--		end loop;
--		wait;
		end if;


	end process;



END;
