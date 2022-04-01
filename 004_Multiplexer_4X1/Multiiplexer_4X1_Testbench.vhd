--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:57:11 11/27/2021
-- Design Name:   
-- Module Name:   G:/VHDL_CODE/example_session_1/Multiplexer_4X1/Multiiplexer_4X1_Testbench.vhd
-- Project Name:  Multiplexer_4X1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Multiplexer_4X1
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
 
ENTITY Multiiplexer_4X1_Testbench IS
END Multiiplexer_4X1_Testbench;
 
ARCHITECTURE behavior OF Multiiplexer_4X1_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplexer_4X1
    PORT(
         w0 : IN   std_logic;
         w1 : IN   std_logic;
         w2 : IN   std_logic;
         w3 : IN   std_logic;
         s  : IN   unsigned(1 downto 0);
         En : IN   std_logic;
         f  : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal w0 : std_logic := '0';
   signal w1 : std_logic := '0';
   signal w2 : std_logic := '0';
   signal w3 : std_logic := '0';
   signal s  : unsigned(1 downto 0) := (others => '0');
   signal En : std_logic := '0';

 	--Outputs
   signal f : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_4X1 PORT MAP (
          w0 => w0,
          w1 => w1,
          w2 => w2,
          w3 => w3,
          s => s,
          En => En,
          f => f
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		w0 <= '1';
		w1 <= '1';
		w2 <= '0';
		w3 <= '0';
		s  <= "00";
		En <= '1';
      wait;
   end process;

END;
