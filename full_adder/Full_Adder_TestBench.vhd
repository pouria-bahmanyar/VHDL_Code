--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:35:08 11/27/2021
-- Design Name:   
-- Module Name:   G:/VHDL_CODE/example_session_1/Full_Adder/Full_Adder_TestBench.vhd
-- Project Name:  Full_Adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Full_Adder_4bit
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Full_Adder_TestBench IS
END Full_Adder_TestBench;
 
ARCHITECTURE behavior OF Full_Adder_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder_4bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0);
         Cou : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);
   signal Cou : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder_4bit PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Sum => Sum,
          Cou => Cou
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

      -- insert stimulus here 
		A   <= "0110";
		B   <= "0011";
		Cin <= '1';

      wait;
   end process;

END;
