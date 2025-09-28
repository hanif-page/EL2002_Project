library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rangkaian_ED is 
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        -- D : out std_logic_vector(3 downto 0);
        A0 : out std_logic;
        D0 : out std_logic;
        X : out std_logic
    );
end entity rangkaian_ED;

architecture behavioral of rangkaian_ED is 
    signal B_negative : std_logic_vector(3 downto 0);
begin
    -- getting the B 2's complements
    B_negative <= std_logic_vector(unsigned(not B) + 1); 
    
    A0 <= A(0);
    -- D <= B_negative;
    D0 <= B_negative(0);

    X <= not(A0 xor D0);
    
end architecture behavioral