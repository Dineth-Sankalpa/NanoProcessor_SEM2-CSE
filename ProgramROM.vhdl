----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2025 12:42:45 PM
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
use IEEE.NUMERIC_STD.ALL;


entity ProgramROM is
    Port (
        address : in STD_LOGIC_VECTOR (2 downto 0);
        data    : out STD_LOGIC_VECTOR (11 downto 0)
    );
end ProgramROM;

architecture Behavioral of ProgramROM is

    type rom_type is array (0 to 7) of STD_LOGIC_VECTOR(11 downto 0);

    -- ACTIVE: Program to compute R1 = 1 + 2 + 3
    signal ROM : rom_type := (
        "100010000001",  -- 0: MOVI R1, 1  ? 10 001 000 0001
        "100100000010",  -- 1: MOVI R2, 2  ? 10 010 000 0010
        "000010100000",  -- 2: ADD R1, R2  ? 00 001 010 0000
        "100110000011",  -- 3: MOVI R3, 3  ? 10 011 000 0011
        "000010110000",  -- 4: ADD R1, R3  ? 00 001 011 0000
        "000000000000",  -- 5: HALT/NOP
        "000000000000",  -- 6: unused
        "000000000000"   -- 7: unused
    );



begin
    process(address)
    begin
        data <= ROM(to_integer(unsigned(address)));
    end process;
end Behavioral;
