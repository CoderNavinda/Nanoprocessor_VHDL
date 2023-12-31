----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 01:27:23 PM
-- Design Name: 
-- Module Name: RCA - Behavioral
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

entity RCA is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           sel : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC;
           zero : out STD_LOGIC);
end RCA;

architecture Behavioral of RCA is
component FA 
 port ( 
 A: in std_logic; 
 B: in std_logic; 
 C_in: in std_logic; 
 S: out std_logic; 
 C_out: out std_logic); 
 end component;
 
  SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C : std_logic;
  SIGNAL B_0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
begin
FA_0 : FA 
 port map ( 
 A => A0, 
 B => B_0(0), 
 C_in => sel, 
 S => FA0_S, 
 C_out => FA0_C);

FA_1 : FA 
 port map ( 
 A => A1, 
 B => B_0(1), 
 C_in => FA0_C, 
 S => FA1_S, 
 C_out => FA1_C);
 
 
 FA_2 : FA 
  port map ( 
  A => A2, 
  B => B_0(2), 
  C_in => FA1_C, 
  S => FA2_S, 
  C_out => FA2_C); 
  
  
FA_3 : FA 
  port map ( 
  A => A3, 
  B => B_0(3), 
  C_in => FA2_C, 
  S => FA3_S, 
  C_out => FA3_C); 
S0 <= FA0_S;
S1 <= FA1_S;
S2 <= FA2_S;
S3 <= FA3_S; 
C_out <= FA2_C xor FA3_C;
B_0(0) <=  B0 xor sel;
B_0(1) <=  B1 xor sel;
B_0(2) <=  B2 xor sel;
B_0(3) <=  B3 xor sel;
zero <= not(FA0_S) and not(FA1_S) and not(FA2_S) and not(FA3_S);
end Behavioral;
