library ieee;
use ieee.std_logic_1164.all;

entity customizedCounter is
    port(
        clk   : in  std_logic;
        reset : in  std_logic;
        w     : in  std_logic;
        z3, z2, z1, z0 : out std_logic
    );
end entity;

architecture behavioral of customizedCounter is
    signal y3, y2, y1, y0 : std_logic := '0';
    signal y3_next, y2_next, y1_next, y0_next : std_logic;
begin

    -- Output logic (Moore outputs depend only on current state)
    z3 <= y3;
    z2 <= y2;
    z1 <= y1;
    z0 <= y0;

    -- Next state logic
    y3_next <= (not w and not y3 and not y2 and not y1 and not y0) or
               (not w and y3 and not y2 and not y1 and y0) or
               (w and not y3 and y2 and y1);

    y2_next <= (not w and y3 and not y2 and not y1 and not y0) or
               (not w and not y3 and y2 and y0) or
               (not w and not y3 and y2 and y1) or
               (w and not y3 and y2 and not y1) or
               (w and not y3 and not y2 and y1);

    y1_next <= (not y3 and y2 and not y1 and not y0) or
               (not w and y3 and not y2 and not y1 and not y0) or
               (not w and not y3 and y1 and y0) or
               (w and not y3 and not y1);

    y0_next <= (not w and not y3 and not y0) or
               (not w and y3 and not y2 and not y1 and not y0) or
               (w and not y3 and y0) or
               (w and y3 and not y2 and not y1 and y0);

    -- State register process
    process(clk, reset)
    begin
        if reset = '1' then
            y3 <= '0';
            y2 <= '0';
            y1 <= '0';
            y0 <= '0';
        elsif rising_edge(clk) then
            y3 <= y3_next;
            y2 <= y2_next;
            y1 <= y1_next;
            y0 <= y0_next;
        end if;
    end process;

end architecture;
