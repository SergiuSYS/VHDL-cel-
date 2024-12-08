library IEEE;
use IEEE.std_logic_1164.all;

entity MUX2X1 is 
port(
    J:   in std_logic_vector(1 downto 0);
    S: in std_logic;
    Y:   out std_logic
);

end MUX2X1;

architecture structural of MUX2X1 is

begin
    Y <= (not S and J(0)) or (S and J(1));
end structural ;




library IEEE;
use IEEE.std_logic_1164.all;

entity MUX4X1 is 
port(
    J:   in std_logic_vector(3 downto 0);
    S: in std_logic_vector(1 downto 0);
    Y:   out std_logic
);

end MUX4X1;

architecture structural of MUX4X1 is

begin
    Y <= (not S(0) and not S(1) and J(0))
        or (not S(0) and S(1) and J(1))
        or (S(0) and not S(1) and J(2))
        or (S(0) and S(1) and J(3));

end structural;



library IEEE;
use IEEE.std_logic_1164.all;

entity MUX8X1 is
    port(
        J:    in std_logic_vector(7 downto 0);
        SEL:  in std_logic_vector(2 downto 0);
        O:    out std_logic
    );
end MUX8X1;

architecture structural of MUX8X1 is

    component MUX2X1
    port(
        J:    in std_logic_vector(1 downto 0);
        S:    in std_logic;
        Y:    out std_logic
    );
    end component;

    component MUX4X1
    port(
        J:    in std_logic_vector(3 downto 0);
        S:    in std_logic_vector(1 downto 0);
        Y:    out std_logic
    );
    end component;
    
    signal OutY1, OutY2: std_logic; 
    signal OutY_combined: std_logic_vector(1 downto 0);
begin
    Mux4x1_1: MUX4X1 port map(J(3 downto 0), SEL(1 downto 0), OutY1);
    Mux4x1_2: MUX4X1 port map(J(7 downto 4), SEL(1 downto 0), OutY2);
    OutY_combined <= (OutY1, OutY1);
    Mux2x1_1: MUX2X1 port map(OutY_combined, SEL(2), O);
end structural;
