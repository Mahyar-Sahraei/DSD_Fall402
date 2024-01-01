library ieee;
use ieee.std_logic_1164.all;

entity UART_TB is
end entity UART_TB;

architecture Behavioral of UART_TB is
    -- Constants
    constant DATA_WIDTH: integer := 8;
    constant CLK_PERIOD: time := 10 ns;
    
    -- Signals
    signal start: std_logic := '0';
    signal din: std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
    signal clk: std_logic := '0';
    signal rst: std_logic := '1';
    signal io: std_logic;
    signal dout: std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal done: std_logic;
    
    -- UART instance
    component UART is
        generic (
            DATA_WIDTH: integer := 8
        );
        port (
            start: in std_logic;
            din: in std_logic_vector(DATA_WIDTH - 1 downto 0);
            clk: in std_logic;
            rst: in std_logic;
            io: inout std_logic;
            dout: out std_logic_vector(DATA_WIDTH - 1 downto 0);
            done: out std_logic
        );
    end component UART;
    
begin
    -- UART DUT instantiation
    DUT: UART
        generic map (
            DATA_WIDTH => DATA_WIDTH
        )
        port map (
            start => start,
            din => din,
            clk => clk,
            rst => rst,
            io => io,
            dout => dout,
            done => done
        );

    -- Clock process
    process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        -- Reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        wait for 10 ns;

        -- Scenario 1: Transmit and receive successfully
        start <= '1';
	io <= 'Z';
        din <= "01010101";
        wait for 20 ns;
        start <= '0';
	wait for 95 ns;
	io <= '1';
        wait for 40 ns;
	io <= 'Z';

        -- Scenario 2: Transmit with parity error
        start <= '1';
        din <= "10111011";
        wait for 20 ns;
        start <= '0';
	wait for 100 ns;
	io <= '0';
	wait for 10 ns; 
	io <= 'Z';
        wait for 110 ns;
	io <= '1';
	wait for 10 ns;
	io <= 'Z';
	wait for 20 ns;

        -- Scenario 3: Receive with parity error
        start <= '0';
        io <= '0';	-- start
        wait for 10 ns;
        io <= '1';	-- data
        wait for 10 ns;
        io <= '0';
        wait for 10 ns;
        io <= '0';
        wait for 10 ns;
        io <= '1';
        wait for 10 ns;
        io <= '1';
        wait for 10 ns;
        io <= '1';
        wait for 10 ns;
        io <= '0';
        wait for 10 ns;
	io <= '1';
	wait for 10 ns;
	--io <= '0';	-- wrong parity
	io <= '1';	-- right parity
	wait for 10 ns;
	io <= 'Z';

        -- Scenario 4: Idle state
        start <= '0';
        io <= 'Z';
        wait for 10 ns;
        assert done = '0' report "Scenario 4 failed: Unexpected done signal" severity error;
        wait for 10 ns;

        -- Add more test scenarios as needed...

        wait;
    end process;
end architecture Behavioral;