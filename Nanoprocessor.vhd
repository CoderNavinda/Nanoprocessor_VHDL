----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 10:37:05 AM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor is
    Port ( CLK : in STD_LOGIC;
           RES : in STD_LOGIC;
           OVRFLW : out STD_LOGIC;
           ZERO : out STD_LOGIC;
           LED_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           Anode : out STD_LOGIC_VECTOR  (3 downto 0);
           SEG7 : out STD_LOGIC_VECTOR (6 downto 0));
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is
component Ins_Decoder
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
end component;

component ROM
Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component MUX_2_to_1
    Port ( D0 : in STD_LOGIC;
           D1 : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

component RCA_3_bit
Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           C_out : out STD_LOGIC
       );
end component;
component Program_Counter
Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
       Clk : in STD_LOGIC;
       Res : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

---green over---yellow begin--
component RCA_ADD_SUB
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
end component;
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

component Regsiter_Bank
Port (     R_en : in STD_LOGIC_VECTOR (2 downto 0);
           Clk_r : in STD_LOGIC;
           res : in STD_LOGIC;
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

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Seven_Segment is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0)
          );
end component;
signal data0 : STD_LOGIC_VECTOR(11 downto 0);
signal jmp,cout,lsel,sel,clk_holder : STD_LOGIC;
signal a0,a1,a2,a3,s0,s1,s2,y0,y1,y2,o0,o1,o2,o3 : STD_LOGIC;
signal jmp_add,q,regsel0,regsel1,ren:  STD_LOGIC_VECTOR (2 downto 0);
signal i0,i1,inval,r0,r1,r2,r3,r4,r5,r6,r7:  STD_LOGIC_VECTOR (3 downto 0);

begin
Instruction_decoder : Ins_Decoder
PORT MAP (
          ROM  => data0,
          Reg_value => i1,
          Reg_en  => ren,
          L_Sel => lsel,
          In_Val => inval,
          Reg_sel0  => regsel0,
          Reg_sel1 => regsel1,
          AU_sel => sel,
          JMP => jmp,
          JMP_ADD  => jmp_add
);

ROMprocessor : ROM
PORT MAP(
    data => data0,
    address=> q
);

MUX2_0: MUX_2_to_1
port map(
    D0 => s0,
    D1 => jmp_add(0),
    EN => jmp,
    Y => y0
);
MUX2_1: MUX_2_to_1
port map(
        D0 =>s1,
        D1 => jmp_add(1),
        EN => jmp,
        Y => y1
);
MUX2_2: MUX_2_to_1
port map(
   D0 =>s2,
   D1 => jmp_add(2),
   EN => jmp,
   Y => y2
);

RCA_3bit : RCA_3_bit
port map(
   A0 => q(0),
   A1 => q(1),
   A2 => q(2),
   C_in => '0',
   S0 => s0,
   S1 => s1,
   S2 =>s2 ,
   C_out => cout

);

PC : Program_Counter
port map(
    D(0) => y0,
    D(1) => y1,
    D(2) => y2, 
   Clk => clk_holder,
   Res => RES,
   Q => q
);
--yellow

RCA_for_adding_subtracting : RCA_ADD_SUB
port map(
           A0 => i0(0),
           A1 =>i0(1),
           A2 =>i0(2),
           A3 =>i0(3),
           B0 => i1(0),
           B1 =>i1(1),
           C_in => '0',
           sel =>sel,
           B2 =>i1(2),
           B3 =>i1(3),
           S0 => a0 ,
           S1 => a1,
           S2 => a2,
           S3 => a3,
           C_out => OVRFLW,
           zero => ZERO

);

MUX_0 : way_8_mux
port map(
           Sel => regsel1 ,
           Y =>i0 ,
           R0 => r0,
           R1 => r1,
           R2 => r2,
           R3 => r3,
           R4 => r4,
           R5 => r5,
           R6 => r6,
           R7 => r7

);

MUX_1 : way_8_mux
port map(
           Sel => regsel0 ,
           Y => i1,
           R0 => r0,
          R1 => r1,
          R2 => r2,
          R3 => r3,
          R4 => r4,
          R5 => r5,
          R6 => r6,
          R7 => r7

);
-- orange part
Ins_Dec_Mux0 : Mux_2_to_1
port map (
    D0 => a0,
   D1 => inval(0),
   EN => lsel,
   Y => o0
);
Ins_Dec_Mux1 : Mux_2_to_1
port map (
    D0 => a1,
   D1 => inval(1),
   EN => lsel,
   Y => o1
);
Ins_Dec_Mux2 : Mux_2_to_1
port map (
    D0 => a2,
   D1 => inval(2),
   EN => lsel,
   Y => o2
);
Ins_Dec_Mux3 : Mux_2_to_1
port map (
    D0 => a3,
   D1 => inval(3),
   EN =>  lsel,
   Y => o3
);

reg_bank : Regsiter_Bank
PORT MAP(
           R_en => ren,
           Clk_r =>  clk_holder,
           res => RES,
           R_in1(0) => o0,
           R_in1(1) =>o1,
           R_in1(2) =>o2,
           R_in1(3) =>o3,
           R_in2(0) => o0,
           R_in2(1) =>o1,
           R_in2(2) =>o2,
           R_in2(3) =>o3,
           R_in3(0) => o0,
           R_in3(1) =>o1,
           R_in3(2) =>o2,
           R_in3(3) =>o3,
           R_in4(0) => o0,
          R_in4(1) =>o1,
          R_in4(2) =>o2,
          R_in4(3) =>o3,
          R_in5(0) => o0,
          R_in5(1) =>o1,
          R_in5(2) =>o2,
          R_in5(3) =>o3,
          R_in6(0) => o0,
          R_in6(1) =>o1,
          R_in6(2) =>o2,
          R_in6(3) =>o3,
          R_in7(0) => o0,
          R_in7(1) =>o1,
           R_in7(2) =>o2,
          R_in7(3) => o3,
           Bus0 => r0,
           Bus1 =>r1,
           Bus2 =>r2,
           Bus3 =>r3,
           Bus4 => r4,
           Bus5 =>r5,
           Bus6 =>r6,
           Bus7 =>r7
);
slow_clock : Slow_Clk
PORT MAP (
           Clk_in => CLK,
           Clk_out => clk_holder
);
seven_seg : Seven_Segment
Port map (      A => r7,
           S_7Seg => SEG7);
Anode <= "1110";
LED_OUT <= r7;
end Behavioral;
