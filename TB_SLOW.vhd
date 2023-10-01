----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2022 11:33:09 AM
-- Design Name: 
-- Module Name: D_FF_Sim - Behavioral
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

entity  TB_SLOW is
--  Port ( );
end TB_SLOW;

architecture Behavioral of TB_SLOW is
component Slow_Clk
Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;
signal clkin : STD_LOGIC := '0';
signal clkout : STD_LOGIC;
begin
UUT : Slow_Clk
 PORT MAP(
     Clk_in => clkin,
     Clk_out => clkout
   );

process
    begin
        wait for 20ns;
        clkin <= NOT(clkin);               
end process;
end Behavioral;
