library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity counter is
Port ( 
j,k,clk,rst: in std_logic;
q: out std_logic
);
end counter;

architecture Behavioral of counter is
signal t:std_logic:='0';
begin
process(j,k,clk,rst)
begin
if (rst='0') then
t<='1';
elsif(rising_edge(clk)) then
t<=(j and not(t)) or ((not k) and t);
end if;
end process;
q<=t;
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter16 is
port(
clk: in std_logic;
reset: in std_logic;
q: out std_logic_vector(2 downto 0)
);
end counter16;

architecture behavioral of counter16 is
component counter is
Port ( 
j,k,clk,rst: in std_logic;
q: out std_logic
);
end component;
signal temp: std_logic_vector(2 downto 0);
signal temp2,temp1: std_logic:='0';
begin
x1: counter port map(j => '1', k => '1', clk => clk, rst => reset, q => temp(0));
x2: counter port map(j => temp(0), k => temp(0), clk => clk, rst => reset, q => temp(1));
temp1<=temp(1);
temp2 <= temp(0) and temp1;
x3: counter port map(j => temp2, k => temp2, clk => clk, rst => reset, q => temp(2));
process (temp)
begin
if temp="110" or temp="111" then
q<="000";
else
q<=temp;
end if;
end process;
end behavioral;