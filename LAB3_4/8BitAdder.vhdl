library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder is 
port(
    X, Y, CIN : in std_logic;
    COUT, SUM : out std_logic
);
end FullAdder;

architecture Behavioral of FullAdder is
begin
    SUM <= X xor Y xor CIN;
    COUT <= (X and Y) or (X and CIN) or (Y and CIN);
end Behavioral;





library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder4bit is 
port(
    A, B : in std_logic_vector(3 downto 0);
    CI   : in std_logic;
    S    : out std_logic_vector(3 downto 0);
    CO   : out std_logic
);
end FullAdder4bit;

architecture Structural of FullAdder4bit is
    component FullAdder
    port(
        X, Y, CIN : in std_logic;
        COUT, SUM : out std_logic
    );
    end component;
    
    signal COUT : std_logic_vector(3 downto 0);
begin

    FA0: FullAdder port map(A(0), B(0), CI, COUT(0), S(0));
    FA1: FullAdder port map(A(1), B(1), COUT(0), COUT(1), S(1));
    FA2: FullAdder port map(A(2), B(2), COUT(1), COUT(2), S(2));
    FA3: FullAdder port map(A(3), B(3), COUT(2), CO, S(3));
end Structural;





library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder8bit is 
port(
    A, B : in std_logic_vector(7 downto 0);
    CI   : in std_logic;
    S    : out std_logic_vector(7 downto 0);
    CO   : out std_logic
);
end FullAdder8bit;

architecture Structural of FullAdder8bit is

    component FullAdder4bit 
    port(
    A, B : in std_logic_vector(3 downto 0);
    CI   : in std_logic;
    S    : out std_logic_vector(3 downto 0);
    CO   : out std_logic
    );
    end component;

    signal COUT: std_logic;
begin 
    FA0: FullAdder4bit port map(A(3 downto 0), B(3 downto 0), CI, S(3 downto 0), COUT);
    FA1: FullAdder4bit port map(A(7 downto 4), B(7 downto 4), COUT, S(7 downto 4), CO);
end Structural;

