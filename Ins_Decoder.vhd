----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2022 06:26:01 PM
-- Design Name: 
-- Module Name: Ins_Decoder - Behavioral
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

entity Ins_Decoder is
    Port ( ROM : in STD_LOGIC_VECTOR (11 downto 0);
            Reg_value : in STD_LOGIC_VECTOR(3 downto 0);
           Reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           L_Sel : out STD_LOGIC;
           In_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_sel0 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_sel1 : out STD_LOGIC_VECTOR (2 downto 0);
           AU_sel : out STD_LOGIC;
           JMP : out STD_LOGIC;
           JMP_ADD : out STD_LOGIC_VECTOR (2 downto 0));
end Ins_Decoder;

architecture Behavioral of Ins_Decoder is
signal regA,regB : STD_LOGIC_VECTOR(2 downto 0);
begin
    regA <= ROM(9 downto 7);
    regB <= ROM(6 downto 4);
    --moving to registers
    L_Sel <= ROM(11) and not(ROM(10));    
    In_Val <=  ROM(3 downto 0);
    Reg_en <= regA; 
    
    --adding
    AU_Sel <= not(ROM(11)) and ROM(10);
    Reg_Sel0 <= regA; 
    Reg_Sel1 <= regB;
       
-- jump if zero    
    JMP <= (ROM(11) and ROM(10)) and( not(Reg_value(0)) and not(Reg_value(1)) and not(Reg_value(2)) and not(Reg_value(3)));
    JMP_ADD <= ROM(2 downto 0);
    
end Behavioral;
