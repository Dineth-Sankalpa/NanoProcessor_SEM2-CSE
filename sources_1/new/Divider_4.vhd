library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Divider_4 is
    Port (
        A_div : in  STD_LOGIC_VECTOR(3 downto 0);
        B_div : in  STD_LOGIC_VECTOR(3 downto 0);
        Q_div : out STD_LOGIC_VECTOR(3 downto 0); -- Quotient
        DivByZero : out STD_LOGIC                 -- Flag if B = 0
    );
end Divider_4;

architecture Behavioral of Divider_4 is
    signal A_int, B_int : UNSIGNED(3 downto 0);
    signal Q_int        : UNSIGNED(3 downto 0);
begin
    process(A_div, B_div)
    begin
        A_int <= UNSIGNED(A_div);
        B_int <= UNSIGNED(B_div);
        
        if B_int = 0 then
            Q_div <= (others => '0');
            DivByZero <= '1';
        else
            Q_int <= A_int / B_int;
            Q_div <= STD_LOGIC_VECTOR(Q_int);
            DivByZero <= '0';
        end if;
    end process;
end Behavioral;
