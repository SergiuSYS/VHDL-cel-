library IEEE;
use IEEE.std_logic_1164.all;

entity Ci1 is 
port(
    A, B, C : in std_logic;
    K       : out std_logic
);
end Ci1;

architecture structural of Ci1 is
begin
    K <= not(A and B and C);
end structural;

library IEEE;
use IEEE.std_logic_1164.all;

entity Ci2 is 
port(
    A, B : in std_logic;
    K    : out std_logic
);
end Ci2;

architecture structural of Ci2 is
begin
    K <= A or B;
end structural;

library IEEE;
use IEEE.std_logic_1164.all;

entity Ci3 is 
port(
    A, B, C : in std_logic;
    E       : out std_logic
);
end Ci3;

architecture structural of Ci3 is
begin
    E <= not(A or B or C);
end structural;

library IEEE;
use IEEE.std_logic_1164.all;

entity Ctot is 
port(
    I : in std_logic_vector(5 downto 0);
    Z : out std_logic
);
end Ctot;

architecture structural of Ctot is

    component Ci1
    port(
        A, B, C : in std_logic;
        K       : out std_logic
    );
    end component;

    component Ci2
    port(
        A, B : in std_logic;
        K    : out std_logic
    );
    end component;
    
    component Ci3
    port(
        A, B, C : in std_logic;
        E       : out std_logic
    );
    end component;

    signal Sig1, Sig2, Sig3 : std_logic;
begin
    CI1_inst: Ci1 port map(I(0), I(1), I(2), Sig1); 
    Sig2 <= not I(3);
    CI2_inst: Ci2 port map(I(4), I(5), Sig3);       
    CI3_inst: Ci3 port map(Sig1, Sig2, Sig3, Z);    
end structural;
