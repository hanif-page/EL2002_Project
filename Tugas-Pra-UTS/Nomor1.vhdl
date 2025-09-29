library ieee;
use ieee.std_logic_1164.all;

entity sistem_LPMT is 
    port (
        L1 : in std_logic;
        P1 : in std_logic;
        M1 : in std_logic;
        T1 : in std_logic;
        Y : out std_logic;
    );
end entity sistem_LPMT;

architecture behavioral of sistem_LPMT is 
begin 
    Y <= (P1 and T1) or (P1 and M1) or ((not L1) and T1);
end architecture behavioral;