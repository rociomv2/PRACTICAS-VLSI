library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Meally is
    Port ( 
	 mclk: IN  STD_LOGIC;
    H: IN STD_LOGIC;
	 A, B: OUT STD_LOGIC
	 );
end Meally;

architecture RTL of Meally is
-- Crearemos un tipo de dato, llamado estados. Esto con la palabra "type"
type estado is(E0, E1, E2, E3);
signal edo_pres: estado := E0;
signal edo_sig: estado;


begin


--Proceso para asignar estados
asignacion: process(mclk)
begin
if(rising_edge(mclk)) then
	edo_pres <= edo_sig;
end if;

end process;

-- Vamos a crear un proceso para manejar las entradas y salidas
process(edo_pres,H)
begin
	case edo_pres is
		when E0 => 
			if(H = '0') then
				A <= '1';
				B <= '0';
				edo_sig <= E1;
			else
				A <= '0';
				B <= '0';
				edo_sig <= E0;
			end if;
			
		when E1 => 
			if(H = '0') then
				A <= '1';
				B <= '0';
				edo_sig <= E1;
			else
				A <= '0';
				B <= '0';
				edo_sig <= E2;
			end if;
			
		when E2 => 
			if(H = '0') then
				A <= '0';
				B <= '1';
				edo_sig <= E3;
			else
				A <= '0';
				B <= '0';
				edo_sig <= E2;
			end if;
  
		when E3 => 
			if(H = '0') then
				A <= '0';
				B <= '1';
				edo_sig <= E3;
			else
				A <= '0';
				B <= '0';
				edo_sig <= E0;
			end if;
			
		end case;
  
end process;

end RTL;