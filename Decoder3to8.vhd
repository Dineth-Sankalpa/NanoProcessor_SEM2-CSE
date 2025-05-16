----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2025 02:42:29 PM
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

entity Decoder3to8 is
    Port (
        A : in STD_LOGIC_VECTOR(2 downto 0);
        Y : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Decoder3to8;

architecture Behavioral of Decoder3to8 is
    signal A0_bar, A1_bar, A2_bar : STD_LOGIC;
begin
    A0_bar <= not A(0);
    A1_bar <= not A(1);
    A2_bar <= not A(2);

    Y(0) <= A2_bar and A1_bar and A0_bar; -- 000
    Y(1) <= A2_bar and A1_bar and A(0);   -- 001
    Y(2) <= A2_bar and A(1) and A0_bar;   -- 010
    Y(3) <= A2_bar and A(1) and A(0);     -- 011
    Y(4) <= A(2) and A1_bar and A0_bar;   -- 100
    Y(5) <= A(2) and A1_bar and A(0);     -- 101
    Y(6) <= A(2) and A(1) and A0_bar;     -- 110
    Y(7) <= A(2) and A(1) and A(0);       -- 111
end Behavioral;
