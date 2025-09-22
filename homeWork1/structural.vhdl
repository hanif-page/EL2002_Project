-- VHDL Code for f = ab + bc + cd (Structural Style)

-- Step 1: Declare the library and package to use.
-- 'ieee' is the library, and 'std_logic_1164' is the package
-- containing standard data types like 'std_logic'.
library ieee;
use ieee.std_logic_1164.all;

-- Step 2: Define the entity.
-- The entity is like a "black box" that declares the inputs and outputs.
-- Here, 'a', 'b', 'c', 'd' are inputs, and 'f' is the output.
entity logic_function_structural is
    port (
        a, b, c, d : in  std_logic;
        f          : out std_logic
    );
end entity logic_function_structural;

-- Step 3: Define the architecture.
-- The architecture describes how the "black box" works internally.
-- This 'structural' architecture will connect gates to build the circuit.
architecture structural of logic_function_structural is

    -- Step 4: Declare internal signals.
    -- These act as "wires" to connect the outputs of the AND gates
    -- to the inputs of the OR gate.
    signal w1, w2, w3 : std_logic;

begin

    -- Step 5: Instantiate the components (the logic gates).
    -- We are "mapping" the ports of the gates to the entity's ports
    -- and the internal wires.

    -- AND Gates for the product terms
    -- U1 is the label for the first AND gate: w1 = a * b
    U1 : w1 <= a and b;

    -- U2 is the label for the second AND gate: w2 = b * c
    U2 : w2 <= b and c;

    -- U3 is the label for the third AND gate: w3 = c * d
    U3 : w3 <= c and d;

    -- OR Gate to sum the terms
    -- U4 is the label for the final OR gate: f = w1 + w2 + w3
    U4 : f <= w1 or w2 or w3;

end architecture structural;