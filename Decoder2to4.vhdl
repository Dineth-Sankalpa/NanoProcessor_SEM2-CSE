----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 06:42:39
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

entity Decoder2to4 is
    Port (
        A : in STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Decoder2to4;

architecture Behavioral of Decoder2to4 is
    signal A0_bar, A1_bar : STD_LOGIC;
begin
    A0_bar <= not A(0);
    A1_bar <= not A(1);

    Y(0) <= A1_bar and A0_bar;  -- 00
    Y(1) <= A1_bar and A(0);    -- 01
    Y(2) <= A(1) and A0_bar;    -- 10
    Y(3) <= A(1) and A(0);      -- 11
end Behavioral;
