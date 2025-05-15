----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 16:13:48
-- Design Name: 
-- Module Name: Program_Counter_3_bits - Behavioral
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

entity Program_Counter_3_bits is
    Port ( 
        input_address : in STD_LOGIC_VECTOR (2 downto 0);
        reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        out_address : out STD_LOGIC_VECTOR (2 downto 0) := "000"
    );
end Program_Counter_3_bits;

architecture Behavioral of Program_Counter_3_bits is

begin
    process (Clk) 
        begin
            if (rising_edge(Clk)) then -- respond when clock rises
                if reset = '0' then -- Enable should be set
                    out_address <= input_address;
                else
                    out_address <= "000";
                end if;
            end if;
    end process;

end Behavioral;
