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

entity TB_RCA is
--  Port ( );
end TB_RCA;

architecture Behavioral of TB_RCA is
component RCA
 Port ( A0 : in STD_LOGIC;
          A1 : in STD_LOGIC;
          A2 : in STD_LOGIC;
          A3 : in STD_LOGIC;
          B0 : in STD_LOGIC;
          B1 : in STD_LOGIC;
          B2 : in STD_LOGIC;
          B3 : in STD_LOGIC;
          C_in : in STD_LOGIC;
          sel : in STD_LOGIC;
          S0 : out STD_LOGIC;
          S1 : out STD_LOGIC;
          S2 : out STD_LOGIC;
          S3 : out STD_LOGIC;
          zero : out STD_LOGIC;
          C_out : out STD_LOGIC);
            
            
            
            
end component;
signal a0,a1,a2,a3,b0,b1,b2,b3,c_in,s0,s1,s2,s3,c_out,sel,zero : STD_LOGIC;
begin
UUT: RCA 
PORT MAP(
     A0 => a0,
     A1 => a1,
     A2 => a2,
     A3 => a3,
     B0 => b0,
     B1 => b1,
     B2 => b2,
     B3 => b3,
     C_in => c_in,
     S0 => s0,
     S1 => s1,
     S2 => s2,
     S3 => s3,
     C_out => c_out,
     sel => sel,
     zero => zero  



);
process
begin
--index number 200452N 
-- index number in binary 11 0000 1111 0000 0100

    
    sel <= '0';
-- 0000+0100 = 0100
      A0 <= '0';
     A1 <=  '0';
     A2 <= '0';
     A3 <= '0';
     B0 <=  '0';
     B1 <=  '0';
     B2 <= '1';
     B3 <= '0';
     c_in <= '0';
 
       wait for 100ns;
 
 -- 0000 + 1111 = 1111       
       sel <= '1';
       A0 <= '0';
       A1 <=  '0';
       A2 <= '0';
       A3 <= '0';
       B0 <=  '1';
       B1 <=  '1';
       B2 <= '1';
       B3 <= '1';
       c_in <= '0';
       
       
        wait for 100ns;
        
-- 0101 +1011 = 10000      
        
       A0 <= '1';
        A1 <=  '0';
        A2 <= '1';
        A3 <= '0';
        B0 <=  '1';
        B1 <=  '1';
        B2 <= '0';
        B3 <= '1';
        c_in <= '0';
            
        wait for 100ns;
           
 --0111 + 1111 = 10110           
      A0 <= '1';
       A1 <=  '1';
       A2 <= '1';
       A3 <= '0';
       B0 <=  '1';
       B1 <=  '1';
       B2 <= '1';
       B3 <= '1';
       c_in <= '0';
       
 wait for 100ns;
 
 -- 0001+ 0001 = 0010
      A0 <= '1';
      A1 <=  '0';
      A2 <= '0';
      A3 <= '0';
      B0 <=  '1';
      B1 <=  '0';
      B2 <= '0';
      B3 <= '0';
      c_in <= '0';
              
          wait;
 
 
 
 
end process;

end Behavioral;
