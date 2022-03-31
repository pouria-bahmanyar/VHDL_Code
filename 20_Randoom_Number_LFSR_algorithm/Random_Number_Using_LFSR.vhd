library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LFSR is
	
	port (		
				Clock 							: 	in  	std_logic;
				LFSR_Seed						: 	in 	unsigned(49 downto 0);
				LFSR_Wr							: 	in 	std_logic;
				LFSR_Start						: 	in 	std_logic;
				LFSR_Stop						: 	in 	std_logic;
				
				lfsr_output						: 	out 	unsigned(49 downto 0)
			);
end LFSR;

architecture Behavioral of LFSR is

		signal 	LFSR_Seed_Int					: unsigned(49 downto 0)		:=	(others=>'0');
		signal 	LFSR_Wr_Int						: std_logic						:=	'0';
		signal 	LFSR_Start_Int					: std_logic						:=	'0';
		signal 	LFSR_Stop_Int					: std_logic						:=	'0';
		
		signal 	lfsr_int 						: unsigned(49 downto 0)		:=	(others=>'0');
		signal 	a 									: unsigned(49 downto 0)		:=	(others=>'0');
		signal 	flag_begin						: std_logic						:=	'0';
		signal 	flag_stop						: std_logic						:=	'0';

begin

	lfsr_output <= lfsr_int;
	
	a(0) <= (lfsr_int(3) xor lfsr_int(5)) xor (lfsr_int(6) xor lfsr_int(7));
	a(1) <= (lfsr_int(4) xor lfsr_int(6)) xor (lfsr_int(7) xor lfsr_int(8));
	a(2) <= (lfsr_int(5) xor lfsr_int(7)) xor (lfsr_int(8) xor lfsr_int(9));
	a(3) <= (lfsr_int(6) xor lfsr_int(8)) xor (lfsr_int(9) xor lfsr_int(10));
	a(4) <= (lfsr_int(7) xor lfsr_int(9)) xor (lfsr_int(10) xor lfsr_int(11));
	a(5) <= (lfsr_int(8) xor lfsr_int(10)) xor (lfsr_int(11) xor lfsr_int(12));
	a(6) <= (lfsr_int(9) xor lfsr_int(11)) xor (lfsr_int(12) xor lfsr_int(13));
	a(7) <= (lfsr_int(10) xor lfsr_int(12)) xor (lfsr_int(13) xor lfsr_int(14));
	a(8) <= (lfsr_int(11) xor lfsr_int(13)) xor (lfsr_int(14) xor lfsr_int(15));
	a(9) <= (lfsr_int(12) xor lfsr_int(14)) xor (lfsr_int(15) xor lfsr_int(16));

	a(10) <= (lfsr_int(13) xor lfsr_int(15)) xor (lfsr_int(16) xor lfsr_int(17));
	a(11) <= (lfsr_int(14) xor lfsr_int(16)) xor (lfsr_int(17) xor lfsr_int(18));
	a(12) <= (lfsr_int(15) xor lfsr_int(17)) xor (lfsr_int(18) xor lfsr_int(19));
	a(13) <= (lfsr_int(16) xor lfsr_int(18)) xor (lfsr_int(19) xor lfsr_int(20));
	a(14) <= (lfsr_int(17) xor lfsr_int(19)) xor (lfsr_int(20) xor lfsr_int(21));
	a(15) <= (lfsr_int(18) xor lfsr_int(20)) xor (lfsr_int(21) xor lfsr_int(22));
	a(16) <= (lfsr_int(19) xor lfsr_int(21)) xor (lfsr_int(22) xor lfsr_int(23));
	a(17) <= (lfsr_int(20) xor lfsr_int(22)) xor (lfsr_int(23) xor lfsr_int(24));
	a(18) <= (lfsr_int(21) xor lfsr_int(23)) xor (lfsr_int(24) xor lfsr_int(25));
	a(19) <= (lfsr_int(22) xor lfsr_int(24)) xor (lfsr_int(25) xor lfsr_int(26));

	a(20) <= (lfsr_int(23) xor lfsr_int(25)) xor (lfsr_int(26) xor lfsr_int(27));
	a(21) <= (lfsr_int(24) xor lfsr_int(26)) xor (lfsr_int(27) xor lfsr_int(28));
	a(22) <= (lfsr_int(25) xor lfsr_int(27)) xor (lfsr_int(28) xor lfsr_int(29));
	a(23) <= (lfsr_int(26) xor lfsr_int(28)) xor (lfsr_int(29) xor lfsr_int(30));
	a(24) <= (lfsr_int(27) xor lfsr_int(29)) xor (lfsr_int(30) xor lfsr_int(31));
	a(25) <= (lfsr_int(28) xor lfsr_int(30)) xor (lfsr_int(31) xor lfsr_int(32));
	a(26) <= (lfsr_int(29) xor lfsr_int(31)) xor (lfsr_int(32) xor lfsr_int(33));
	a(27) <= (lfsr_int(30) xor lfsr_int(32)) xor (lfsr_int(33) xor lfsr_int(34));
	a(28) <= (lfsr_int(31) xor lfsr_int(33)) xor (lfsr_int(34) xor lfsr_int(35));
	a(29) <= (lfsr_int(32) xor lfsr_int(34)) xor (lfsr_int(35) xor lfsr_int(36));

	a(30) <= (lfsr_int(33) xor lfsr_int(35)) xor (lfsr_int(36) xor lfsr_int(37));
	a(31) <= (lfsr_int(34) xor lfsr_int(36)) xor (lfsr_int(37) xor lfsr_int(38));
	a(32) <= (lfsr_int(35) xor lfsr_int(37)) xor (lfsr_int(38) xor lfsr_int(39));
	a(33) <= (lfsr_int(36) xor lfsr_int(38)) xor (lfsr_int(39) xor lfsr_int(40));
	a(34) <= (lfsr_int(37) xor lfsr_int(39)) xor (lfsr_int(40) xor lfsr_int(41));
	a(35) <= (lfsr_int(38) xor lfsr_int(40)) xor (lfsr_int(41) xor lfsr_int(42));
	a(36) <= (lfsr_int(39) xor lfsr_int(41)) xor (lfsr_int(42) xor lfsr_int(43));
	a(37) <= (lfsr_int(40) xor lfsr_int(42)) xor (lfsr_int(43) xor lfsr_int(44));
	a(38) <= (lfsr_int(41) xor lfsr_int(43)) xor (lfsr_int(44) xor lfsr_int(45));
	a(39) <= (lfsr_int(42) xor lfsr_int(44)) xor (lfsr_int(45) xor lfsr_int(46));

	a(40) <= (lfsr_int(43) xor lfsr_int(45)) xor (lfsr_int(46) xor lfsr_int(47));
	a(41) <= (lfsr_int(44) xor lfsr_int(46)) xor (lfsr_int(47) xor lfsr_int(48));
	a(42) <= (lfsr_int(45) xor lfsr_int(47)) xor (lfsr_int(48) xor lfsr_int(49));
	
	a(43) <= ((lfsr_int(0) xor lfsr_int(2)) xor (lfsr_int(3) xor lfsr_int(4))) xor ((lfsr_int(46) xor lfsr_int(48)) xor (lfsr_int(49)));
	a(44) <= ((lfsr_int(0) xor lfsr_int(1)) xor (lfsr_int(2) xor lfsr_int(5))) xor ((lfsr_int(47) xor lfsr_int(49)));
	
	a(45) <= ((lfsr_int(0) xor lfsr_int(1)) xor (lfsr_int(4) xor lfsr_int(6))) xor ((lfsr_int(48)));
	a(46) <= ((lfsr_int(1) xor lfsr_int(2)) xor (lfsr_int(5) xor lfsr_int(7))) xor ((lfsr_int(49)));

	a(47) <= (lfsr_int(0) xor lfsr_int(4)) xor (lfsr_int(6) xor lfsr_int(8));
	a(48) <= (lfsr_int(1) xor lfsr_int(5)) xor (lfsr_int(7) xor lfsr_int(9));
	a(49) <= (lfsr_int(2) xor lfsr_int(6)) xor (lfsr_int(8) xor lfsr_int(10));


	process(Clock)
	begin						  
		if (rising_edge(Clock)) then
			
			LFSR_Seed_Int					<=		LFSR_Seed;
			LFSR_Wr_Int						<=		LFSR_Wr;
			LFSR_Start_Int					<=		LFSR_Start;
			LFSR_Stop_Int					<=		LFSR_Stop;
			
			if (LFSR_Start_Int = '1') then
				flag_begin 					<= 	'1';
			end if;

			if (LFSR_Stop_Int = '1') then
				flag_stop 					<= 	'1';
			end if;
			
			if (flag_begin='1') then
				lfsr_int 					<= 	a;
			end if;

			if (flag_stop='1') then
				lfsr_int 					<= 	(others=>'0');
			end if;			
								
			if (LFSR_Wr_Int = '1') then
				lfsr_int 					<= 	LFSR_Seed_Int;
			end if;
						
		end if;
	end process;
	
end;
