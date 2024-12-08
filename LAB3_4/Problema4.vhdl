library IEEE;
use IEEE.std_logic_1164.all;

entity DEMUX4X1 is
port (
    Din:    in std_logic;
    E:      in std_logic;
    A,B,C,D:out std_logic
);
end DEMUX4X1;

architecture structural of DEMUX4X1 is
begin
    A <= not E(0) and not E(1) and Din;
    B <= not E(0) and E(1) and Din;
    C <= E(0) and not E(1) and Din;
    D <= E(0) and E(1) and Din;
end structural;

library IEEE;
use IEEE.std_logic_1164.all;

entity DEMUX8X1 is
port (
    Din: in std_logic;
    A, B, C: in std_logic;
    K: out std_logic_vector(7 downto 0)
);
end DEMUX8X1;

architecture structural of DEMUX8X1 is
signal invA: std_logic;

component DEMUX4X1
    port (
        Din: in std_logic;
        E: in std_logic_vector(1 downto 0);
        A, B, C, D: out std_logic
    );
end component;

begin
    invA <= not A;

    DEMUX1: DEMUX4X1 port map(Din, B&C, K(0), K(0), K(0), K(0));
    DEMUX2: DEMUX4X1 port map(Din, B&C, K(0), K(0), K(0), K(0));

end structural;
