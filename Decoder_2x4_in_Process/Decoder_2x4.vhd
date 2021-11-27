library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_2x4 is
    Port (  
			  x     :     in   STD_LOGIC_VECTOR (1 downto 0);
           y     :     out  STD_LOGIC_VECTOR (3 downto 0);
           En    :     in   STD_LOGIC    
			  );
end Decoder_2x4; 

architecture Behavioral of Decoder_2x4 is

begin
  process (x , En)
  begin
  
  
		case x is
			when "00"  =>
				y <= "0001";
			when "01"  =>
				y <= "0010";
			when "10"  =>
				y <= "0100";
			when others  =>
				y <= "1000";
		end case;
		
		
		if En = '0' then
			y <= "0000";
		end if;	
  
  end process;

end Behavioral;

