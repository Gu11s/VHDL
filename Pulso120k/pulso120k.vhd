----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:18 06/21/2018 
-- Design Name: 
-- Module Name:    pulso120k - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulso120k is
    Port ( Clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
--			  push: in  STD_LOGIC;
--			  cx0:  in  STD_LOGIC;
           pulso : out  STD_LOGIC;
			  pulso2 : out STD_LOGIC);
end pulso120k;

architecture Behavioral of pulso120k is

--signal count : integer range 0 to 50000000:=0;
signal count : integer range 0 to 200:=0;
signal pl: std_logic;

begin
process(rst, Clk)
begin
	if(rst='1') then
		pl<='0';
		count<=0;
	elsif(Clk'event and Clk = '1') then
--		if ( push = '1' and cx0 = '1') then
			count <= count + 1;
			if (count = 200) then
				pl <= not pl;
				count <= 1;
			end if;
--		end if;
	end if;
end process;

pulso <= pl;
pulso2 <= pl;
end Behavioral;

