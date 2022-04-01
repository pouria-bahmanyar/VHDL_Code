--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:38:59 12/01/2021
-- Design Name:   
-- Module Name:   G:/VHDL_CODE/example_session_1/Sequence_Detector/Sequence_detector_TestBench.vhd
-- Project Name:  Sequence_Detector
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sequence_Detector
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Sequence_detector_TestBench IS
END Sequence_detector_TestBench;
 
ARCHITECTURE behavior OF Sequence_detector_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sequence_Detector
    PORT(
         Input : IN  std_logic;
         Clock : IN  std_logic;
         Alarm : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Input : std_logic := '0';
   signal Clock : std_logic := '0';

 	--Outputs
   signal Alarm : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sequence_Detector PORT MAP (
          Input => Input,
          Clock => Clock,
          Alarm => Alarm
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clock_period*10;

      -- insert stimulus here 
		input <= '1';
		wait for Clock_period;
		input <= '1';
		wait for Clock_period;
		input <= '0';
		wait for Clock_period;
		input <= '0';
		wait for Clock_period;
		input <= '1';
		wait for Clock_period;
		input <= '1';
		wait for Clock_period;
		input <= '0';
		wait for Clock_period;
		input <= '0';
		wait for Clock_period;
		input <= '1';
		wait for Clock_period;
		input <= '1';
		wait for Clock_period;
      wait;
   end process;

END;
