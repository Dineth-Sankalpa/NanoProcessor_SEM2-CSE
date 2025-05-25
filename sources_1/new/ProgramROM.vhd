library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ProgramROM is
    Port (
        address : in STD_LOGIC_VECTOR (2 downto 0);
        data    : out STD_LOGIC_VECTOR (12 downto 0)
    );
end ProgramROM;

architecture Behavioral of ProgramROM is

    type rom_type is array (0 to 7) of STD_LOGIC_VECTOR(12 downto 0);

--    -- ACTIVE: Program to compute R1 = 3 + (3 + (-1)) = 5 
--    signal ROM : rom_type := (
--        "0101110000011", -- MOVI R7,3 
--        "0100010000001", -- MOVI R1,1 
--        "0010010000000", -- NEG R1 
--        "0100100000011", -- MOVI R2,3 
--        "0000100010000", -- ADD R2,R1 
--        "0001110100000", -- ADD R7,R2 
--        "0110100000110", -- JZR R2,6 
--        "0110110000100"  -- JZR R0,4 
--    );
    
    signal ROM : rom_type := (
        "0101110000011", -- MOVI R7,3 
        "0100010000100", -- MOVI R1,1 
        "1001110010000", -- MOVI R2,3 
        "0000000000000", --  
        "0000000000000", -- 
        "0000000000000", -- 
        "0000000000000", -- 
        "0000000000000"  -- 
    );

    -- Example 1: Simple Addition (R1 = 2 + 3)
--     signal ROM : rom_type := (
--         "101110000010",  -- 0: MOVI R7, 2  ? 10 001 000 0010
--         "100011000010",  -- 1: MOVI R1, 3  ? 10 010 000 0011
--         "001110010000",  -- 2: ADD R7, R2  ? 00 001 010 0000
--         "000000000000",  -- 3: HALT/NOP
--         "000000000000",  -- 4
--         "000000000000",  -- 5
--         "000000000000",  -- 6
--         "000000000000"   -- 7
--     );

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