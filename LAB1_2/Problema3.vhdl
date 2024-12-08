library IEEE;
use IEEE.std_logic_1164.all;

entity MUX4X1 is 
port(
    A,B,C,D:in std_logic;
    SEL: in std_logic_vector(1 downto 0);
    F:out std_logic
);

end MUX4X1;

architecture Multiplexer4X1 of MUX4X1 is

begin
    F <= (not SEL(0) and not SEL(1) and A)
        or (not SEL(0) and SEL(1) and B)
        or (SEL(0) and not SEL(1) and C)
        or (SEL(0) and SEL(1) and D);

end Multiplexer4X1 ;