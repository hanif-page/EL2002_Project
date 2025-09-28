library ieee;
use ieee.std_logic_1164.all;

entity checker is 
    port(
        X : in std_logic_vector(3 downto 0);
        y : out std_logic;
    );
end entity checker;

architecture behavioral of checker is 
begin 
    y <= ((not X(3)) and (not X(2))) or (X(3) and X(2)) or (X(3) and X(1) and X(0));
end architecture behavioral;