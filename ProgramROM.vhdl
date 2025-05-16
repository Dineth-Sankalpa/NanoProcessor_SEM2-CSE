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
        "101000000001",  -- 0: MOVI R1, 1  ? 10 001 000 0001
        "101001000010",  -- 1: MOVI R2, 2  ? 10 010 000 0010
        "000001010000",  -- 2: ADD R1, R2  ? 00 001 010 0000
        "101011000011",  -- 3: MOVI R3, 3  ? 10 011 000 0011
        "000001011000",  -- 4: ADD R1, R3  ? 00 001 011 0000
        "000000000000",  -- 5: HALT/NOP
        "000000000000",  -- 6: unused
        "000000000000"   -- 7: unused
    );

    -- Example 1: Simple Addition (R1 = 2 + 3)
    -- signal ROM : rom_type := (
    --     "101000000010",  -- 0: MOVI R1, 2  ? 10 001 000 0010
    --     "101001000011",  -- 1: MOVI R2, 3  ? 10 010 000 0011
    --     "000001010000",  -- 2: ADD R1, R2  ? 00 001 010 0000
    --     "000000000000",  -- 3: HALT/NOP
    --     "000000000000",  -- 4
    --     "000000000000",  -- 5
    --     "000000000000",  -- 6
    --     "000000000000"   -- 7
    -- );

    -- Example 2: NEG R2 (R2 = -R2)
    -- signal ROM : rom_type := (
    --     "101001000001",  -- 0: MOVI R2, 1  ? 10 010 000 0001
    --     "010010000000",  -- 1: NEG R2      ? 01 010 000 0000
    --     "000000000000",  -- 2: HALT/NOP
    --     "000000000000",  -- 3
    --     "000000000000",  -- 4
    --     "000000000000",  -- 5
    --     "000000000000",  -- 6
    --     "000000000000"   -- 7
    -- );

begin
    process(address)
    begin
        data <= ROM(to_integer(unsigned(address)));
    end process;
end Behavioral;
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
        "101000000001",  -- 0: MOVI R1, 1  ? 10 001 000 0001
        "101001000010",  -- 1: MOVI R2, 2  ? 10 010 000 0010
        "000001010000",  -- 2: ADD R1, R2  ? 00 001 010 0000
        "101011000011",  -- 3: MOVI R3, 3  ? 10 011 000 0011
        "000001011000",  -- 4: ADD R1, R3  ? 00 001 011 0000
        "000000000000",  -- 5: HALT/NOP
        "000000000000",  -- 6: unused
        "000000000000"   -- 7: unused
    );

    -- Example 1: Simple Addition (R1 = 2 + 3)
    -- signal ROM : rom_type := (
    --     "101000000010",  -- 0: MOVI R1, 2  ? 10 001 000 0010
    --     "101001000011",  -- 1: MOVI R2, 3  ? 10 010 000 0011
    --     "000001010000",  -- 2: ADD R1, R2  ? 00 001 010 0000
    --     "000000000000",  -- 3: HALT/NOP
    --     "000000000000",  -- 4
    --     "000000000000",  -- 5
    --     "000000000000",  -- 6
    --     "000000000000"   -- 7
    -- );

    -- Example 2: NEG R2 (R2 = -R2)
    -- signal ROM : rom_type := (
    --     "101001000001",  -- 0: MOVI R2, 1  ? 10 010 000 0001
    --     "010010000000",  -- 1: NEG R2      ? 01 010 000 0000
    --     "000000000000",  -- 2: HALT/NOP
    --     "000000000000",  -- 3
    --     "000000000000",  -- 4
    --     "000000000000",  -- 5
    --     "000000000000",  -- 6
    --     "000000000000"   -- 7
    -- );

begin
    process(address)
    begin
        data <= ROM(to_integer(unsigned(address)));
    end process;
end Behavioral;
