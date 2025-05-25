library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NanoProcessor_Nano4ce is
    Port ( 
        Clk               : in  STD_LOGIC;
        Reset             : in  STD_LOGIC;
        Zero_Flag_LED     : out STD_LOGIC;
        Overflow_Flag_LED : out STD_LOGIC;
        Jump_Flag_LED     : out STD_LOGIC;
        NEG_FLAG_LED      : out STD_LOGIC;
        R7_Out : out STD_LOGIC_VECTOR(3 downto 0);
        sevenSeg          : out STD_LOGIC_VECTOR(6 downto 0);
        Display           : out STD_LOGIC_VECTOR(3 downto 0)
--        R0_Out, R1_Out, R2_Out, R3_Out, R4_Out, R5_Out, R6_Out, R7_Out : out STD_LOGIC_VECTOR(3 downto 0)
    );
end NanoProcessor_Nano4ce;

architecture Behavioral of NanoProcessor_Nano4ce is
    --Slow clock used to slow down the internal clock of BASYS 3
    component Slow_Clk is
        Port (
            Clk_in  : in  STD_LOGIC;
            Clk_out : out STD_LOGIC
        );
    end component;
    
    -- PC Increment Unit: Handles PC updates and jumps
    component ProgramCounter is
        Port (
            Input  : in  std_logic_vector (2 downto 0);
            Clk    : in  std_logic;
            Reset  : in  std_logic;
            Output : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Program ROM: Stores and provides instructions
    component ProgramROM is
        Port (
            address : in  STD_LOGIC_VECTOR (2 downto 0);
            data    : out STD_LOGIC_VECTOR (11 downto 0)
        );
    end component;

    -- Instruction Decoder: Decodes 12-bit instructions
    component InstructionDecoder is
        Port (
            instruction_bus  : in  STD_LOGIC_VECTOR (11 downto 0); -- Instruction input
            reg_check_input  : in  STD_LOGIC_VECTOR (3 downto 0);  -- Value to check for JZR (from MUX)
            reg_enable       : out STD_LOGIC_VECTOR (2 downto 0);  -- Which register to write to
            load_select      : out STD_LOGIC;                      -- 0 = immediate, 1 = ALU result
            immediate_value  : out STD_LOGIC_VECTOR (3 downto 0);  -- Immediate value from instruction
            reg_select_A     : out STD_LOGIC_VECTOR (2 downto 0);  -- MUX A selector
            reg_select_B     : out STD_LOGIC_VECTOR (2 downto 0);  -- MUX B selector
            alu_mode         : out STD_LOGIC;                      -- 0 = add, 1 = subtract
            jump_en          : out STD_LOGIC;                      -- Enable jump if flag is true
            jump_target      : out STD_LOGIC_VECTOR (2 downto 0)   -- Jump target address (PC input)
        );
    end component;

    -- Register Bank: Holds 8 general-purpose 4-bit registers
    component Reg_Bank is
        Port (
            data_in  : in STD_LOGIC_VECTOR(3 downto 0);
            Clk      : in STD_LOGIC;
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
    end component;

    -- 2-Way 4-Bit Mux: Chooses between immediate and AU result
    component Mux_2way_4bit is
        Port ( 
            X0 : in STD_LOGIC_VECTOR (3 downto 0);
            X1 : in STD_LOGIC_VECTOR (3 downto 0);
            C  : in STD_LOGIC;
            Y  : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    
    component Mux_2way_3bit is
        Port ( 
            X0 : in STD_LOGIC_VECTOR (2 downto 0);
            X1 : in STD_LOGIC_VECTOR (2 downto 0);
            C  : in STD_LOGIC;
            Y  : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Arithmetic Unit: Performs addition/subtraction
    component AddSub_4bit is
        Port (
            A_AS : in STD_LOGIC_VECTOR (3 downto 0);
            B_AS : in STD_LOGIC_VECTOR (3 downto 0);
            Ctrl : in STD_LOGIC; -- to activate Substraction if Ctrl = '1'
            S_AS : out STD_LOGIC_VECTOR (3 downto 0);
            Zero : out STD_LOGIC;
            Overflow : out STD_LOGIC
        );
    end component;
    
    component Adder_3Bit is
        Port (
            A : in  std_logic_vector(2 downto 0);
            S : out std_logic_vector(2 downto 0)
        );
        end component;
        
        
    component Mux_8_4
        Port ( 
            X0 : in STD_LOGIC_VECTOR (3 downto 0);
            X1 : in STD_LOGIC_VECTOR (3 downto 0);
            X2 : in STD_LOGIC_VECTOR (3 downto 0);
            X3 : in STD_LOGIC_VECTOR (3 downto 0);
            X4 : in STD_LOGIC_VECTOR (3 downto 0);
            X5 : in STD_LOGIC_VECTOR (3 downto 0);
            X6 : in STD_LOGIC_VECTOR (3 downto 0);
            X7 : in STD_LOGIC_VECTOR (3 downto 0);
            C  : in STD_LOGIC_VECTOR (2 downto 0);
            Y  : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    
    component LUT_16_7
        Port ( 
            address_LUT : in STD_LOGIC_VECTOR (3 downto 0);
            data_LUT : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;
        
    signal CPU_CLK,JUMP_FLAG,MUX_2_4_LOAD, AS_SELECT, Overflow_Flag, Zero_Flag :std_logic;
    signal MUX_2_3_OUT, PC_OUT,ADDER3_OUT,JUMP_ADDRESS, DEC_3_8_EN, MUX_A_EN, MUX_B_EN : std_logic_vector(2 downto 0);
    signal IMMEDIATE_VAL,MUX_A_OUT,MUX_B_OUT, AS_OUT,REG_BANK_IN,REG0OUT,REG1OUT,REG2OUT,REG3OUT,REG4OUT,REG5OUT,REG6OUT,REG7OUT: std_logic_vector(3 downto 0);
    signal INSTRUCTION : std_logic_vector(11 downto 0);
    
begin

    CLOCK : Slow_Clk 
        port map(
            Clk_in  => Clk,
            Clk_out => CPU_CLK
        );   
    
    PC : ProgramCounter
        port map(
            Input  => MUX_2_3_OUT,
            Clk    => CPU_CLK,
            Reset  => Reset,
            Output => PC_OUT
        );
        
    MUX_2x3 : Mux_2way_3bit 
        Port map (
            X0 => ADDER3_OUT,
            X1 => JUMP_ADDRESS,
            C  => JUMP_FLAG,
            Y  => MUX_2_3_OUT
        );
    
    ADDER : Adder_3Bit
        port map(
            A => PC_OUT,  
            S => ADDER3_OUT  
        );
        
    ROM : ProgramROM 
        port map(
            address => PC_OUT,
            data    => INSTRUCTION 
        );
        
    INS_DECODER : InstructionDecoder  
        port map(
            -- input
            instruction_bus => INSTRUCTION,  
            
            -- outputs   
            reg_enable      => DEC_3_8_EN,     
            load_select     => MUX_2_4_LOAD,    
            immediate_value => IMMEDIATE_VAL,   
            reg_select_A    => MUX_A_EN,      
            reg_select_B    => MUX_B_EN,    
            alu_mode        => AS_SELECT,       
            reg_check_input =>  MUX_A_OUT,
            jump_en         => JUMP_FLAG,       
            jump_target     => JUMP_ADDRESS  
        );      
    
    MUX_2X4 : Mux_2way_4bit
        port map(
            -- inputs
            X0 => IMMEDIATE_VAL,
            X1 => AS_OUT,
            C  => MUX_2_4_LOAD,
            
            -- output
            Y  => REG_BANK_IN
        );   
        
    ALU : AddSub_4bit
        port map(
            -- inputs
            A_AS => MUX_A_OUT,
            B_AS => MUX_B_OUT,
            Ctrl => AS_SELECT,
            
            -- outputs
            S_AS => AS_OUT,
            Zero     => Zero_Flag,
            Overflow => Overflow_Flag
        ); 
    
    MUX_8_4_A : Mux_8_4
        Port map(
            -- input
            C  => MUX_A_EN,
            
            --outputs
            X0 => REG0OUT,
            X1 => REG1OUT,
            X2 => REG2OUT,
            X3 => REG3OUT,
            X4 => REG4OUT,
            X5 => REG5OUT,
            X6 => REG6OUT,
            X7 => REG7OUT,
            Y  => MUX_A_OUT
        );
    
    MUX_8_4_B : Mux_8_4
        Port map(
            -- input
            C => MUX_B_EN,
            
            -- outputs
            X0 => REG0OUT,
            X1 => REG1OUT,
            X2 => REG2OUT,
            X3 => REG3OUT,
            X4 => REG4OUT,
            X5 => REG5OUT,
            X6 => REG6OUT,
            X7 => REG7OUT,
            Y => MUX_B_OUT
        );
    
    REGISTER_BANK : Reg_Bank
        Port map(
            -- inputs
            data_in  => REG_BANK_IN,
            Clk      => CPU_CLK,
            Reset    => Reset,
            Reg_en   => DEC_3_8_EN,
            
            -- outputs
            Reg0_out => REG0OUT,
            Reg1_out => REG1OUT,
            Reg2_out => REG2OUT,
            Reg3_out => REG3OUT,
            Reg4_out => REG4OUT,
            Reg5_out => REG5OUT,
            Reg6_out => REG6OUT,
            Reg7_out => REG7OUT
        );
        
       LUT_7seg : LUT_16_7 
               port map ( 
                   address_LUT => REG7OUT, 
                   data_LUT    => sevenSeg 
               );

--    R0_out <= REG0OUT;
--    R1_out <= REG1OUT;
--    R2_out <= REG2OUT;
--    R3_out <= REG3OUT;
--    R4_out <= REG4OUT;
--    R5_out <= REG5OUT;
--    R6_out <= REG6OUT;
    R7_out <= REG7OUT;
    
    Zero_Flag_LED     <= Zero_Flag;    
    Overflow_Flag_LED <= Overflow_Flag;
    Jump_Flag_LED     <= JUMP_FLAG;
    NEG_FLAG_LED      <= AS_SELECT;
    
    Display <= "1110";

end Behavioral;