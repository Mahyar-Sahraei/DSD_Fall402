library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_TB is
end entity;

architecture sim of Comparator_TB is
    constant N: natural := 8;  -- Number of bits for N-bit comparison

    signal A, B: std_logic_vector(0 to N-1);
    signal GT, LT, EQ: std_logic;

begin
    -- Instantiate the Comparator module
    DUT: entity work.NBitComparator
        port map (
            A => A,
            B => B,
            GT => GT,
            LT => LT,
            EQ => EQ
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Testcase for N-bit comparison
        
    A <= "11111111";
    B <= "00000000";
    wait for 10 ns;
    assert GT = '1' and LT = '0' and EQ = '0'
        report "N-bit comparison test failed for A > B" severity error;

    A <= "11010111";
    B <= "11010111";
    wait for 10 ns;
    assert GT = '0' and LT = '0' and EQ = '1'
        report "N-bit comparison test failed for A = B" severity error;

    A <= "00000000";
    B <= "11111111";
    wait for 10 ns;
    assert GT = '0' and LT = '1' and EQ = '0'
        report "N-bit comparison test failed for A < B" severity error;

    A <= "10101010";
    B <= "01010101";
    wait for 10 ns;
    assert GT = '1' and LT = '0' and EQ = '0'
        report "N-bit comparison test failed for A > B" severity error;

    A <= "01010101";
    B <= "10101010";
    wait for 10 ns;
    assert GT = '0' and LT = '1' and EQ = '0'
        report "N-bit comparison test failed for A < B" severity error;

    A <= "11110000";
    B <= "00001111";
    wait for 10 ns;
    assert GT = '1' and LT = '0' and EQ = '0'
        report "N-bit comparison test failed for A > B" severity error;

    A <= "00001111";
    B <= "11110000";
    wait for 10 ns;
    assert GT = '0' and LT = '1' and EQ = '0'
        report "N-bit comparison test failed for A < B" severity error;

    A <= "11001100";
    B <= "11001100";
    wait for 10 ns;
    assert GT = '0' and LT = '0' and EQ = '1'
        report "N-bit comparison test failed for A = B" severity error;

    -- End simulation
    wait;
end process stim_proc;

end architecture sim;
