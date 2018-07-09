
-- VHDL Instantiation Created from source file x10tx1.vhd -- 03:06:19 07/05/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT x10tx1
	PORT(
		clk : IN std_logic;
		push : IN std_logic;
		rst : IN std_logic;          
		CXC : OUT std_logic;
		pin : OUT std_logic;
		led1 : OUT std_logic;
		LEDA : OUT std_logic
		);
	END COMPONENT;

	Inst_x10tx1: x10tx1 PORT MAP(
		clk => ,
		CXC => ,
		push => ,
		rst => ,
		pin => ,
		led1 => ,
		LEDA => 
	);


