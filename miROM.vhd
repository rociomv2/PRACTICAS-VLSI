library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity miROM is
	 generic(
		addr_width: integer := 16; --#Localidades
		addr_bits: integer := 4;
		data_width: integer := 7
	 );
    port ( 
	 addr: IN  STD_LOGIC_VECTOR( addr_bits -1 downto 0);
	 data: OUT  STD_LOGIC_VECTOR( data_width -1 downto 0)
	 );
end miROM;

architecture Behavioral of miROM is
type rom_type is array (0 to addr_width -1) of STD_LOGIC_VECTOR(data_width -1 downto 0);
signal segmentos : rom_type :=
("1000000",--0

"1111001",--1

"0100100",--2

"0110000",--3

"0011001",--4

"0010010",--5

"0000010",--6
 
"1111000",--7

"0000000",--8

"0011000",--9
	 
"0001000",--A

"0000000",--B

"0100111",--C
			
"0100001",--D

"0000110",--E			
			
"0001110"--F

);

begin
	data <= segmentos(conv_integer(unsigned(addr)));
end Behavioral;
