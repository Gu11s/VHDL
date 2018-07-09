
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_Design is
    Port ( clkTop 		: in  STD_LOGIC;
           rstTop 		: in  STD_LOGIC;
			  CXCTop			: in  STD_LOGIC;
           ON1 			: in  STD_LOGIC;
           OFF1 			: in  STD_LOGIC;
           ON2 			: in  STD_LOGIC;
           OFF2 			: in  STD_LOGIC;
			  LedON			: out STD_LOGIC;
			  Led1_Top		: out STD_LOGIC;
           PinTop 		: out  STD_LOGIC
			  );
end Top_Design;

architecture Behavioral of Top_Design is

signal Salida1, Salida2, Salida3, Salida4, Salida5, Salida6, Salida7, Salida8 : std_logic;
signal pin1, pin2, pin3, pin4 : std_logic;

COMPONENT x10tx1
	PORT(
		clk : 	IN std_logic;
		CXC : 	IN std_logic;
		push : 	IN std_logic;
		rst : 	IN std_logic;          
		pin : 	OUT std_logic;
		led1 : 	OUT std_logic;
		LEDA : 	OUT std_logic
		);
	END COMPONENT;
	
COMPONENT x10tx2
	PORT(
		clk : 	IN std_logic;
		CXC : 	IN std_logic;
		push : 	IN std_logic;
		rst : 	IN std_logic;          
		pin : 	OUT std_logic;
		led1 : 	OUT std_logic;
		LEDA : 	OUT std_logic
		);
	END COMPONENT;	
	
COMPONENT x10tx3
	PORT(
		clk : 	IN std_logic;
		CXC : 	IN std_logic;
		push : 	IN std_logic;
		rst : 	IN std_logic;          
		pin : 	OUT std_logic;
		led1 : 	OUT std_logic;
		LEDA : 	OUT std_logic
		);
	END COMPONENT;


COMPONENT x10tx4
	PORT(
		clk : 	IN std_logic;
		CXC : 	IN std_logic;
		push : 	IN std_logic;
		rst : 	IN std_logic;          
		pin : 	OUT std_logic;
		led1 : 	OUT std_logic;
		LEDA : 	OUT std_logic
		);
	END COMPONENT;
	
	
begin

Inst_x10tx1: x10tx1 PORT MAP(
		clk => 	clkTop,
		CXC => 	CXCTop,
		push => 	ON1,
		rst => 	rstTop,
		pin => 	pin1,
		led1 => 	Salida1,
		LEDA => 	Salida2
	);
	
Inst_x10tx2: x10tx2 PORT MAP(
		clk => 	clkTop,
		CXC => 	CXCTop,
		push => 	OFF1,
		rst => 	rstTop,
		pin => 	pin2,
		led1 => 	Salida3,
		LEDA => 	Salida4
	);
	
Inst_x10tx3: x10tx3 PORT MAP(
		clk => 	clkTop,
		CXC => 	CXCTop,
		push => 	ON2,
		rst => 	rstTop,
		pin => 	pin3,
		led1 => 	Salida5,
		LEDA => 	Salida6
	);
	
Inst_x10tx4: x10tx4 PORT MAP(
		clk => 	clkTop,
		CXC => 	CXCTop,
		push => 	OFF2,
		rst => 	rstTop,
		pin => 	pin4,
		led1 => 	Salida7,
		LEDA => 	Salida8 
	);
	
Led1_Top <= Salida1 or Salida3 or Salida5 or Salida7;
LedON <= Salida2 or Salida4 or Salida6 or	Salida8;
PinTop <= pin1 or pin2 or pin3 or pin4;
end Behavioral;

