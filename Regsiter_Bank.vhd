----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 07:09:46 PM
-- Design Name: 
-- Module Name: Regsiter_Bank - Behavioral
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

entity Regsiter_Bank is
    Port ( R_en : in STD_LOGIC_VECTOR (2 downto 0);
            res : in STD_LOGIC; 
           Clk_r : in STD_LOGIC;
           R_in1 : in STD_LOGIC_VECTOR(3 downto 0);
           R_in2 : in STD_LOGIC_VECTOR(3 downto 0);
           R_in3 : in STD_LOGIC_VECTOR(3 downto 0);
           R_in4 : in STD_LOGIC_VECTOR(3 downto 0);
           R_in5 : in STD_LOGIC_VECTOR(3 downto 0);
           R_in6 : in STD_LOGIC_VECTOR(3 downto 0); 
           R_in7 : in STD_LOGIC_VECTOR(3 downto 0);    
           Bus0 : out STD_LOGIC_VECTOR (3 downto 0);
           Bus1 : out STD_LOGIC_VECTOR (3 downto 0);
           Bus2 : out STD_LOGIC_VECTOR (3 downto 0);
           Bus3 : out STD_LOGIC_VECTOR (3 downto 0);
           Bus4 : out STD_LOGIC_VECTOR (3 downto 0);
           Bus5 : out STD_LOGIC_VECTOR (3 downto 0);
           Bus6 : out STD_LOGIC_VECTOR (3 downto 0);
           Bus7 : out STD_LOGIC_VECTOR (3 downto 0));
end Regsiter_Bank;

architecture Behavioral of Regsiter_Bank is
component Decoder_3_to_8
 Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
          EN : in STD_LOGIC;
          Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Reg
 Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
          En : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Res : in STD_LOGIC;
          Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal y : STD_LOGIC_VECTOR (7 downto 0);
begin
three_to_eight_decoder : Decoder_3_to_8
port map(
          I => R_en,
          EN => '1',
          Y => y

); 

reg0 : Reg
port map (
          D  => "0000",
          En => '1',
          Res => res,
          Clk => Clk_r,
          Q => Bus0
);
reg1 : Reg
port map (
          D  => R_in1,
          En => y(1),
          Res => res,
          Clk => Clk_r,
          Q => Bus1
);
reg2 : Reg
port map (
          D  => R_in2,
          En => y(2),
          Res => res,
          Clk => Clk_r,
          Q => Bus2
);
reg3 : Reg
port map (
          D  => R_in3,
          En => y(3),
          Res => res,
          Clk => Clk_r,
          Q => Bus3
);
reg4 : Reg
port map (
          D  => R_in4,
          En => y(4),
          Res => res,
          Clk => Clk_r,
          Q => Bus4
);
reg5 : Reg
port map (
          D  => R_in5,
          En => y(5),
          Res => res,
          Clk => Clk_r,
          Q => Bus5
);
reg6 : Reg
port map (
          D  => R_in6,
          En => y(6),
          Res => res,
          Clk => Clk_r,
          Q => Bus6
);
reg7 : Reg
port map (
          D  => R_in7,
          En => y(7),
          Res => res,
          Clk => Clk_r,
          Q => Bus7
);
end Behavioral;
