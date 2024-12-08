library IEEE;
use IEEE.std_logic_1164.all;

entity nand_gate is 
port (
    A,B:in std_logic;
    X:  out std_logic
);
end nand_gate;

architecture nand_gate_1 of nand_gate is

begin
    X <= A nand B;
end nand_gate_1; 

