LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE work.uart_test.ALL;

ENTITY uart_tb IS END uart_tb;

ARCHITECTURE uart_tb_arch OF uart_tb IS
    SIGNAL t_start, t_rx, t_clk, t_nreset: std_logic;
    SIGNAL t_data_in: std_logic_vector(7 DOWNTO 0);
    SIGNAL half_period: time := 5 ns;
BEGIN
    DUT: ENTITY work.uart(behavioural) PORT MAP(
        t_start, t_data_in, t_rx, t_clk, t_nreset
    );
    test_from_file(half_period, t_start, t_data_in, t_rx, t_clk, t_nreset);
    
END uart_tb_arch;