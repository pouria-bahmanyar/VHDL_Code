library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Butterfly_Block_FFT is
    Port ( 
			 -------Butterfly inputs-------- 
			  X0_re : in  signed (15 downto 0);
           X0_im : in  signed (15 downto 0);
           X1_re : in  signed (15 downto 0);
           X1_im : in  signed (15 downto 0);
          -------Butterfly outputs------- 
			  F0_re : out  signed (16 downto 0);
           F0_im : out  signed (16 downto 0);
           F1_re : out  signed (16 downto 0);
           F1_im : out  signed (16 downto 0)
		  );
end Butterfly_Block_FFT;

architecture Behavioral of Butterfly_Block_FFT is
-----------------------------------------------------
--Signals & Decleration

-----------------------------------------------------
begin

			F0_re <= X0_re + resize(X1_re , 17);
			F0_im <= X0_im + resize(X1_im , 17);
			
			F1_re <= X0_re - resize(X1_re , 17);
			F1_im <= X0_im - resize(X1_im , 17);

end Behavioral;
