----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 11:03:50 PM
-- Design Name: 
-- Module Name: TB_Nanoprocessor - Behavioral
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

entity TB_Nanoprocessor is
--  Port ( );
end TB_Nanoprocessor;

architecture Behavioral of TB_Nanoprocessor is
component Nanoprocessor is
    Port ( CLK : in STD_LOGIC;
           RES : in STD_LOGIC;
           OVRFLW : out STD_LOGIC;
           ZERO : out STD_LOGIC;
           Anode : out STD_LOGIC_VECTOR  (3 downto 0);
           SEG7 : out STD_LOGIC_VECTOR (6 downto 0));
end component;

        signal    CLK :  STD_LOGIC := '0';
  signal         RES :  STD_LOGIC;
           signal OVRFLW :  STD_LOGIC;
     signal      ZERO :  STD_LOGIC;
   signal        Anode :  STD_LOGIC_VECTOR  (3 downto 0); 
   signal SEG7 :  STD_LOGIC_VECTOR (6 downto 0);

--200452N Navinda Perera 11 0000 1111 0000 0100

begin




UUT : Nanoprocessor
port map(CLK => CLK,
           RES => RES,
           OVRFLW => OVRFLW,
           ZERO => ZERO,
           Anode => Anode,
           SEG7 => SEG7
         
);
process
begin
wait for 10ns;
CLK <= NOT(CLK); 
end process;

process
begin
RES <= '1';
wait for 90ns;
RES <= '0';
wait;
end process;



end Behavioral;
