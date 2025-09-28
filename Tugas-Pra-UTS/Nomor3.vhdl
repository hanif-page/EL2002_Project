library ieee;
use ieee.std_logic_1164.all;

entity rangkaian_ED is 
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        A0 : out std_logic;
        B0 : out std_logic;
        X : out std_logic
    );
end entity rangkaian_ED;

architecture behavioral of rangkaian_ED is 
begin
    A0 <= A(0);
    B0 <= B(0);

    X <= not(A0 xor B0);
    
end architecture behavioral