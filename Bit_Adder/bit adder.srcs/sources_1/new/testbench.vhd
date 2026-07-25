----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.10.2023 00:02:21
-- Design Name: 
-- Module Name: testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
component bit_adder is
Port (
s1,s2,s3,s4,cout:out std_logic;
a1,a2,a3,a4,b1,b2,b3,b4:in std_logic;
cin:in std_logic:='1';
c0,c1,c2:inout std_logic );
end component ;
signal s1out,s2sout,s3out,s4out,cout0,a1in,a2in,a3in,a4in,b1in,b2in,b3in,b4in,cin0,c0inout,c1inout,c2inout:std_logic;
begin
DUT: bit_adder port map( s1out,s2sout,s3out,s4out,cout0,a1in,a2in,a3in,a4in,b1in,b2in,b3in,b4in,cin0,c0inout,c1inout,c2inout);
process
begin
a1in<='1';
a2in<='1';
a3in<='1';
a4in<='0';
b1in<='1';
b2in<='1';
b3in<='0';
b4in<='0';
cin0<='1';
wait for 10ns;

a1in<='0';
a2in<='0';
a3in<='1';
a4in<='1';
b1in<='1';
b2in<='0';
b3in<='0';
b4in<='1';
cin0<='0';
wait;
end process;

end Behavioral;
