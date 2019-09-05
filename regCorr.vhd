library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity regCorr is
    Port ( 
	 mclk : IN  STD_LOGIC;
    reset : IN  STD_LOGIC;
	 dir : IN STD_LOGIC;
	 leds : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
end regCorr;

architecture RTL of regCorr is
signal delay: integer range 0 to 64000000:=0; -- Reloj base 64 MHz
Signal corrimiento : STD_LOGIC_VECTOR (7 downto 0):=x"99";


begin

--Registro Corrimiento
regsitro: process(mclk)
begin
if( reset = '0') then
	if (rising_edge(mclk)) then
		if(dir = '0') then
		  corrimiento(7) <= corrimiento(0);
		  corrimiento(6) <= corrimiento(7);
		  corrimiento(5) <= corrimiento(6);
		  corrimiento(4) <= corrimiento(5);
		  corrimiento(3) <= corrimiento(4);
		  corrimiento(2) <= corrimiento(3);
		  corrimiento(1) <= corrimiento(2);
		  corrimiento(0) <= corrimiento(1);
		 else
		  corrimiento(0) <= corrimiento(7);
		  corrimiento(7) <= corrimiento(6);
		  corrimiento(6) <= corrimiento(5);
		  corrimiento(5) <= corrimiento(4);
		  corrimiento(4) <= corrimiento(3);
		  corrimiento(3) <= corrimiento(2);
		  corrimiento(2) <= corrimiento(1);
		  corrimiento(1) <= corrimiento(0);
		  end if;
	end if;
else
	corrimiento<=x"99";
end if;
leds <= corrimiento;
end process;


end RTL;
