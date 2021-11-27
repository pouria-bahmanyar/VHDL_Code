--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:53:12 11/27/2021
-- Design Name:   
-- Module Name:   G:/VHDL_CODE/example_session_1/signed_adder/sigend_adder_TestBench.vhd
-- Project Name:  signed_adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: signed_adder
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
 
ENTITY sigend_adder_TestBench IS
END sigend_adder_TestBench;
 
ARCHITECTURE behavior OF sigend_adder_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT signed_adder
    PORT(
         A    : IN 		 signed(15 downto 0);
         B    : IN  		 signed(15 downto 0);
         Cin  : IN 	    signed(0 downto 0);
         Cout : OUT      std_logic;
         Sum  : OUT      signed(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A :   signed(15 downto 0) := (others => '0');
   signal B :   signed(15 downto 0) := (others => '0');
   signal Cin : signed(0 downto 0)  := (others => '0');

 	--Outputs
   signal Cout : std_logic;
   signal Sum : signed(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: signed_adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		A   <= "1000001000010101";
		B   <= "1011101010010101";
		Cin <= "0";
      wait;
   end process;

END;
