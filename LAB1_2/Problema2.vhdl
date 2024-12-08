library IEEE;
use IEEE.std_logic_1164.all;

entity LogicGates is 
port(
    A,B,C:in std_logic;
    X,Y,Z:out std_logic
);
end LogicGates;

architecture LogicGatesV1 of LogicGates is
begin
    X <= A nand B;
    Y <= not C;
    Z <= B or C;

end LogicGatesV1 ; 