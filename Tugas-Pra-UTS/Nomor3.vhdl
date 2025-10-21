library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- used for adding +1 in the process of getting 2's complements

entity RangkaianED is -- the "RangkaianED" name must be the same with the filename in the Quartus 
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        -- D : out std_logic_vector(3 downto 0);
        A0 : buffer std_logic; -- buffer because we don't actually OUTPUT A0 and D0, it only used in the internal process
        D0 : buffer std_logic;
        X : out std_logic
    );
end entity RangkaianED;

architecture behavioral of RangkaianED is 
    signal B_negative : std_logic_vector(3 downto 0);
begin
    -- getting the B 2's complements
    B_negative <= std_logic_vector(unsigned(not B) + 1); 
    
    A0 <= A(0);
    -- D <= B_negative;
    D0 <= B_negative(0);

    X <= not(A0 xor D0);
    
end architecture behavioral;