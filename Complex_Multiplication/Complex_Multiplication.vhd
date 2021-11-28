Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;
Use IEEE.NUMERIC_STD.ALL;

Entity Multiplication Is
   	
	Port (		------- Input Signals -----
		Signal_A_Real				: 	In 		Signed	(17 downto 0);
		Signal_A_Image				: 	In 		Signed	(17 downto 0);
		Signal_B_Real 				: 	In 		Signed	(13 downto 0);
		Signal_B_Image 			: 	In 		Signed	(13 downto 0);

					------- Output Signals -----
		Signal_C_Real				: 	Out		Signed	(31 downto 0);
		Signal_C_Image				: 	Out		Signed	(31 downto 0);

		Clock							:	In			std_logic
	);

End Multiplication;

Architecture Behavioral Of Multiplication Is
		
		signal 	Signal_A_Real_Internal 					:	Signed	(17 downto 0) 	:=	(others=>'0');
		signal 	Signal_A_Image_Internal					:	Signed	(17 downto 0) 	:=	(others=>'0');
		signal 	Signal_B_Real_Internal					:	Signed	(13 downto 0) 	:=	(others=>'0');
		signal 	Signal_B_Image_Internal					:	Signed	(13 downto 0) 	:=	(others=>'0');
		signal 	Signal_C_Real_Internal 					:	Signed	(31 downto 0) 	:=	(others=>'0');
		signal 	Signal_C_Image_Internal					: 	Signed	(31 downto 0) 	:=	(others=>'0');
	
		signal 	Xbrr 											: 	Signed	(31 downto 0) 	:=	(others=>'0');
		signal 	Xbir 											: 	Signed	(31 downto 0) 	:=	(others=>'0');
		signal 	Xbri 											: 	Signed	(31 downto 0) 	:=	(others=>'0');
		signal 	Xbii 											: 	Signed	(31 downto 0) 	:=	(others=>'0');

begin

		Signal_C_Real									<=		Signal_C_Real_Internal;
		Signal_C_Image									<=		Signal_C_Image_Internal;
	
data:	process(Clock)
		begin
		
		if(rising_edge(Clock)) then
				
			Signal_A_Real_Internal 					<= 	Signal_A_Real;
			Signal_A_Image_Internal 				<= 	Signal_A_Image;
			Signal_B_Real_Internal 					<= 	Signal_B_Real;
			Signal_B_Image_Internal					<=	 	Signal_B_Image;	

			Xbrr 											<= 	Signal_A_Real_Internal 		* 	Signal_B_Real_Internal;
			Xbir 											<= 	Signal_A_Image_Internal 	* 	Signal_B_Real_Internal;
			Xbri 											<= 	Signal_A_Real_Internal 		* 	Signal_B_Image_Internal;
			Xbii 											<= 	Signal_A_Image_Internal 	* 	Signal_B_Image_Internal;

			Signal_C_Real_Internal					<= 	Xbrr	-	Xbii;
			Signal_C_Image_Internal					<= 	Xbir	+	Xbri;
					
		end if;
		
	end process;

	
	
End;




