library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is
component counter16
Port ( 
clk: in std_logic;
reset: in std_logic;
q: out std_logic_vector(2 downto 0)
);
end component;
signal clk_in : std_logic :='0';
signal reset_in : std_logic :='0';
signal q_out : std_logic_vector(2 downto 0);
begin
DUT: counter16 port map (clk => clk_in,reset => reset_in,q => q_out );
process
begin
for i in 0 to 20 loop
clk_in <= not clk_in;
wait for 20ns;
clk_in <= clk_in;
end loop;
end process;

process
begin
reset_in <= '1';
wait;
end process;
end;