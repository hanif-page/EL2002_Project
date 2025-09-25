library ieee;
use ieee.std_logic_1164.all;

entity logic_function is 
    port (
        t, a, p : in std_logic;
        x       : out std_logic;
    );
end entity logic_function;

-- defining behavioral method
architecture behavioral of logic_function is 

begin 

    x <= a or (t and p);

end architecture behavioral;