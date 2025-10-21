library ieee;
use ieee.std_logic_1164.all;

entity customizedCounter_tb is
end entity;

architecture sim of customizedCounter_tb is
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal w   : std_logic := '0';
    -- signal y3, y2, y1, y0 : std_logic := '0';
    signal z3, z2, z1, z0 : std_logic;

    -- DUT (Device Under Test)
    component customizedCounter
        port (
            clk : in std_logic;
            reset : in std_logic;
            w   : in std_logic;
            -- y3, y2, y1, y0 : out std_logic;
            z3, z2, z1, z0 : out std_logic
        );
    end component;

begin
    -- Instantiate DUT
    uut: customizedCounter
        port map (
            clk => clk,
            reset => reset,
            w   => w,
            -- y3 => y3,
            -- y2 => y2,
            -- y1 => y1,
            -- y0 => y0,
            z3 => z3,
            z2 => z2,
            z1 => z1,
            z0 => z0
        );

    -- Clock generation (10 ns period) 
    -- Kode berlanjut pada bagian kanan...
    clk_process : process
    begin
        while true loop
            clk <= '0'; wait for 5 ns;
            clk <= '1'; wait for 5 ns;
        end loop;
    end process;

    -- Stimulus
    stim_proc : process
    begin
        -- Reset sequence
        reset <= '1';
        wait for 15 ns;
        reset <= '0';

        -- Case 1: w = 1 → counter increases by 2, wrapping at 8/9 → 0/1
        w <= '1';
        wait for 120 ns;

        -- Case 2: w = 0 → counter decreases by 1, wrapping from 0 → 9
        w <= '0';
        wait for 120 ns;

        -- End simulation
        wait;
    end process;

end architecture;
