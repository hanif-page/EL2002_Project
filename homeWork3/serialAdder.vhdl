-- Muhammad Ammar Hanif
-- 13224087

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity serialAdder is
    port (
        clk       : in  std_logic;
        reset     : in  std_logic;
        start     : in  std_logic;
        A_i, B_i      : in  std_logic;
        Sum_i       : out std_logic;
        Carry_out : out std_logic
    );
end serialAdder;

architecture behavioral of serialAdder is
    signal carry : std_logic := '0';
begin
    process(clk, reset)
        variable s : std_logic;
        variable next_carry : std_logic;
    begin
        if reset = '1' then
            carry <= '0';
            Sum_i <= '0';
            Carry_out <= '0';

        elsif rising_edge(clk) then
            if start = '1' then
                -- Mealy FSM Logic (Full Adder behavior)
                s := A_i xor B_i xor carry;
                next_carry := (A_i and B_i) or (carry and (A_i xor B_i));

                Sum_i <= s;
                carry <= next_carry;
                Carry_out <= next_carry;
            end if;
        end if;
    end process;
end behavioral;
