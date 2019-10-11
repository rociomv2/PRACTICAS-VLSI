library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity access_miROM is
    port ( 
		sw: IN  STD_LOGIC_VECTOR(3 downto 0);
		disp: OUT  STD_LOGIC_VECTOR(6 downto 0)
	 );
end access_miROM;

architecture Behavioral of access_miROM is
	signal data: STD_LOGIC_VECTOR(6 downto 0);

begin
seg_ROM:entity work.miROM
		port map(addr =>sw, data=>data);
		disp <= data;
end Behavioral;
