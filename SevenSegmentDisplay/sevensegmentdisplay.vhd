
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevensegmentdisplay is
	Port (
				clk: in STD_LOGIC;
				selector: out STD_LOGIC;
				Display: out STD_LOGIC_VECTOR(7 downto 0)
			);
end sevensegmentdisplay;

architecture Behavioral of sevensegmentdisplay is

begin

selector <= '0';

Display<="00000110";

end Behavioral;

