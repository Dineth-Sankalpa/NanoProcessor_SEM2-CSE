----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2025 12:04:51
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

entity Adder_3_Bit is
    port (
        A       : in  std_logic_vector(2 downto 0);
        B       : in  std_logic_vector(2 downto 0);
        C_in     : in  std_logic;
        S    : out std_logic_vector(2 downto 0);
        C_out    : out std_logic
    );
end Adder_3_Bit;

architecture Behavioral of Adder_3_Bit is
    signal G, P  : std_logic_vector(2 downto 0); 
    signal C_outI : std_logic_vector(1 downto 0);  

begin
    -- Carry Bit Generator and Propergator
    G <= A and B;
    P <= A xor B;
    
    -- intermediate Carry Outs
    C_outI(0) <= G(0) or (P(0) and C_in);
    C_outI(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and C_in);
    
    -- intermediate sums
    S(0) <= P(0) xor C_in;
    S(1) <= P(1) xor C_outI(0);
    S(2) <= P(2) xor C_outI(1);
    
    -- Carry Out
    C_out <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and P(0) and C_in);

end Behavioral;
