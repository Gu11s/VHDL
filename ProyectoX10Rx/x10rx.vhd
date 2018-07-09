
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity x10rx is
Generic(
	Resolucion: Integer  := 240000
);

  Port (
        CLK : in    std_logic;
        CXC : in    std_logic;
        led : out   std_logic := '0';
		  led1: out	  std_logic := '0'; 
		  led2: out	  std_logic := '0';
		  led3: out   std_logic := '0';
		  led4: out   std_logic := '0';
		  led5: out   std_logic := '0';
		  led6: out   std_logic := '0';
		  led7: out   std_logic := '0';
		  PWM:  out	  std_logic;
		  Display: out std_logic_vector(7 downto 0) := "11111111";
		  Enable0: out std_logic := '1';
		  foco: out	  std_logic := '0';
        fil : in    std_logic
         );
end x10rx;

architecture Behavioral of x10rx is

signal Tt: integer range 0 to Resolucion-1;
signal pwmSignal: integer;

type FSM is (start,lectura,ceros);   
signal recp: FSM;
--signal cont:		integer range 0 to 5999999;  
signal cont:		integer range 0 to 50;  
signal lect:		integer range 0 to 44;
signal uno:      std_logic_vector (43 downto 0) := "11100110100110101001011110011010011010100101";
signal dos:      std_logic_vector (43 downto 0) := "11100110100100101001011110011010010010100101";
signal tri:      std_logic_vector (43 downto 0) := "11100110100111101001011110011010011010100101";
signal cua:      std_logic_vector (43 downto 0) := "11100110100100011001011110011010010001100101";
signal inicio:      std_logic_vector (43 downto 0);
signal clks:        std_logic;

begin

------PROCESS CLK

process(clk)
begin
	If Rising_Edge(clk) Then  		
--		if cont = 5999999 then
		if cont = 50 then --por Niquist-Shannon 2*(la velocidad de transmisión) -1 
			clks<= not(clks);
			cont <= 0;
		else
			cont<=cont+1;
		end if;
	end if;
end process;

------PROCESS RECEPCION

process(clks,fil)

begin

If Rising_edge(clks) Then  	
	Case recp is
      when start =>
         if (fil = '1' and CXC = '1') then 
				led<='0';
				led1<='0';
				led2<='0';
				led3<='0';
				led4<='0';
				led5<='0';
				led6<='0';
				led7<='0';
				foco<='0';
				recp<=lectura;
				inicio(43)<='1';
         end if;
            
		when lectura=>
			led7<= '1';
			inicio(42-lect)<=fil;        
			lect <= lect + 1;
			if lect= 43 then
				lect<=0;
				recp<=ceros;
			end if;
				
		when ceros =>
			led7<= '0';
			if inicio = uno then 
				led<='1';
				led1<='0';
				foco<='1';
				Enable0<='0';
				Display<="11111001";
				recp<= start;
			elsif inicio = dos then
				led<='0';
				led1<='1';
				foco<='0';
				Enable0<='0';
				Display<="10100100";
				recp<= start;					
			elsif inicio = tri then
				led2<='1';
				led3<='0';
				pwmSignal<= 1;
				Enable0<='0';
				Display<="10110000";
				recp<= start;					
			elsif inicio = cua then
				led2<='0';
				led3<='1';
				pwmSignal<= 0;
				Enable0<='0';
				Display<="10011001";
				recp<= start;					
			else
				led6<='1';
				led<='0';
				led1<='0';
				led2<='0';
				led3<='0';
				foco<='1';
				pwmSignal<= 1;
				Enable0<='0';
				Display<="00000110";
				recp<= start;					
			end if;   
	end case;
end if;
end process;

process(clk, pwmSignal)
variable tiempo: Integer:=7200;--3%
begin
-------------------Servo PWM-----------
	if (rising_edge(Clk)) then
		if(pwmSignal = 0)then
			tiempo:=2400;--1%
		elsif(pwmSignal = 1)then
			tiempo:=24000;--10%
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