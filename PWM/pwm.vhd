
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PWM is

Generic(
	Resolucion: Integer  := 240000
);

Port(
	 Clk: in	Std_Logic;
	 PWM:	out	Std_Logic;
	 SW1:in std_logic;
	 SW2:in std_logic;
	 SW3:in std_logic
);
end PWM;

architecture Behavioral of PWM is
signal Tt: integer range 0 to Resolucion-1;

begin
process(clk)

variable tiempo: Integer:=7200;--3%

	begin
		
		
		-------------------Servo PWM-----------
		
		if (rising_edge(Clk)) then
		
			if(Sw1='0')then
				tiempo:=2400;--1%
			elsif(Sw2='0')then
				tiempo:=16800;--7%
			elsif(Sw3='0')then
				tiempo:=24000;--10%
--			else
--				tiempo:=24000;--10%
			end if;
			
			if (Tt=Resolucion-1) then
				Tt<=0;
			else
				Tt<= Tt+1;
			end if;
			
			If (Tt<tiempo) then
				PWM<='1';
			else
				PWM<='0';
			end if;

		end if;
end process;


end Behavioral;

