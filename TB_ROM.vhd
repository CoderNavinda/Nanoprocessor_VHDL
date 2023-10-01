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

entity TB_ROM is
--  Port ( );
end TB_ROM;

architecture Behavioral of TB_ROM is
component ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

  signal   ad :  STD_LOGIC_VECTOR (2 downto 0);
  signal   dt : STD_LOGIC_VECTOR (11 downto 0);



begin




UUT : ROM
port map(address => ad,
        data => dt       
);


process
begin
ad <= "000";
wait for 20ns;
ad <= "001";
wait for 20ns;
ad <= "010";
wait for 20ns;
ad <= "011";
wait for 20ns;
ad <="100";
wait for 20ns;
ad<= "101";
wait for 20ns;
ad <= "110";
wait for 20ns;
ad <="111";
wait;
end process;
end Behavioral;
