library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Moore is
    Port ( 
	 mclk: IN  STD_LOGIC;
    H: IN STD_LOGIC;
	 A, B: OUT STD_LOGIC
	 );
end Moore;

architecture RTL of Moore is
-- Crearemos un tipo de dato, llamado estados. Esto con la palabra "type"
type estado is(E0, E1, E2, E3);
signal qt: estado := E0;

-- La señal debe de ser de tipo estado, en nuestra tdt va a simular el Edo sig(qt)
begin

-- Vamos a crear un proceso que nos ayude a cambiar de estados y a decidir qué hacer en cada estado
process(mclk)
begin
	if (rising_edge(mclk)) then
		case qt is
		-- Como es una máquina de moore, puedo activar las salidas. H solo nos va a indicar el cambio de edo
			when E0 => 
				A <= '0';
				B <= '0';
				if (H = '0') then
					qt <= E1;
				else
					qt <= E0;
				end if;
			when E1 =>
				A <= '1';
				B <= '0';
				if (H = '0') then
					qt <= E1;
				else
					qt <= E2;
				end if;
			when E2 =>
				A <= '0';
				B <= '0';
				if (H = '0') then
					qt <= E3;
				else
					qt <= E2;
				end if;
			when E3 =>
				A <= '0';
				B <= '1';
				if (H = '0') then
					qt <= E3;
				else
					qt <= E0;
				end if;
		end case;
	end if;
  
end process;

end RTL;