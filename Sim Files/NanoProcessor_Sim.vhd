----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 02:56:14 PM
-- Design Name: 
-- Module Name: NanoProcessor_Sim - Behavioral
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

entity NanoProcessor_Sim is
--  Port ( );
end NanoProcessor_Sim;

architecture Behavioral of NanoProcessor_Sim is

component NanoProcessor_Nano4ce
 Port ( 
       Clk            : in  STD_LOGIC;
       Reset          : in  STD_LOGIC;
       Zero_Flag_LED      : out STD_LOGIC;
       Overflow_Flag_LED  : out STD_LOGIC;
       Jump_Flag_LED      : out STD_LOGIC;
       NEG_FLAG_LED       : out STD_LOGIC;
       R0_Out, R1_Out, R2_Out, R3_Out, R4_Out, R5_Out, R6_Out, R7_Out : out STD_LOGIC_VECTOR(3 downto 0)
   );
end component;

signal Clk, Reset, Zero_Flag_LED, Overflow_Flag_LED, Jump_Flag_LED, NEG_FLAG_LED : std_logic;
signal R0_Out, R1_Out, R2_Out, R3_Out, R4_Out, R5_Out, R6_Out, R7_Out : STD_LOGIC_VECTOR(3 downto 0);

begin

UUT: NanoProcessor_Nano4ce
    port map (
        Clk                => Clk,
        Reset              => Reset,
        Zero_Flag_LED      => Zero_Flag_LED,
        Overflow_Flag_LED  => Overflow_Flag_LED,
        Jump_Flag_LED      => Jump_Flag_LED,
        NEG_FLAG_LED       => NEG_FLAG_LED,
        R0_Out             => R0_Out,
        R1_Out             => R1_Out,
        R2_Out             => R2_Out,
        R3_Out             => R3_Out,
        R4_Out             => R4_Out,
        R5_Out             => R5_Out,
        R6_Out             => R6_Out,
        R7_Out             => R7_Out
);

clk_process : process
begin
    Clk <= '0';
    wait for 10ns;
    
    Clk <= '1';
    wait for 10ns;
end process;

process
begin
Reset <= '0';
wait;
end process;

--Process_Sim : process
--begin



end Behavioral;
