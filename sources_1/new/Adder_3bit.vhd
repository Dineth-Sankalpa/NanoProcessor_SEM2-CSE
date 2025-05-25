----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 10:37:45 PM
-- Design Name: 
-- Module Name: Adder_3_Bit - Behavioral
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

entity Adder_3bit is
    Port (
        A : in  std_logic_vector(2 downto 0);
        S : out std_logic_vector(2 downto 0)
    );
end Adder_3bit;

architecture Behavioral of Adder_3bit is
    signal C0, C1 : std_logic;
begin
    -- LSB
    S(0) <= not A(0);
    C0 <= A(0);

    -- Middle bit
    S(1) <= A(1) xor C0;
    C1 <= A(1) and C0;

    -- MSB
    S(2) <= A(2) xor C1;

end Behavioral;