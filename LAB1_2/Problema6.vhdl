library IEEE;
use IEEE.std_logic_1164.all;

entity DEMUX4X1 is 
port (
    F:      in std_logic;
    I:      in std_logic_vector(1 downto 0);
    A,B,C,D:out std_logic
);
end DEMUX4X1;

architecture demultiplexer4x1 of DEMUX4X1 is

begin
    A <= not I(0) and not I(1) and F;
    B <= not I(0) and I(1) and F;
    C <= I(0) and not I(1) and F;
    D <= I(0) and I(1) and F;

end demultiplexer4x1; 

