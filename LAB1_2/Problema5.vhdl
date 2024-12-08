library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder is 
port(
    CIN,X,Y:in std_logic;
    COUT,SUM:out std_logic
);
end FullAdder;

architecture Ecuation of FullAdder is

begin
    SUM <= X xor Y xor CIN;
    COUT <= (X and Y) or (X and CIN) or (Y and CIN);
end Ecuation ; 