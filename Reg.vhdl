----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sanjuna_Rathnamalala
-- 
-- Create Date: 04/07/2025 09:03:03 PM
-- Design Name: Arithmetic_Unit
-- Module Name: Reg - Behavioral
-- Project Name: Lab_6
-- Target Devices: Basys3
-- Tool Versions: Vivado 2018.2
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

entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;

architecture Behavioral of Reg is

begin

    process(Clk)
    begin
        if Reset = '1' then
            Q <= "0000";  -- Reset state
        elsif(rising_edge(Clk)) then
            if (En = '1') then
                Q <= D;
            end if;
        end if;
end process;        


end Behavioral;
