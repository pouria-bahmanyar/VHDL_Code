library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DDS_Serial_Programm is

    Port ( 
				Clock 								: in  STD_LOGIC;
				DDS_Serial_Data 					: in  unsigned (63 downto 0);
				DDS_Serial_Address 				: in	unsigned	(7 downto 0);
				DDS_Start_Serial_Transmission : in  STD_LOGIC;
				DDS_IO_Reset 						: out STD_LOGIC;
				DDS_SDIO 							: out STD_LOGIC;
				DDS_SCLK 							: out STD_LOGIC;
				DDS_Serial_Busy 					: out	STD_LOGIC
			);
			
end DDS_Serial_Programm;

architecture Behavioral of DDS_Serial_Programm is

	signal	DDS_Serial_Data_Int						:	unsigned(63 downto 0)			:=	(others=>'0');
	signal	DDS_Serial_Data_Buff						:	unsigned(63 downto 0)			:=	(others=>'0');
	signal	DDS_Serial_Address_Int					:	unsigned(7 downto 0)				:=	(others=>'0');
	signal	DDS_Serial_Address_Buff					:	unsigned(7 downto 0)				:=	(others=>'0');
	signal	DDS_Start_Serial_Transmission_Int	:	std_logic							:=	'0';
	signal	DDS_Start_Serial_Transmission_Prev	:	std_logic							:=	'0';
	signal	DDS_IO_Reset_Int							:	std_logic							:=	'0';
	signal	DDS_SDIO_Int								:	std_logic							:=	'0';
	signal	DDS_SCLK_Int								:	std_logic							:=	'0';
	signal	DDS_Serial_Busy_Int						:	std_logic							:=	'0';
	signal	DDS_Serial_Busy_State					:	std_logic							:=	'0';
	signal	DDS_Address_Transmission_State		:	std_logic							:=	'0';
	signal	DDS_Data_Transmission_State			:	std_logic							:=	'0';
	
	type		DDS_Serial_Data_Length_Array	is	array (0 to 23) of unsigned(5 downto 0);
	constant	DDS_Serial_Data_Length_Bank			:	DDS_Serial_Data_Length_Array	:=	(	to_unsigned(31,6), 
																													to_unsigned(31,6), 
																													to_unsigned(31,6), 
																													to_unsigned(31,6), 
																													to_unsigned(31,6), 
																													to_unsigned(47,6), 
																													to_unsigned(47,6), 
																													to_unsigned(31,6), 
																													to_unsigned(15,6), 
																													to_unsigned(31,6), 
																													to_unsigned(31,6), 
																													to_unsigned(63,6), 
																													to_unsigned(63,6), 
																													to_unsigned(31,6), 
																													to_unsigned(63,6), 
																													to_unsigned(63,6), 
																													to_unsigned(63,6), 
																													to_unsigned(63,6), 
																													to_unsigned(63,6), 
																													to_unsigned(63,6), 
																													to_unsigned(63,6), 
																													to_unsigned(63,6), 
																													to_unsigned(31,6),
																													to_unsigned(0,6)); 
																													
	signal	DDS_Serial_Data_Bit_Counter			:	unsigned	(5 downto 0)			:=	(others=>'1');
	signal	DDS_Serial_Address_Bit_Counter		:	unsigned	(2 downto 0)			:=	(others=>'1');
	
begin

	DDS_IO_Reset							<=	DDS_IO_Reset_Int;
	DDS_SDIO									<=	DDS_SDIO_Int;
	DDS_SCLK									<=	DDS_SCLK_Int and DDS_Serial_Busy_Int;
	DDS_Serial_Busy						<=	DDS_Serial_Busy_Int;
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			DDS_Serial_Data_Int							<=	DDS_Serial_Data;
			DDS_Serial_Address_Int						<=	DDS_Serial_Address;
			DDS_Start_Serial_Transmission_Int		<=	DDS_Start_Serial_Transmission;
			DDS_Start_Serial_Transmission_Prev		<=	DDS_Start_Serial_Transmission_Int;
			DDS_Serial_Busy_State						<=	'0';
			DDS_SCLK_Int									<=	not DDS_SCLK_Int;
			DDS_IO_Reset_Int								<=	'0';
			DDS_SDIO_Int									<=	'1';			
			DDS_Serial_Busy_Int							<=	'0';
			
			if (DDS_Start_Serial_Transmission_Int = '1' and DDS_Start_Serial_Transmission_Prev = '0' and DDS_Serial_Busy_Int = '0') then
			
				DDS_IO_Reset_Int							<=	'1';
				DDS_Data_Transmission_State			<=	'0';
				DDS_Address_Transmission_State		<=	'1';
				DDS_Serial_Busy_Int						<=	'1';
				DDS_Serial_Data_Buff						<=	DDS_Serial_Data_Int;
				DDS_Serial_Address_Buff					<=	DDS_Serial_Address_Int;
				DDS_Serial_Address_Bit_Counter		<=	to_unsigned(7,3);
				DDS_SCLK_Int								<=	'1';
								
			end if;	
			
			if (DDS_Address_Transmission_State = '1') then	
			
				DDS_SDIO_Int								<=	DDS_Serial_Address_Buff(to_integer(DDS_Serial_Address_Bit_Counter));			
				DDS_Serial_Busy_Int						<=	'1';

				if (DDS_SCLK_Int = '0') then			
					DDS_Serial_Address_Bit_Counter	<=	DDS_Serial_Address_Bit_Counter - 1;									
				end if;			

				if (DDS_Serial_Address_Bit_Counter = to_unsigned(0,3) and DDS_SCLK_Int = '0') then
				
					DDS_Data_Transmission_State		<=	'1';
					DDS_Address_Transmission_State	<=	'0';
					DDS_Serial_Data_Bit_Counter		<=	DDS_Serial_Data_Length_Bank(to_integer(DDS_Serial_Address_Buff(4 downto 0)));
					
				end if;			
			
			end if;
			
			if (DDS_Data_Transmission_State = '1') then
			
				DDS_SDIO_Int								<=	DDS_Serial_Data_Buff(to_integer(DDS_Serial_Data_Bit_Counter));						
				DDS_Serial_Busy_Int						<=	'1';
			
				if (DDS_SCLK_Int = '0') then			
					DDS_Serial_Data_Bit_Counter		<=	DDS_Serial_Data_Bit_Counter - 1;									
				end if;

				if (DDS_Serial_Data_Bit_Counter = to_unsigned(0,6) and DDS_SCLK_Int = '0') then
				
					DDS_Data_Transmission_State		<=	'0';
					DDS_Serial_Busy_State				<=	'1';
											
				end if;							
			
			end if;
			
			if (DDS_Serial_Busy_State = '1') then
				DDS_Serial_Busy_Int						<=	'1';
			end if;
				
		end if;
		
	end process;
	
end Behavioral;