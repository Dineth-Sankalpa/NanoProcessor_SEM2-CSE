----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sanjuna_Rathnamalala
-- 
-- Create Date: 03/05/2025 02:28:20 PM
-- Design Name: Decoder 3 to 8
-- Module Name: Decoder_3_to_8 - Behavioral
-- Project Name: Lab 4
-- Target Devices: Basys 3
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

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is

signal I0_bar, I1_bar, I2_bar : STD_LOGIC;

begin
    I0_bar <= NOT I(0);
    I1_bar <= NOT I(1);
    I2_bar <= NOT I(2);

    Y(0) <= I2_bar AND I1_bar AND I0_bar; -- 000
    Y(1) <= I2_bar AND I1_bar AND I(0);   -- 001
    Y(2) <= I2_bar AND I(1) AND I0_bar;   -- 010
    Y(3) <= I2_bar AND I(1) AND I(0);     -- 011
    Y(4) <= I(2) AND I1_bar AND I0_bar;   -- 100
    Y(5) <= I(2) AND I1_bar AND I(0);     -- 101
    Y(6) <= I(2) AND I(1) AND I0_bar;     -- 110
    Y(7) <= I(2) AND I(1) AND I(0);       -- 111

end Behavioral;
