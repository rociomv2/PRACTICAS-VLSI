library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pwm_led is
	Port( mclk : IN STD_LOGIC;
			selec : IN STD_LOGIC_VECTOR(3 downto 0);
			led : OUT STD_LOGIC
			);
end pwm_led;

architecture Behavorial of pwm_led is
--Constantes de cuenta
constant a1: integer := 26042; 
constant a2: integer := 52085; 
constant a3: integer := 78127; 
constant a4: integer := 104170; 
constant a5: integer := 130213; 
constant a6: integer := 156255; 
constant a7: integer := 182298; 
constant a8: integer := 208341; 
constant a9: integer := 234383; 
constant a10: integer := 260426; 
constant a11: integer := 286468; 
constant a12: integer := 312511; 
constant a13: integer := 338554;  
constant a14: integer := 364596; 
constant a15: integer := 390639; 
constant a16: integer := 416681;  


Signal PWM_Count: std_logic_vector (19 downto 0 ):="00000000000000000000";--416667, señal que lleva la cuenta
begin


generacion_PWM: process( mclk,PWM_Count ) --Generación del contador
          begin
			    if rising_edge(mclk)then 
					PWM_Count <= PWM_Count + 1;
             end if;
				 if PWM_Count = x"65BB2" then
					PWM_Count <= "00000000000000000000";
				 end if;
				 
end process generacion_PWM;

salidas : process(PWM_Count,selec) is --Process para la modulación del ancho de pulso
	begin
	case selec is
		when "0000" => 
			 if PWM_Count <= a1 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;  

		when "0001" => 
			 if PWM_Count <= a2 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;  
												
		when "0010" => 
			 if PWM_Count <= a3 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;  
			 
		when "0011" => 
			 if PWM_Count <= a4 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;  
			 
		when "0100" => 
			 if PWM_Count <= a5 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;
			 
		when "0101" => 
			 if PWM_Count <= a6 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;
			 
		when "0110" => 
			 if PWM_Count <= a7 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;
			 
		when "0111" => 
			 if PWM_Count <= a8 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;
			 
		when "1000" => 
			 if PWM_Count <= a9 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;
			 
		when "1001" => 
			 if PWM_Count <= a10 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;
			 
		when "1010" => 
			 if PWM_Count <= a11 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;
		
		when "1011" => 
			 if PWM_Count <= a12 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;
			 
		when "1100" => 
			 if PWM_Count <= a13 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;
			 
		when "1101" => 
			 if PWM_Count <= a14 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;
		
		when "1110" => 
			 if PWM_Count <= a15 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;
			 
		when "1111" => 
			 if PWM_Count <= a16 then 
					led <= '1';
          else                                        
					led <= '0';
          end if;

	end case;

end process;
end Behavorial;