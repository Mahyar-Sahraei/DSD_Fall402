LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY test_fa IS BEGIN END test_fa;

ARCHITECTURE arch OF test_fa IS
    CONSTANT n: integer := 4;
    SIGNAL start, A, B, clk, nrst, cout, done: std_logic;
    SIGNAL Sum: std_logic_vector(n - 1 DOWNTO 0);
BEGIN
    DUT: ENTITY work.full_adder(sequential_arch) 
    GENERIC MAP(n)
    PORT MAP(
        start, A, B, clk, nrst, cout, done, Sum
    );

    STIM_PROC: PROCESS
        VARIABLE A1: std_logic_vector(n - 1 DOWNTO 0) := "1001";
        VARIABLE B1: std_logic_vector(n - 1 DOWNTO 0) := "1100";

        VARIABLE A2: std_logic_vector(n - 1 DOWNTO 0) := "0111";
        VARIABLE B2: std_logic_vector(n - 1 DOWNTO 0) := "1011";

        VARIABLE A3: std_logic_vector(n - 1 DOWNTO 0) := "1000";
        VARIABLE B3: std_logic_vector(n - 1 DOWNTO 0) := "1111";
    BEGIN

        -- TEST ZERO
        start <= '0';
        nrst <= '0';
        clk <= '1';
        WAIT FOR 2 ns;
        clk <= '0';
        WAIT FOR 2 ns;
        ASSERT done = '0'
            REPORT "Assertion failed for reset" SEVERITY error;

        -- TEST ONE
        nrst <= '0';
        WAIT FOR 6 ns;

        start <= '1';
        nrst <= '1';
        FOR i IN 0 TO n - 1 LOOP
            A <= A1(i);
            B <= B1(i);
            clk <= '1';
            WAIT FOR 2 ns;
            clk <= '0';
            WAIT FOR 2 ns;
            start <= '0';
        END LOOP;
        ASSERT cout = '1' AND done = '1' AND Sum = "0101"
            REPORT "Assertion failed for 1001 + 1100" SEVERITY error;

        -- TEST TWO
        nrst <= '0';
        WAIT FOR 6 ns;
        
        start <= '1';
        nrst <= '1';
        FOR i IN 0 TO n - 1 LOOP
            A <= A2(i);
            B <= B2(i);
            clk <= '1';
            WAIT FOR 2 ns;
            clk <= '0';
            WAIT FOR 2 ns;
            start <= '0';
        END LOOP;
        ASSERT cout = '1' AND done = '1' AND Sum = "0010"
            REPORT "Assertion failed for 0111 + 1011" SEVERITY error;

        WAIT;
    END PROCESS STIM_PROC;
END arch;