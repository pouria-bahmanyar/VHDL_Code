LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY Adder_Top_tb IS
END Adder_Top_tb;
 
ARCHITECTURE behavior OF Adder_Top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder_Top
    PORT(
         Clock : IN  std_logic;
         X : IN  unsigned(30 downto 0);
         Y : IN  unsigned(30 downto 0);
         S : OUT  unsigned(30 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal X : unsigned(30 downto 0) := (others => '0');
   signal Y : unsigned(30 downto 0) := (others => '0');

 	--Outputs
   signal S : unsigned(30 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder_Top PORT MAP (
          Clock => Clock,
          X => X,
          Y => Y,
          S => S
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
		X		<=	to_unsigned(15125261,31);
		y		<=	to_unsigned(652056405,31);
      wait;
   end process;

END;
