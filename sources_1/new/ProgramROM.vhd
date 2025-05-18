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

--    -- ACTIVE: Program to compute R1 = 1 + 2
    signal ROM : rom_type := (
        "100010000001",  -- 0: MOVI R1, 1  ? 10 001 000 0001
        "100101000011",  -- 1: MOVI R2, 2  ? 10 010 000 0010
        "010100000000",  -- 2: neg R2,     ? 10 010 000 0000
        "000010100000",  -- 3: ADD R1, R2  ? 00 001 010 0000
        "110000000011",  -- 4: HALT/NOP
        "000000000000",  -- 5: unused
        "000000000000",  -- 6: unused
        "000000000000"   -- 7: unused
    );
    
--    signal ROM : rom_type := (
--        "100010000101",  -- 0: MOVI R1, 5  ? 10 001 000 0101
--        "100101000001",  -- 1: MOVI R2, 1  ? 10 010 000 0001
--        "010100000000",  -- 2: neg R2,     ? 10 010 000 0000
--        "000010100000",  -- 3: ADD R1, R2  ? 00 001 010 0000
--        "110010000110",  -- 4: JZR R1, 6   ? 11 001 0000 110 
--        "111000000100",  -- 5: JMP 3
--        "110000000101",  -- 6: HALT / NOP 
--        "000000000000"   -- 7: unused
--    );

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
