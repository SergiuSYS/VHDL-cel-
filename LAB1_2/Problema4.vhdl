library IEEE;
use IEEE.std_logic_1164.all;

entity LogicGates1 is 
port(
    I:in std_logic_vector(5 downto 0);
    Z:out std_logic
);
end LogicGates1;

architecture LogicgatesV1 of LogicGates1 is
begin
    Z <= not((I(0) and I(1) and I(2)) or not I(3) or (I(4) or I(5)));

end LogicgatesV1; 