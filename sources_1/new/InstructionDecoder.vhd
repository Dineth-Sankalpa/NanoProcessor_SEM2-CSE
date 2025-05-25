library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionDecoder is
    Port (
        instruction_bus : in  STD_LOGIC_VECTOR (11 downto 0); -- Instruction input
        reg_enable      : out STD_LOGIC_VECTOR (2 downto 0);  -- Which register to write to
        load_select     : out STD_LOGIC;                      -- 0 = immediate, 1 = ALU result
        immediate_value : out STD_LOGIC_VECTOR (3 downto 0);  -- Immediate value from instruction
        reg_select_A    : out STD_LOGIC_VECTOR (2 downto 0);  -- MUX A selector
        reg_select_B    : out STD_LOGIC_VECTOR (2 downto 0);  -- MUX B selector
        alu_mode        : out STD_LOGIC;                      -- 0 = add, 1 = subtract
        reg_check_input : in  STD_LOGIC_VECTOR (3 downto 0);  -- Value to check for JZR (from MUX)
        jump_en         : out STD_LOGIC;                      -- Enable jump if flag is true
        jump_target     : out STD_LOGIC_VECTOR (2 downto 0)   -- Jump target address (PC input)
    );
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is

begin

process(instruction_bus, reg_check_input)
    begin
        -- Default values to avoid latches and simplify logic
        reg_enable      <= "000";
        load_select     <= '0';
        immediate_value <= (others => '0');
        reg_select_A    <= "000";
        reg_select_B    <= "000";
        alu_mode        <= '1';
        jump_en         <= '0';
        jump_target     <= "000";
    
        -- Instruction decoding based on top 2 bits
        case instruction_bus(11 downto 10) is
            -- 00: ADD(Ra,Rb) ;(Ra <- Ra + Rb)
            when "00" =>
                reg_enable   <= instruction_bus(9 downto 7); -- Destination Ra
                load_select  <= '1';                         -- ALU output to register
                reg_select_A <= instruction_bus(9 downto 7); -- Ra
                reg_select_B <= instruction_bus(6 downto 4); -- Rb
                alu_mode     <= '0';                         -- Add
    
            -- 01: NEG(R) ;(R <- -R = 0 - R)
            when "01" =>
                reg_enable   <= instruction_bus(9 downto 7); -- Destination R
                load_select  <= '1';                         -- ALU output to register
                reg_select_A <= "000";                       -- R0 = 0
                reg_select_B <= instruction_bus(9 downto 7); -- R
                alu_mode     <= '1';                         -- Subtract
    
            -- 10: MOVI(R,d) ;(R <- d)
            when "10" =>
                reg_enable      <= instruction_bus(9 downto 7); -- Destination R
                immediate_value <= instruction_bus(3 downto 0); -- d (4-bit immediate)
    
            -- 11: JZR(R,d) ;(if R == 0 then PC <- d)
            when "11" =>
                reg_select_A    <= instruction_bus(9 downto 7);  -- Register to check
                
                if (reg_check_input = "0000") then
                    jump_en     <= '1';
                    jump_target <= instruction_bus(2 downto 0);  -- 3-bit address to jump
                end if;
    
            when others =>
                -- Do nothing 
                null;
        end case;
end process;

end Behavioral;