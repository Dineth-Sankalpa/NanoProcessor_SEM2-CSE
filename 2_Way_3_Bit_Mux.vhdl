----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 09:25:30 PM
-- Design Name: 
-- Module Name: Mux_2_3 - Behavioral
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

entity Mux_2_3 is
    Port ( X0 : in STD_LOGIC_VECTOR (2 downto 0);
           X1 : in STD_LOGIC_VECTOR (2 downto 0);
           C : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2_3;

architecture Behavioral of Mux_2_3 is

begin

Y(0) <= ((NOT C) AND X0(0)) OR (C AND X1(0));
Y(1) <= ((NOT C) AND X0(1)) OR (C AND X1(1));
Y(2) <= ((NOT C) AND X0(2)) OR (C AND X1(2));


end Behavioral;