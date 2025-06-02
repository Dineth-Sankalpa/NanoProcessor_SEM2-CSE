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

--    -- ACTIVE: Program to compute R1 = 3 + (3 + (-1)) = 5 
    signal ROM : rom_type := (
        "101110000001", -- MOVI R7,1 
        "100010000010", -- MOVI R1,2 
        "001110010000", -- ADD R7,R1
        "001111110000", -- ADD R7,R7
        "110000000100", -- JZR R0,4 MKAING IT A STOP
        "000000000000",
        "000000000000",
        "000000000000"
         
    );
    

begin
    process(address)
    begin
        data <= ROM(to_integer(unsigned(address)));
    end process;
end Behavioral;     
