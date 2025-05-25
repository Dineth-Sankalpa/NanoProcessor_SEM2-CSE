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
    
    -- Multiply
--    signal ROM : rom_type := (
--        "0101110000011", -- MOVI R7,3 
--        "0100010000010", -- MOVI R1,4 
--        "1001110010000", -- MUL  R7,R1 
--        "0000000000000", --  
--        "0000000000000", -- 
--        "0000000000000", -- 
--        "0000000000000", -- 
--        "0000000000000"  -- 
--    );

    -- Devide
    signal ROM : rom_type := (
            "0101110000110", -- MOVI R7,3 
            "0100010000010", -- MOVI R1,2 
            "1011110010000", -- DIV  R7,R1 
            "0000000000000", --  
            "0000000000000", -- 
            "0000000000000", -- 
            "0000000000000", -- 
            "0000000000000"  -- 
        );

--    signal ROM : rom_type := (
--        "0101110000100", -- MOVI R7,4 
--        "0100010000010", -- MOVI R1,2 
--        "0010010000000", -- NEG R1 
--        "0001110010000", -- ADD  R7,R1 
--        "0000000000000", --  
--        "0000000000000", -- 
--        "0000000000000", --  
--        "0000000000000"  -- 
--    );
    
    -- Overflow in addition
--    signal ROM : rom_type := (
--        "0101110001110", -- MOVI R7,4 
--        "0100010001000", -- MOVI R1,2 
--        "0001110010000", -- ADD R7,R1 
--        "0000000000000", -- 
--        "0000000000000", --  
--        "0000000000000", -- 
--        "0000000000000", --  
--        "0000000000000"  -- 
--    );

begin
    process(address)
    begin
        data <= ROM(to_integer(unsigned(address)));
    end process;
end Behavioral;     