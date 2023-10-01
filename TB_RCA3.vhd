----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 02:31:28 PM
-- Design Name: 
-- Module Name: TB_RCA - Behavioral
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

entity TB_RCA3 is
--  Port ( );
end TB_RCA3;

architecture Behavioral of TB_RCA3 is
component RCA
 Port ( A0 : in STD_LOGIC;
          A1 : in STD_LOGIC;
          A2 : in STD_LOGIC;
         C_in : in STD_LOGIC;
          S0 : out STD_LOGIC;
          S1 : out STD_LOGIC;
          S2 : out STD_LOGIC;
          C_out : out STD_LOGIC);
            
            
            
            
end component;
signal a0,a1,a2,c_in,s0,s1,s2,c_out : STD_LOGIC;
begin
UUT: RCA 
PORT MAP(
     A0 => a0,
     A1 => a1,
     A2 => a2,
     C_in => c_in,
     S0 => s0,
     S1 => s1,
     S2 => s2,
     C_out => c_out
);
process
begin
--index number 200452N 
-- index number in binary 11 0000 1111 0000 0100

    
-- 0000+0100 = 0100
      A0 <= '0';
     A1 <=  '0';
     A2 <= '0';
     c_in <= '0';
 
       wait for 100ns;
 
 -- 0000 + 1111 = 1111       
       A0 <= '0';
       A1 <=  '0';
       A2 <= '1';
       c_in <= '0';
          wait;
 
 
 
 
end process;

end Behavioral;
