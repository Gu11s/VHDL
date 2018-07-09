library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity MAQUINA is
    Port (
        CLOCK : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
		  PUSH : in STD_LOGIC;
        LED0 : out STD_LOGIC;
		  LED1 : out STD_LOGIC;
		  LED2 : out STD_LOGIC;
		  LED3 : out STD_LOGIC;
		  LEDC : out STD_LOGIC:='0';
		  LED5 : out STD_LOGIC;
		  LED6 : out STD_LOGIC;
		  LED7 : out STD_LOGIC
    );
end MAQUINA;
 
architecture Behavioral of MAQUINA is

signal CONTADOR: integer range 0 to 11999999:= 0;

type ESTADOS is (START,HOUSE_A,UNIT_2,SUFFIX,FIN);
signal ACTUAL,SIGUIENTE : ESTADOS;

signal ledout: STD_LOGIC_VECTOR (7 DOWNTO 0);

begin

process (RESET, CLOCK, PUSH) 
variable activo: natural range 0 to 1 := 0; 	
begin

	if (RESET = '0') then
      ledout <= "00000000";
		CONTADOR <= 0;
		ACTUAL <= START;
		activo := 0;
   elsif rising_edge(CLOCK) then
      if (CONTADOR = 11999999) then
			CONTADOR <= 0;			
			if PUSH = '0' then
				ACTUAL <= START;
				activo := 1;
			else
				ACTUAL <= SIGUIENTE;
			end if;
					
			if activo = 1 then	
				case (ACTUAL) is 
					when START =>
						ledout <= "00001110";
						SIGUIENTE <= HOUSE_A;
					when HOUSE_A =>
						ledout <= "01101001";
						SIGUIENTE <= UNIT_2;
					when UNIT_2 =>
						ledout <= "10101001";
						SIGUIENTE <= SUFFIX;
					when SUFFIX =>
						ledout <= "00000001";
						SIGUIENTE <= FIN;
					when FIN =>
						ledout <= "00000000";
						activo := 0;
				end case;
			end if;				 
      else
         CONTADOR <= contador+1;
      end if;
   end if;
end process;
     
LED0 <= ledout(0);
LED1 <= ledout(1);
LED2 <= ledout(2);
LED3 <= ledout(3);
LEDC <= ledout(4);
LED5 <= ledout(5);
LED6 <= ledout(6);
LED7 <= ledout(7);
end Behavioral;