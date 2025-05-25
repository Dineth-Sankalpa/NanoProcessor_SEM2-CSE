----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2025 11:11:43
-- Design Name: 
-- Module Name: Arithmetic_Unit - Behavioral
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

entity Arithmetic_Unit is
    Port ( A_AU : in STD_LOGIC_VECTOR (3 downto 0);
           B_AU : in STD_LOGIC_VECTOR (3 downto 0);
           Arithmetic_Mode : in STD_LOGIC_VECTOR (1 downto 0);
           S_AU : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end Arithmetic_Unit;

architecture Behavioral of Arithmetic_Unit is

begin


end Behavioral;
