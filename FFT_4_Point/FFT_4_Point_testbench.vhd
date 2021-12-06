--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:54:34 12/06/2021
-- Design Name:   
-- Module Name:   G:/VHDL_CODE/FFT_4_Point/FFT_4_Point_testbench.vhd
-- Project Name:  FFT_4_Point
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FFT_4_point
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- signed for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY FFT_4_Point_testbench IS
END FFT_4_Point_testbench;
 
ARCHITECTURE behavior OF FFT_4_Point_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FFT_4_point
    PORT(
         Clock : IN  std_logic;
         X0_re : IN  signed(15 downto 0);
         X0_im : IN  signed(15 downto 0);
         X1_re : IN  signed(15 downto 0);
         X1_im : IN  signed(15 downto 0);
         X2_re : IN  signed(15 downto 0);
         X2_im : IN  signed(15 downto 0);
         X3_re : IN  signed(15 downto 0);
         X3_im : IN  signed(15 downto 0);
         F0_re : OUT  signed(16 downto 0);
         F0_im : OUT  signed(16 downto 0);
         F1_re : OUT  signed(16 downto 0);
         F1_im : OUT  signed(16 downto 0);
         F2_re : OUT  signed(16 downto 0);
         F2_im : OUT  signed(16 downto 0);
         F3_re : OUT  signed(16 downto 0);
         F3_im : OUT  signed(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal X0_re : signed(15 downto 0) := (others => '0');
   signal X0_im : signed(15 downto 0) := (others => '0');
   signal X1_re : signed(15 downto 0) := (others => '0');
   signal X1_im : signed(15 downto 0) := (others => '0');
   signal X2_re : signed(15 downto 0) := (others => '0');
   signal X2_im : signed(15 downto 0) := (others => '0');
   signal X3_re : signed(15 downto 0) := (others => '0');
   signal X3_im : signed(15 downto 0) := (others => '0');

 	--Outputs
   signal F0_re : signed(16 downto 0);
   signal F0_im : signed(16 downto 0);
   signal F1_re : signed(16 downto 0);
   signal F1_im : signed(16 downto 0);
   signal F2_re : signed(16 downto 0);
   signal F2_im : signed(16 downto 0);
   signal F3_re : signed(16 downto 0);
   signal F3_im : signed(16 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FFT_4_point PORT MAP (
          Clock => Clock,
          X0_re => X0_re,
          X0_im => X0_im,
          X1_re => X1_re,
          X1_im => X1_im,
          X2_re => X2_re,
          X2_im => X2_im,
          X3_re => X3_re,
          X3_im => X3_im,
          F0_re => F0_re,
          F0_im => F0_im,
          F1_re => F1_re,
          F1_im => F1_im,
          F2_re => F2_re,
          F2_im => F2_im,
          F3_re => F3_re,
          F3_im => F3_im
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
		X0_re		<=		to_signed(7,16);
		X0_im		<=		to_signed(1,16);
		X1_re		<=		to_signed(5,16);
		X1_im		<=		to_signed(-4,16);
		X2_re		<=		to_signed(3,16);
		X2_im		<=		to_signed(23,16);
		X3_re		<=		to_signed(9,16);
		X3_im		<=		to_signed(-2,16);


      wait;
   end process;

END;
