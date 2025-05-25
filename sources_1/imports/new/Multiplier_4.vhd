library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiplier_4 is
    Port ( 
        A_mul : in  STD_LOGIC_VECTOR (3 downto 0);
        B_mul : in  STD_LOGIC_VECTOR (3 downto 0);
        Y_mul : out STD_LOGIC_VECTOR (7 downto 0)
    );
end Multiplier_4;

architecture Behavioral of Multiplier_4 is
begin
    process(A_mul, B_mul)
        variable A_unsigned : unsigned(3 downto 0);
        variable B_unsigned : unsigned(3 downto 0);
        variable Product    : unsigned(7 downto 0);
    begin
        A_unsigned := unsigned(A_mul);
        B_unsigned := unsigned(B_mul);
        Product    := A_unsigned * B_unsigned;
        Y_mul      <= std_logic_vector(Product);
    end process;
end Behavioral;
