library ieee;
use ieee.std_logic_1164.all;

-- Testbench entity is empty
entity rangkaian_ED_tb is
end entity rangkaian_ED_tb;

architecture behavioral of rangkaian_ED_tb is

    -- 1. Component Declaration
    -- This MUST exactly match the entity of your design file.
    component rangkaianED is
        port (
            A  : in  std_logic_vector(3 downto 0);
            B  : in  std_logic_vector(3 downto 0);
            A0 : out std_logic;
            D0 : out std_logic;
            X  : out std_logic
        );
    end component rangkaianED;

    -- 2. Signals to connect to the component
    -- Inputs
    signal tb_A : std_logic_vector(3 downto 0) := "0000";
    signal tb_B : std_logic_vector(3 downto 0) := "0000";

    -- Outputs
    signal tb_A0 : std_logic;
    signal tb_D0 : std_logic;
    signal tb_X  : std_logic;

begin

    -- 3. Component Instantiation (Port Map)
    -- This connects the testbench signals to the design's ports.
    uut: rangkaianED port map (
        A  => tb_A,
        B  => tb_B,
        A0 => tb_A0,
        D0 => tb_D0,
        X  => tb_X
    );

    -- 4. Stimulus Process
    stimulus_process: process
    begin
        -- Test Case 1: A = 5, B = 4
        tb_A <= "0101";
        tb_B <= "0100";
        wait for 10 ns;

        -- Test Case 2: A = 6, B = 4
        tb_A <= "0110";
        tb_B <= "0100";
        wait for 10 ns;

        -- Test Case 3: A = 5, B = 5
        tb_A <= "0101";
        tb_B <= "0101";
        wait for 10 ns;
        
        wait; -- End simulation
    end process stimulus_process;

end architecture behavioral;