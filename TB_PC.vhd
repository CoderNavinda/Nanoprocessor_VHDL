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

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is
component Program_Counter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

  signal   d:  STD_LOGIC_VECTOR (2 downto 0);
  signal   clk : STD_LOGIC :='0';
  signal   res : STD_LOGIC :='0';
  signal q :  STD_LOGIC_VECTOR (2 downto 0);


begin




UUT : Program_Counter
port map(
       D => d,
        Clk => clk,
        Res => res,
        Q => q       
);
process
begin
wait for 10ns;
clk <= NOT(clk); 
end process;

process
begin
D <= "000";
wait for 20ns;
D <= "001";
wait for 20ns;
D <= "010";
wait for 20ns;
D <= "011";
wait for 20ns;
D <= "100";
wait for 20ns;
D <= "101";
wait for 20ns;
D <= "110";
wait for 20ns;
D <= "111";
wait;
end process;
end Behavioral;
