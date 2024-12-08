LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY tb_DEMUX4X1 IS
-- No ports needed for a testbench
END tb_DEMUX4X1;

ARCHITECTURE behavior OF tb_DEMUX4X1 IS

    -- Component declaration for the DEMUX4X1 entity
    COMPONENT DEMUX4X1
        PORT(
            F : IN STD_LOGIC;
            I : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            A, B, C, D : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Signals to connect to the DEMUX4X1 component
    SIGNAL F : STD_LOGIC := '0';
    SIGNAL I : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    SIGNAL A, B, C, D : STD_LOGIC;

BEGIN

    uut: DEMUX4X1
        PORT MAP (
            F => F,
            I => I,
            A => A,
            B => B,
            C => C,
            D => D
        );

    -- Stimulus process to apply test vectors
    stim_proc: PROCESS
    BEGIN
        -- Test 1: F = '1', I = "00"
        F <= '1'; I <= "00";  -- Expected A = '1', B = '0', C = '0', D = '0'
        WAIT FOR 10 ns;
        
        -- Test 2: F = '1', I = "01"
        F <= '1'; I <= "01";  -- Expected A = '0', B = '1', C = '0', D = '0'
        WAIT FOR 10 ns;
        
        -- Test 3: F = '1', I = "10"
        F <= '1'; I <= "10";  -- Expected A = '0', B = '0', C = '1', D = '0'
        WAIT FOR 10 ns;
        
        -- Test 4: F = '1', I = "11"
        F <= '1'; I <= "11";  -- Expected A = '0', B = '0', C = '0', D = '1'
        WAIT FOR 10 ns;

        -- Test 5: F = '0', I = "00"
        F <= '0'; I <= "00";  -- Expected A = '0', B = '0', C = '0', D = '0'
        WAIT FOR 10 ns;

        -- End the simulation
        WAIT;
    END PROCESS;

END behavior;
