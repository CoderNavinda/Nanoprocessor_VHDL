----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2022 03:07:18 PM
-- Design Name: 
-- Module Name: TB_AU_7_Seg - Behavioral
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

entity TB_8MUX is
--  Port ( );
end TB_8MUX;

architecture Behavioral of TB_8MUX is

component way_8_mux
    Port ( Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0));
end component;

 signal  sel :  STD_LOGIC_VECTOR (2 downto 0);
 signal  y,r0,r1,r2,r3,r4,r5,r6,r7 : STD_LOGIC_VECTOR (3 downto 0);

begin
    UUT: way_8_mux
        port map(
            Sel => sel,
            Y => y,
            R0 => r0,
            R1 => r1,
            R2 => r2,
            R3 =>r3,
            R4 => r4,
            R5 => r5,
            R6 =>r6,
            R7 =>r7 );
    process
    begin
        sel <= "001";
         r0 <= "0000";
        r1 <= "1111";
        r2 <= "0000";
        r3 <= "0000";
        r4 <= "0000";
        r5 <= "0000";
        r6 <= "0000";
        r7 <= "0000";
        wait;
        
    end process;
    
end Behavioral;