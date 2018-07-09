
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity x10tx1 is

	Port ( 
	         clk 	   : in STD_LOGIC;
				CXC		: in STD_LOGIC;
				push		: in STD_LOGIC;
				rst		: in STD_LOGIC;
				pin		: out STD_LOGIC := '0';
            led1	   : out std_logic := '0';
				LEDA 	   : out STD_LOGIC
		   );
	
end x10tx1;

architecture Behavioral of x10tx1 is
type FSM is (retardo,start,ceros); --MAQUINA DE ESTADOS PARA LA LECTURA DE LOS BITS
signal Estado: FSM;
  
signal cont:		integer range 0 to 50; 
signal contv:       integer range 0 to 2 ;
signal contadors: integer range 0 to 43;
signal bits: std_logic_vector(43 downto 0):= "11100110100110101001011110011010011010100101";
signal diez: natural range 0 to 10000;

signal clks: std_logic := '0';

begin

process(clk)
begin
	If Rising_Edge(clk) Then  		
		if cont = 50 then
			clks<= not(clks);
			cont <= 0;
		else
			cont<=cont+1;
		end if;
	end if;
end process;

process(clks,cxc, push, rst)
variable activo: natural range 0 to 1 := 0; 	
begin
	if (rst = '1') then
		Estado <= retardo;
		activo := 0;
	elsif Rising_Edge(clks) then  
		if (push = '0' and CXC = '1') then
			Estado <= retardo;
			activo := 1;
		end if;
				
		if (activo = 1) then
			case Estado is
				when retardo => 
					diez <= diez + 1;
					if diez = 10000 then
						diez <= 0;
						Estado <= start;
					end if;
					
				when start =>
					led1<= '0';
					LEDA<= bits(43-contadors);
					pin<= bits(43-contadors);
					contadors<= contadors + 1;
					if contadors = 43 then 
						contadors <= 0;
						contv<=contv + 1;
						estado <= ceros;
					end if;
					
				when ceros=>	
					led1 <=  '1';
					LEDA <= '0';
					pin <= '0';
					activo := 0;		    
			end case;
		end if;
	end if;
end process;
end Behavioral;