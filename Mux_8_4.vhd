----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 09:47:26 PM
-- Design Name: 
-- Module Name: Mux_8_4 - Behavioral
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

entity Mux_8_4 is
    Port ( X0 : in STD_LOGIC_VECTOR (3 downto 0);
           X1 : in STD_LOGIC_VECTOR (3 downto 0);
           X2 : in STD_LOGIC_VECTOR (3 downto 0);
           X3 : in STD_LOGIC_VECTOR (3 downto 0);
           X4 : in STD_LOGIC_VECTOR (3 downto 0);
           X5 : in STD_LOGIC_VECTOR (3 downto 0);
           X6 : in STD_LOGIC_VECTOR (3 downto 0);
           X7 : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_4;

architecture Behavioral of Mux_8_4 is

signal input_C : STD_LOGIC_VECTOR (7 downto 0);

begin

input_C(0) <= NOT (C(2) OR C(1) OR C(0));
input_C(1) <= (NOT (C(2) OR C(1))) AND C(0);
input_C(2) <= C(1) AND (NOT (C(2) OR C(0)));
input_C(3) <= (NOT C(2)) AND C(1) AND C(0);
input_C(4) <= C(2) AND (NOT (C(1) OR C(0)));
input_C(5) <= C(2) AND (NOT C(1)) AND C(0);
input_C(6) <= C(2) AND C(1) AND (NOT C(0));
input_C(7) <= C(2) AND C(1) AND C(0);

Y(0) <= (input_C(0) AND X0(0)) OR (input_C(1) AND X1(0)) OR (input_C(2) AND X2(0)) OR (input_C(3) AND X3(0)) OR (input_C(4) AND X4(0)) OR (input_C(5) AND X5(0)) OR (input_C(6) AND X6(0)) OR (input_C(7) AND X7(0));
Y(1) <= (input_C(0) AND X0(1)) OR (input_C(1) AND X1(1)) OR (input_C(2) AND X2(1)) OR (input_C(3) AND X3(1)) OR (input_C(4) AND X4(1)) OR (input_C(5) AND X5(1)) OR (input_C(6) AND X6(1)) OR (input_C(7) AND X7(1));
Y(2) <= (input_C(0) AND X0(2)) OR (input_C(1) AND X1(2)) OR (input_C(2) AND X2(2)) OR (input_C(3) AND X3(2)) OR (input_C(4) AND X4(2)) OR (input_C(5) AND X5(2)) OR (input_C(6) AND X6(2)) OR (input_C(7) AND X7(2));
Y(3) <= (input_C(0) AND X0(3)) OR (input_C(1) AND X1(3)) OR (input_C(2) AND X2(3)) OR (input_C(3) AND X3(3)) OR (input_C(4) AND X4(3)) OR (input_C(5) AND X5(3)) OR (input_C(6) AND X6(3)) OR (input_C(7) AND X7(3));

end Behavioral;