
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiplexer_4X1 is
    Port ( 
			  w0  : in   STD_LOGIC;
           w1  : in   STD_LOGIC;
           w2  : in   STD_LOGIC;
           w3  : in   STD_LOGIC;
           s   : in   unsigned(1 downto 0);
           En  : in   STD_LOGIC;
           f   : out  STD_LOGIC
		  );
end Multiplexer_4X1;

architecture Behavioral of Multiplexer_4X1 is
----------------------------------------------------
--Signals & Decleration
	signal SEn : unsigned (2 downto 0) := (others => '0');
----------------------------------------------------
begin

	SEn <= En & s;
	with SEn select
	f <=  w0  when "100",
			w1  when "101",
			w2  when "110",
			w3  when "111",
			'0' when others;
	

end Behavioral;

