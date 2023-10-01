----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 08:12:56 PM
-- Design Name: 
-- Module Name: TB_Register - Behavioral
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

entity TB_Register is
--  Port ( );
end TB_Register;

architecture Behavioral of TB_Register is
component Regsiter_Bank
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
end component;

 signal        R_en :  STD_LOGIC_VECTOR (2 downto 0);
 signal          res :  STD_LOGIC; 
signal          Clk_r :  STD_LOGIC := '0';
 signal         Bus0 :  STD_LOGIC_VECTOR (3 downto 0);
  signal        Bus1 : STD_LOGIC_VECTOR (3 downto 0);
 signal         Bus2 :  STD_LOGIC_VECTOR (3 downto 0);
 signal         Bus3 :  STD_LOGIC_VECTOR (3 downto 0);
  signal        Bus4 :  STD_LOGIC_VECTOR (3 downto 0);
  signal        Bus5 :  STD_LOGIC_VECTOR (3 downto 0);
  signal        Bus6 :  STD_LOGIC_VECTOR (3 downto 0);
signal          Bus7 :  STD_LOGIC_VECTOR (3 downto 0);
signal r :  STD_LOGIC_VECTOR (3 downto 0);





begin
UUT : Regsiter_Bank
port map(
          R_en => R_en   ,
          res =>  res ,
          Clk_r => Clk_r   ,
          R_in1 => r ,
          R_in2 =>   r ,
          R_in3 =>   r   ,
          R_in4=>   r ,
          R_in5 =>   r  ,
          R_in6 =>  r  ,
          R_in7  =>   r  ,
          Bus0 => Bus0 ,
          Bus1 =>   Bus1 ,
          Bus2 => Bus2   ,
          Bus3 =>  Bus3  ,
          Bus4=>  Bus4 ,
          Bus5=> Bus5  ,
          Bus6 => Bus6  ,
          Bus7=> Bus7  
);


process
begin
wait for 20ns;
Clk_r <= NOT(Clk_r); 
end process;

-- 200418R -- 1 1000 1110 1110 0010

process
begin
 R_en <= "001";
 r<= "0010";
 res <= '0';
wait for 100ns;
 r<= "1110";
 R_en <= "010";
wait for 100ns;
R_en <= "011";
 r<= "1110";
wait for 100ns;
R_en <= "100";
 r<= "1000";

wait for 100ns;
R_en <= "101";
 r<= "0010";

wait for 100ns;
R_en <= "110";
 r<= "1110";

wait for 100ns;
R_en <= "111";
 r<= "1110";

wait;
end process;



end Behavioral;
