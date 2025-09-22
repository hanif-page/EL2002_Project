-- VHDL Code for f = ab + bc + cd (Behavioral Style)

-- Step 1: Declare the library and package.
-- This is the same as in the structural version.
library ieee;
use ieee.std_logic_1164.all;

-- Step 2: Define the entity.
-- The entity is identical to the one in the structural version,
-- as the external interface of the circuit does not change.
entity logic_function_behavioral is
    port (
        a, b, c, d : in  std_logic;
        f          : out std_logic
    );
end entity logic_function_behavioral;

-- Step 3: Define the architecture.
-- This 'behavioral' architecture will describe the circuit's function
-- with a single concurrent statement.
architecture behavioral of logic_function_behavioral is

begin

    -- Step 4: Describe the behavior with a logical expression.
    -- This single line directly implements the boolean function.
    -- The synthesizer will convert this expression into an optimal
    -- logic gate structure during compilation.
    f <= (a and b) or (b and c) or (c and d);

end architecture behavioral;