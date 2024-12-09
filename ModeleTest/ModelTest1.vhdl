library IEEE;
use IEEE.std_logic_1164.all;

entity Circuit_3 is 
port(
    A,B,C:in std_logic;
    F    :out std_logic
);
end Circuit_3;

architecture structural of Circuit_3 is
begin 
    F <= (A and B) xor C;
    end structural;

library IEEE;
use IEEE.std_logic_1164.all;

entity DEMUX4X1 is 
port(
    S1,S2,P:in std_logic;
    E: out std_logic_vector(3 downto 0)
);
    end DEMUX4X1;

architecture structural of DEMUX4X1 is 
begin
    E(0) <= not S1 and not S2 AND P;
    E(1) <= not S1 and S2 AND P;
    E(2) <= S1 and not S2 AND P;
    E(3) <= S1 and S2 AND P;
    end structural;

library IEEE;
use IEEE.std_logic_1164.all;

entity JKbistabil is 
port(
    J,K,CLK,R: in std_logic;
    Q, Qn: out std_logic
);
end JKbistabil;

architecture structural of JKbistabil is 
signal temp: std_logic;
begin
    temp <= '0';
    process(CLK,R)
        begin
        if R = '0' then
            temp <= '0';  
        elsif rising_edge(CLK) then
            if (J = '0' and K = '1') then temp <= '0';
            elsif (J = '1' and K = '0') then temp <= '1'; 
            elsif (J = '1' and K = '1') then temp <= not temp;
            end if;
        end if;
        Q <= temp;           
        Qn <= not temp;      
    end process;
end structural;


library IEEE;
use IEEE.std_logic_1164.all;

entity my_circuit is 
port(
    I:in std_logic_vector(7 downto 0);
    E:out std_logic_vector(3 downto 0)
);
end my_circuit;

architecture structural of  my_circuit is

    component Circuit_3 
    port(
        A,B,C:in std_logic;
        F    :out std_logic
    );
    end component;
    
    component DEMUX4X1 
    port(
        S1,S2,P:in std_logic;
        E: out std_logic_vector(3 downto 0)
    );
    end component;

    component JKbistabil 
    port(
        J,K,CLK,R: in std_logic;
        Q, Qn: out std_logic
    );
    end component;

    signal BQ,BQn,CQ: std_logic;
begin
    BISTABIL: JKbistabil port map(I(0),I(1),I(2),I(3),BQ,BQn);
    CIRCUIT: Circuit_3 port map(I(4),I(5),I(6),CQ);
    DEMUX: DEMUX4X1 port map(CQ,I(7),BQ,E);

end structural; 