----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 04:40:59
-- Design Name: 
-- Module Name: Add_Sub_4bit - Behavioral
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

entity Add_Sub_4bit is
    Port ( 
        A_AS : in STD_LOGIC_VECTOR (3 downto 0);
        B_AS : in STD_LOGIC_VECTOR (3 downto 0);
        Ctrl : in STD_LOGIC; -- to activate Subtraction if Ctrl = '1'
        S_AS : out STD_LOGIC_VECTOR (3 downto 0);
        Zero : out STD_LOGIC;
        Overflow : out STD_LOGIC
    );
end Add_Sub_4bit;

architecture Behavioral of Add_Sub_4bit is
    signal B_inter, S_inter: STD_LOGIC_VECTOR(3 DOWNTO 0);
    
    -- RCA component declaration with updated port names
    component RCA_4
        port (
            A      : in  STD_LOGIC_VECTOR(3 downto 0);
            B      : in  STD_LOGIC_VECTOR(3 downto 0);
            Cin    : in  STD_LOGIC;
            SUM    : out STD_LOGIC_VECTOR(3 downto 0);
            Cout   : out STD_LOGIC
        );
    end component;

begin    
    -- XOR gates for 2's complement subtraction (when Ctrl = '1')
    B_inter(0) <= B_AS(0) xor Ctrl;
    B_inter(1) <= B_AS(1) xor Ctrl;
    B_inter(2) <= B_AS(2) xor Ctrl;
    B_inter(3) <= B_AS(3) xor Ctrl;
    
    -- Ripple Carry Adder (4 Bit) instantiation with updated port mapping
    RCA_4_0 : RCA_4
        port map (
            A   => A_AS,
            B   => B_inter,
            Cin => Ctrl,      -- Changed from C_in to Cin
            SUM => S_inter,   -- Changed from S to SUM
            Cout => Overflow  -- Changed from C_out to Cout
        );

    -- Zero flag detection
    process (S_inter)
    begin
        if (S_inter = "0000") then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
    end process;
    
    S_AS <= S_inter;
end Behavioral;