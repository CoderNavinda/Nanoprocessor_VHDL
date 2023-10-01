----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2022 07:57:53 PM
-- Design Name: 
-- Module Name: TB_INS_Dec - Behavioral
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

entity TB_INS_Dec is
--  Port ( );
end TB_INS_Dec;

architecture Behavioral of TB_INS_Dec is
component Ins_Decoder
Port (     ROM : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_value : in STD_LOGIC_VECTOR(3 downto 0);
           Reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           L_Sel : out STD_LOGIC;
           In_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_sel0 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_sel1 : out STD_LOGIC_VECTOR (2 downto 0);
           AU_sel : out STD_LOGIC;
           JMP : out STD_LOGIC;
           JMP_ADD : out STD_LOGIC_VECTOR (2 downto 0));
end component;
 signal   ROM :  STD_LOGIC_VECTOR (11 downto 0);
  signal  Reg_value :  STD_LOGIC_VECTOR(3 downto 0);
  signal  Reg_en :  STD_LOGIC_VECTOR (2 downto 0);
    signal   L_Sel :  STD_LOGIC;
  signal         In_Val :  STD_LOGIC_VECTOR (3 downto 0);
  signal         Reg_sel0 :  STD_LOGIC_VECTOR (2 downto 0);
  signal         Reg_sel1 :  STD_LOGIC_VECTOR (2 downto 0);
  signal         AU_sel : STD_LOGIC;
  signal         JMP : STD_LOGIC;
  signal         JMP_ADD :  STD_LOGIC_VECTOR (2 downto 0);
begin
Dec1 : Ins_Decoder
PORT MAP (
           ROM => ROM,
           Reg_value =>  Reg_Value ,
           Reg_en =>  Reg_en,
           L_Sel => L_Sel,
           In_Val => In_Val,
           Reg_sel0 => Reg_Sel0,
           Reg_sel1 => Reg_Sel1,
           AU_sel => AU_sel ,
           JMP => JMP ,
           JMP_ADD => JMP_ADD);

        process
            begin
                ROM <= "100010001011"; 
                wait;
            end process;
end Behavioral;
