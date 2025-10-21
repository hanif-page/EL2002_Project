library ieee; -- Muhammad Ammar Hanif
use ieee.std_logic_1164.all; -- 13224087

entity serialAdder_tb is
end entity;

architecture behavior of serialAdder_tb is
    signal clk       : std_logic := '0';
    signal reset     : std_logic := '0';
    signal start     : std_logic := '0';
    signal A_i, B_i      : std_logic := '0';
    signal Sum_i       : std_logic;
    signal Carry_out : std_logic;

    constant CLK_PERIOD : time := 10 ns;
begin
    uut: entity work.serial_adder
        port map (
            clk => clk,
            reset => reset,
            start => start,
            A_i => A_i,
            B_i => B_i,
            Sum_i => Sum_i,
            Carry_out => Carry_out
        );

    -- Clock generation
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        start <= '1';

        -- Serial input example: 1011 + 0110 = 11 + 6
        -- Expected Output : 17

        -- Bit order: LSB first
        -- Cycle 1
        A_i <= '1'; B_i <= '0'; wait for CLK_PERIOD;
        -- Cycle 2
        A_i <= '1'; B_i <= '1'; wait for CLK_PERIOD;
        -- Cycle 3
        A_i <= '0'; B_i <= '1'; wait for CLK_PERIOD;
        -- Cycle 4
        A_i <= '1'; B_i <= '0'; wait for CLK_PERIOD;

        -- Stop signal
        start <= '0';
        wait for 30 ns;

        -- End simulation
        wait;
    end process;
end behavior; 
