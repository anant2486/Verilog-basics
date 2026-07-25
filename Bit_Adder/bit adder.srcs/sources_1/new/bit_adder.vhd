
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit_adder is
Port (
s1,s2,s3,s4,cout:out std_logic;
a1,a2,a3,a4,b1,b2,b3,b4:in std_logic;
cin:in std_logic:='1';
c0,c1,c2:inout std_logic );

end bit_adder;

architecture Behavioral of bit_adder is

begin
process (a1,a2,a3,a4,b1,b2,b3,b4,cin,c0,c1,c2)
begin
s1<=a1 xor b1 xor cin;
c0<=(a1 and b1) or (b1 and cin) or (cin and a1);
s2<=a2 xor b2 xor c0;
c1<=(a2 and b2) or (b2 and c0) or (c0 and a2);
s3<=a3 xor b3 xor c1;
c2<=(a3 and b3) or (b3 and c1) or (c1 and a3);
s4<= a4 xor b4 xor c2;
cout<=(a4 and b4) or (b4 and c2) or (c2 and a4);
end process;

end Behavioral;
