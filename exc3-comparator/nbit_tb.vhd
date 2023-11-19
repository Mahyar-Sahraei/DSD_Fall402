entity Comparator_TB is
end entity;

architecture sim of Comparator_TB is
  constant N: natural := 8;  -- Number of bits for N-bit comparison

  signal clk: std_logic := '1';
  signal A, B: std_logic_vector(N-1 downto 0);
  signal GT, LT: std_logic;

begin
  -- Instantiate the Comparator module
  DUT: entity work.Comparator
    port map (
      clk => clk,
      A => A,
      B => B,
      GT => GT,
      LT => LT
    );

  -- Clock process
  clk_proc: process
  begin
    while now < 1000 ns loop
      clk <= '1';
      wait for 5 ns;
      clk <= '0';
      wait for 5 ns;
    end loop;
    wait;
  end process clk_proc;

  -- Stimulus process
  stim_proc: process
  begin
    -- Testcase for N-bit comparison
    A <= "11111111";
    B <= "00000000";
    wait until rising_edge(clk);
    assert GT = '1' and LT = '0'
      report "N-bit comparison test failed for A > B" severity error;

    A <= "00000000";
    B <= "11111111";
    wait until rising_edge(clk);
    assert GT = '0' and LT = '1'
      report "N-bit comparison test failed for A < B" severity error;

    A <= "10101010";
    B <= "01010101";
    wait until rising_edge(clk);
    assert GT = '1' and LT = '0'
      report "N-bit comparison test failed for A > B" severity error;

    A <= "01010101";
    B <= "10101010";
    wait until rising_edge(clk);
    assert GT = '0' and LT = '1'
      report "N-bit comparison test failed for A < B" severity error;

    -- Testcase for 1-bit comparison
    A <= '1';
    B <= '0';
    wait until rising_edge(clk);
    assert GT = '1' and LT = '0'
      report "1-bit comparison test failed for A > B" severity error;

    A <= '0';
    B <= '1';
    wait until rising_edge(clk);
    assert GT = '0' and LT = '1'
      report "1-bit comparison test failed for A < B" severity error;

    A <= '1';
    B <= '1';
    wait until rising_edge(clk);
    assert GT = '0' and LT = '0'
      report "1-bit comparison test failed for A = B" severity error;

    wait;
  end process stim_proc;

end architecture;
