library IEEE;
use IEEE.std_logic_1164.all;
entity LatchD is
    Port ( 
        D, EN : in std_logic;
        Q : out std_logic
    );
end LatchD;

architecture structural of LatchD is
begin
    process(EN, D)
    begin
        if (EN = '1') then 
            Q <= D;
        else
            Q <= '0'; 
        end if;
    end process;
end structural;

-- ============================================================

library IEEE;
use IEEE.std_logic_1164.all;

entity Comp is 
port (
    A,B:in std_logic_vector(3 downto 0);
    EQ:out std_logic
);
end Comp;

architecture structural of Comp is 

begin 
    process(A,B)
    begin
        if A = B then EQ <= '1';
        else EQ <= '0';
        end if;
    end process;
end structural;

-- ============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;  

entity Numarator is
    port(
        CLK, RST : in  std_logic;                   
        N         : out std_logic_vector(3 downto 0) 
    );
end Numarator;

architecture structural of Numarator is
    signal TEMP : unsigned(3 downto 0);  
begin
    process(CLK, RST)
    begin
        if RST = '0' then
            TEMP <= (others => '0');  
        elsif rising_edge(CLK) then
            if TEMP = "1111" then
                TEMP <= (others => '0');  
            else
                TEMP <= TEMP + 1;  
            end if;
        end if;
    end process;
    N <= std_logic_vector(TEMP);  
end structural; 

-- ============================================================

library IEEE;
use IEEE.std_logic_1164.all;
entity BCD_7SEG is
    port(
        E : in std_logic_vector(3 downto 0); 
        K : out std_logic_vector(6 downto 0) 
    );
end BCD_7SEG;

architecture structural of BCD_7SEG is
begin
    process(E)
    begin
        case E is
            when "0000" => K <= "0000001";  -- 0
            when "0001" => K <= "1001111";  -- 1
            when "0010" => K <= "0010010";  -- 2
            when "0011" => K <= "0000110";  -- 3
            when "0100" => K <= "1001100";  -- 4
            when "0101" => K <= "0100100";  -- 5
            when "0110" => K <= "0100000";  -- 6
            when "0111" => K <= "0001111";  -- 7
            when "1000" => K <= "0000000";  -- 8
            when "1001" => K <= "0000100";  -- 9
            when others => K <= "1111111";  -- Blank or error
        end case;
    end process;
end structural;

-- ============================================================

library IEEE;
use IEEE.std_logic_1164.all;
entity TOT is
    port(
        X:in std_logic_vector(5 downto 0);
        Z:out std_logic_vector(6 downto 0)
    );
end TOT;

architecture structural of TOT is
    component Comp 
    port (
        A,B:in std_logic_vector(3 downto 0);
        EQ:out std_logic
    );
    end component;
    component Numarator 
        port(
            CLK, RST : in  std_logic;                   
            N         : out std_logic_vector(3 downto 0) 
        );
    end component;
    component BCD_7SEG 
        port(
        E: in  std_logic_vector(3 downto 0); 
        K: out std_logic_vector(6 downto 0) 
     );
    end component;
    component LatchD 
        Port ( 
            D,EN:in std_logic;
            Q:out std_logic
            );
    end component;

    signal outEq,outQ:std_logic;
    signal outN: std_logic_vector(3 downto 0);
begin
    NUMARATOR_1: Numarator port map(X(5),outQ,outN);
    BCD_7SEG_1: BCD_7SEG port map(outN,Z);
    COMP_1: Comp port map(X(3 downto 0), outN,outEq);
    LATCHD_1: LatchD port map(outEq,X(4));
end structural ; 
