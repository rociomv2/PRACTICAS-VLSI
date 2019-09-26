library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dron is
    Port ( 
	 mclk: IN  STD_LOGIC;
    Si: IN STD_LOGIC;
	 Sd: IN STD_LOGIC;
	 reset: IN STD_LOGIC;
	 display: OUT STD_LOGIC_VECTOR(6 downto 0);
	 leds: OUT STD_LOGIC_VECTOR(3 downto 0) --Son las salidas: ADELANTE, ATRÁS, GIRO_DER, GIRO_IZQ
	 );
end dron;

architecture Behavioral of dron is
type estado is(E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11);
signal edo_pres: estado := E0;
signal edo_sig: estado;
signal delay: integer range 0 to 50000000 := 0;
signal reloj: std_logic := '0';

begin
--Divisor de frecuencia
divisor: process (mclk)
begin
	if (rising_Edge(mclk)) then
		if (delay = 24999999) then
			delay <= 0;
			reloj <= not reloj;
		else
			delay <= delay +1;
		end if;
	end if;
end process;

--Proceso para asignar estados
asignacion: process(reloj)
begin
	if (rising_edge(reloj)) then
		edo_pres <= edo_sig;
	end if;
end process;

-- Proceso para manejar entradas y salidas de los estados
estados: process(edo_pres, Si, Sd)
begin
if (reset='0') then 
	case edo_pres is 
		when E0 => 
			display <= "1000000";--0 
			if (Si = not('0')) then
				if (Sd = not('0')) then
					leds <= "0001"; -- Adelante 
					edo_sig <= E0;
				else
					edo_sig <= E1;
				end if;
			else 
				if (Sd = not('0')) then
					edo_sig <= E3;
				else
					edo_sig <= E5;
				end if;
			end if;
		when E1 =>
			display <= "1111001";--1
			leds <= "0010"; -- Atrás 
			edo_sig <= E2;
		when E2 => 
			display <= "0100100"; --2___
			leds <= "1000"; -- Giro Izq
			edo_sig <= E0;
		when E3 => 
			display <= "0110000";--3
			leds <= "0010";
			edo_sig <= E4;
		when E4 => 
			display <= "0011001";--4
			leds <= "0100"; --Giro Der
			edo_sig <= E0;
		when E5 => 
			display <= "0010010";--5
			leds <= "0010";
			edo_sig <= E6;
		when E6 => 
			display <= "0000010";--6
			leds <= "1000";
			edo_sig <= E7;
		when E7 => 
			display <= "1111000";--7
			leds <= "1000";
			edo_sig <= E8;
		when E8 => 
			display <= "0000000";--8
			leds <= "0001";
			edo_sig <= E9;
		when E9 => 
			display <= "0011000";--9
			leds <= "0001";
			edo_sig <= E10;
		when E10 => 
			display <= "0001000";--A
			leds <= "0100";
			edo_sig <= E11;
		when E11 => 
			display <= "0000000";
			leds <= "0100";
			edo_sig <= E0;
	end case;
else
	edo_sig <= E0;
end if;
end process;


end Behavioral;