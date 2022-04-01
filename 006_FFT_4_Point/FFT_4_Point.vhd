----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:54 12/06/2021 
-- Design Name: 
-- Module Name:    FFT_4_point - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FFT_4_point is
    Port ( 
			  --------inputs--------
			  Clock : in	std_logic;
			  X0_re : in   signed (15 downto 0);
           X0_im : in   signed (15 downto 0);
			  X1_re : in   signed (15 downto 0);
           X1_im : in   signed (15 downto 0);		  
			  X2_re : in   signed (15 downto 0);
           X2_im : in   signed (15 downto 0);
			  X3_re : in   signed (15 downto 0);
           X3_im : in   signed (15 downto 0);
			  
			  --------outputs-------
           F0_re : out  signed (16 downto 0);
           F0_im : out  signed (16 downto 0);			  
			  F1_re : out  signed (16 downto 0);
           F1_im : out  signed (16 downto 0);			  
			  F2_re : out  signed (16 downto 0);
           F2_im : out  signed (16 downto 0);		  
			  F3_re : out  signed (16 downto 0);
           F3_im : out  signed (16 downto 0)
			 
		   );
end FFT_4_point;

architecture Behavioral of FFT_4_point is
----------------------------------------------
	COMPONENT Butterfly_Block_FFT
	PORT(
		X0_re : IN signed(15 downto 0);
		X0_im : IN signed(15 downto 0);
		X1_re : IN signed(15 downto 0);
		X1_im : IN signed(15 downto 0);          
		F0_re : OUT signed(16 downto 0);
		F0_im : OUT signed(16 downto 0);
		F1_re : OUT signed(16 downto 0);
		F1_im : OUT signed(16 downto 0)
		);
	END COMPONENT;
	---------------inputs----------------
		signal X0_re_in_int   : signed (15 downto 0) := (others => '0');
		signal X0_im_in_int   : signed (15 downto 0) := (others => '0');
		signal X1_re_in_int   : signed (15 downto 0) := (others => '0');
		signal X1_im_in_int   : signed (15 downto 0) := (others => '0');
		signal X2_re_in_int   : signed (15 downto 0) := (others => '0');
		signal X2_im_in_int   : signed (15 downto 0) := (others => '0');
		signal X3_re_in_int   : signed (15 downto 0) := (others => '0');
		signal X3_im_in_int   : signed (15 downto 0) := (others => '0');
		
		signal X0_re_in_int_temp   : signed (15 downto 0) := (others => '0');
		signal X0_im_in_int_temp   : signed (15 downto 0) := (others => '0');
		signal X1_re_in_int_temp   : signed (15 downto 0) := (others => '0');
		signal X1_im_in_int_temp   : signed (15 downto 0) := (others => '0');
		signal X2_re_in_int_temp   : signed (15 downto 0) := (others => '0');
		signal X2_im_in_int_temp   : signed (15 downto 0) := (others => '0');
		signal X3_re_in_int_temp   : signed (15 downto 0) := (others => '0');
		signal X3_im_in_int_temp   : signed (15 downto 0) := (others => '0');
		
	---------internal_signals-----------
		signal X0_re_out_temp : signed (16 downto 0) := (others => '0');
		signal X0_im_out_temp : signed (16 downto 0) := (others => '0');
		signal X1_re_out_temp : signed (16 downto 0) := (others => '0');
		signal X1_im_out_temp : signed (16 downto 0) := (others => '0');
		signal X2_re_out_temp : signed (16 downto 0) := (others => '0');
		signal X2_im_out_temp : signed (16 downto 0) := (others => '0');
		signal X3_re_out_temp : signed (16 downto 0) := (others => '0');
		signal X3_im_out_temp : signed (16 downto 0) := (others => '0');
----------------------------------------------
begin
	Inst_Butterfly_1: Butterfly_Block_FFT PORT MAP(
		X0_re => X0_re_in_int,
		X0_im => X0_im_in_int,
		X1_re => X2_re_in_int,
		X1_im => X2_im_in_int,
		
		F0_re => X0_re_out_temp,
		F0_im => X0_im_out_temp,
		F1_re => X2_re_out_temp,
		F1_im => X2_im_out_temp
	);
	Inst_Butterfly_2: Butterfly_Block_FFT PORT MAP(
		X0_re => X1_re_in_int,
		X0_im => X1_im_in_int,
		X1_re => X3_re_in_int,
		X1_im => X3_im_in_int,
		
		F0_re => X1_re_out_temp,
		F0_im => X1_im_out_temp,
		F1_re => X3_re_out_temp,
		F1_im => X3_im_out_temp
	);
	Inst_Butterfly_3: Butterfly_Block_FFT PORT MAP(
		X0_re => X0_re_in_int_temp,
		X0_im => X0_im_in_int_temp,
		X1_re => X1_re_in_int_temp,
		X1_im => X1_im_in_int_temp,
		
		F0_re => F0_re,
		F0_im => F0_im,
		F1_re => F2_re,
		F1_im => F2_im
	);
	Inst_Butterfly_4: Butterfly_Block_FFT PORT MAP(
		X0_re => X2_re_in_int_temp,
		X0_im => X2_im_in_int_temp,
		X1_re => X3_re_in_int_temp,
		X1_im => X3_im_in_int_temp,
		
		F0_re => F1_re,
		F0_im => F1_im,
		F1_re => F3_re,
		F1_im => F3_im
	);



process(Clock)
begin
	if rising_edge(clock) then
	-----------------------------------
		X0_re_in_int <= X0_re;
		X0_im_in_int <= X0_im;
		
		X1_re_in_int <= X1_re;
		X1_im_in_int <= X1_im;
		
		X2_re_in_int <= X2_re;
		X2_im_in_int <= X2_im;
		
		X3_re_in_int <= X3_re;
		X3_im_in_int <= X3_im;
		
		X0_re_in_int_temp <= 	 resize(X0_re_out_temp , 16);
		X0_im_in_int_temp <= 	 resize(X0_im_out_temp , 16);
		
		X1_re_in_int_temp <= 	 resize(X1_re_out_temp , 16);
		X1_im_in_int_temp <=     resize(X1_im_out_temp , 16);
		
		X2_re_in_int_temp <= 	 resize(X2_re_out_temp , 16);
		X2_im_in_int_temp <=     resize(X2_im_out_temp , 16);
		
		X3_re_in_int_temp <=     resize(X3_im_out_temp , 16);
		X3_im_in_int_temp <= 0 - resize(X3_re_out_temp , 16);
		
	end if;
end process;

end Behavioral;



