library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_4bit is
    Port ( 
        A_AS     : in STD_LOGIC_VECTOR (3 downto 0);
        B_AS     : in STD_LOGIC_VECTOR (3 downto 0);
        Ctrl     : in  STD_LOGIC_VECTOR(1 downto 0); -- 00 = Add, 01 = Sub, 10 = Mul
        S_AS     : out STD_LOGIC_VECTOR (3 downto 0);
        Zero     : out STD_LOGIC;
        Overflow : out STD_LOGIC
    );
end ALU_4bit;

architecture Behavioral of ALU_4bit is
    signal B_inter  : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal S_inter  : STD_LOGIC_VECTOR(3 downto 0);
    signal Sum_Res  : STD_LOGIC_VECTOR(3 downto 0);
    signal Mul_Res  : STD_LOGIC_VECTOR(7 downto 0);
    signal AddOF    : STD_LOGIC;
    
    -- RCA component declaration with updated port names
    component RCA_4
        port (
            A      : in  STD_LOGIC_VECTOR(3 downto 0);
            B      : in  STD_LOGIC_VECTOR(3 downto 0);
            Cin    : in  STD_LOGIC;
            SUM    : out STD_LOGIC_VECTOR(3 downto 0);
            Cout   : out STD_LOGIC
        );
    end component;
    
    -- Multiplier
    component Multiplier_4
        port (
            A_mul : in  STD_LOGIC_VECTOR(3 downto 0);
            B_mul : in  STD_LOGIC_VECTOR(3 downto 0);
            Y_mul : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin    
    -- XOR gates for 2's complement subtraction (when Ctrl = '1')
    B_inter(0) <= B_AS(0) xor Ctrl(0);
    B_inter(1) <= B_AS(1) xor Ctrl(0);
    B_inter(2) <= B_AS(2) xor Ctrl(0);
    B_inter(3) <= B_AS(3) xor Ctrl(0);
    
    -- Ripple Carry Adder (4 Bit) instantiation with updated port mapping
    RCA_4_0 : RCA_4
        port map (
            A   => A_AS,
            B   => B_inter,
            Cin => Ctrl(0),   -- 0 for Add, 1 for Sub
            SUM => Sum_Res,   -- Changed from S to SUM
            Cout => AddOF     -- Changed from C_out to Cout
        );
        
    -- Multiplier instantiation
    MUL_Inst : Multiplier_4
        port map (
            A_mul => A_AS,
            B_mul => B_AS,
            Y_mul => Mul_Res
        );
        
    -- Result selection
    process(Ctrl, Sum_Res, Mul_Res)
    begin
        case Ctrl is
            when "00" | "01" =>  -- Add or Sub
                S_inter <= Sum_Res;
                Overflow <= AddOF;
            when "10" =>         -- Multiply
                S_inter <= Mul_Res(3 downto 0);
                if Mul_Res(7 downto 4) /= "0000" then
                    Overflow <= '1';
                else
                    Overflow <= '0';
                end if;
            when others =>
                S_inter <= (others => '0');
                Overflow <= '0';
        end case;
    end process;

    -- Zero flag detection
    process (S_inter)
    begin
        if (S_inter = "0000") then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
    end process;
    S_AS <= S_inter;
    
end Behavioral;