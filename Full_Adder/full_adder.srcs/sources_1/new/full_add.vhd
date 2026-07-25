library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_add is
Port ( 
a: in std_logic;
b: in std_logic;
c: in std_logic;
sum: out std_logic;
carry: out std_logic
);
end full_add;

architecture Behavioral of full_add is
begin
process(a,b,c) 
begin
sum <= a xor b xor c;
carry <= (a and b) or (b and c) or (c and b);
end process;
end Behavioral;