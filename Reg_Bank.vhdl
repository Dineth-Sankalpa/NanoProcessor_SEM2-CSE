----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 04:21:13 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( data_in  : in STD_LOGIC_VECTOR(3 downto 0);
           Clk    : in STD_LOGIC;
           Reset    : in STD_LOGIC;
           Reg_en   : in STD_LOGIC_VECTOR(2 downto 0);
           Reg0_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg1_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg2_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg3_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg4_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg5_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg6_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg7_out : out STD_LOGIC_VECTOR(3 downto 0));
end Reg_Bank;

architecture Behavioral of Reg_Bank is

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder3to8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal dec_out : std_logic_vector(7 downto 0);

begin

Decoder : Decoder3to8
    port map(
        I => Reg_en,
        y => dec_out);

Reg0 : Reg
    port map(
        D => "0000",
        En => dec_out(0),
        Reset => Reset,
        Clk => Clk,
        Q => Reg0_out);

Reg1 : Reg
    port map(
        D => data_in,
        En => dec_out(1),
        Reset => Reset,
        Clk => Clk,
        Q => Reg1_out);

Reg2 : Reg
    port map(
        D => data_in,
        En => dec_out(2),
        Reset => Reset,
        Clk => Clk,
        Q => Reg2_out);

Reg3 : Reg
    port map(
        D => data_in,
        En => dec_out(3),
        Reset => Reset,
        Clk => Clk,
        Q => Reg3_out);

Reg4 : Reg
    port map(
        D => data_in,
        En => dec_out(4),
        Reset => Reset,
        Clk => Clk,
        Q => Reg4_out);

Reg5 : Reg
    port map(
        D => data_in,
        En => dec_out(5),
        Reset => Reset,
        Clk => Clk,
        Q => Reg5_out);

Reg6 : Reg
    port map(
        D => data_in,
        En => dec_out(6),
        Reset => Reset,
        Clk => Clk,
        Q => Reg6_out);

Reg7 : Reg
    port map(
        D => data_in,
        En => dec_out(7),
        Reset => Reset,
        Clk => Clk,
        Q => Reg7_out);

end Behavioral;----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 04:21:13 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( data_in  : in STD_LOGIC_VECTOR(3 downto 0);
           Clk    : in STD_LOGIC;
           Reset    : in STD_LOGIC;
           Reg_en   : in STD_LOGIC_VECTOR(2 downto 0);
           Reg0_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg1_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg2_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg3_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg4_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg5_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg6_out : out STD_LOGIC_VECTOR(3 downto 0);
           Reg7_out : out STD_LOGIC_VECTOR(3 downto 0));
end Reg_Bank;

architecture Behavioral of Reg_Bank is

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder3to8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal dec_out : std_logic_vector(7 downto 0);

begin

Decoder : Decoder3to8
    port map(
        I => Reg_en,
        y => dec_out);

Reg0 : Reg
    port map(
        D => "0000",
        En => dec_out(0),
        Reset => Reset,
        Clk => Clk,
        Q => Reg0_out);

Reg1 : Reg
    port map(
        D => data_in,
        En => dec_out(1),
        Reset => Reset,
        Clk => Clk,
        Q => Reg1_out);

Reg2 : Reg
    port map(
        D => data_in,
        En => dec_out(2),
        Reset => Reset,
        Clk => Clk,
        Q => Reg2_out);

Reg3 : Reg
    port map(
        D => data_in,
        En => dec_out(3),
        Reset => Reset,
        Clk => Clk,
        Q => Reg3_out);

Reg4 : Reg
    port map(
        D => data_in,
        En => dec_out(4),
        Reset => Reset,
        Clk => Clk,
        Q => Reg4_out);

Reg5 : Reg
    port map(
        D => data_in,
        En => dec_out(5),
        Reset => Reset,
        Clk => Clk,
        Q => Reg5_out);

Reg6 : Reg
    port map(
        D => data_in,
        En => dec_out(6),
        Reset => Reset,
        Clk => Clk,
        Q => Reg6_out);

Reg7 : Reg
    port map(
        D => data_in,
        En => dec_out(7),
        Reset => Reset,
        Clk => Clk,
        Q => Reg7_out);

end Behavioral;
