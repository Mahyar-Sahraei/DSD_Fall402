LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY uart IS
	PORT(
		start:    IN std_logic;
		data_in:  IN std_logic_vector(7 DOWNTO 0);
		rx:       IN std_logic;
		clk:      IN std_logic;
		nreset:   IN std_logic;
		
		strobe:   OUT std_logic;
		data_out: OUT std_logic_vector(7 DOWNTO 0);
		tx:       OUT std_logic
		
	);
END uart;

ARCHITECTURE behavioural OF uart IS
	TYPE state_t is (SS, S0, S1, S2, S3, S4, S5, S6, S7, S8, SD);
	
	SIGNAL cur_recv_state, nxt_recv_state: state_t := S0;
	SIGNAL cur_trsm_state, nxt_trsm_state: state_t := S0;
	
BEGIN
	recv_sequential: PROCESS(clk, nreset)
	BEGIN
		IF nreset = '0' THEN
			cur_recv_state <= S0;
		ELSIF rising_edge(clk) THEN
			cur_recv_state <= nxt_recv_state;
		END IF;
	END PROCESS recv_sequential;
	
	trsm_sequential: PROCESS(clk, nreset)
	BEGIN
		IF nreset = '0' THEN
			cur_trsm_state <= S0;
		ELSIF rising_edge(clk) THEN
			cur_trsm_state <= nxt_trsm_state;
		END IF;
	END PROCESS trsm_sequential;
	
	recv_cobmbinational: PROCESS(cur_recv_state, rx)
	BEGIN
		strobe <= '0';

		CASE cur_recv_state IS
		WHEN S0 =>
			nxt_recv_state <= S1;
		  
		WHEN S1 =>
			data_out(0) <= rx;
			nxt_recv_state <= S2;
		  
		WHEN S2 =>
			data_out(1) <= rx;
			nxt_recv_state <= S3;
		  
		WHEN S3 =>
			data_out(2) <= rx;
			nxt_recv_state <= S4;
		  
		WHEN S4 =>
			data_out(3) <= rx;
			nxt_recv_state <= S5;
		  
		WHEN S5 =>
			data_out(4) <= rx;
			nxt_recv_state <= S6;
		  
		WHEN S6 =>
			data_out(5) <= rx;
			nxt_recv_state <= S7;
		  
		WHEN S7 =>
			data_out(6) <= rx;
			nxt_recv_state <= S8;
		  
		WHEN S8 =>
			data_out(7) <= rx;
			nxt_recv_state <= SD;
			strobe <= '1';

		WHEN OTHERS => -- SD
			nxt_recv_state <= S0;
			data_out <= "00000000";
			strobe <= '0';

		END CASE;

	END PROCESS recv_cobmbinational;
	
	trsm_cobmbinational: PROCESS(cur_trsm_state, data_in, clk, start)
	BEGIN
		nxt_trsm_state <= cur_trsm_state;
		tx <= '1';

		CASE cur_trsm_state IS
		WHEN S0 =>
			nxt_trsm_state <= SS;

		WHEN SS =>
			tx <= '0';
			nxt_trsm_state <= S1;
		  
		WHEN S1 =>
			tx <= data_in(0);
			nxt_trsm_state <= S2;
		  
		WHEN S2 =>
			tx <= data_in(1);
			nxt_trsm_state <= S3;
		  
		WHEN S3 =>
			tx <= data_in(2);
			nxt_trsm_state <= S4;
		  
		WHEN S4 =>
			tx <= data_in(3);
			nxt_trsm_state <= S5;
		  
		WHEN S5 =>
			tx <= data_in(4);
			nxt_trsm_state <= S6;
		  
		WHEN S6 =>
			tx <= data_in(5);
			nxt_trsm_state <= S7;
		  
		WHEN S7 =>
			tx <= data_in(6);
			nxt_trsm_state <= S8;
			  
		WHEN S8 =>
			tx <= data_in(7);
			nxt_trsm_state <= SD;

		WHEN OTHERS => -- SD
			nxt_trsm_state <= S0;

		END CASE;

	END PROCESS trsm_cobmbinational;

END behavioural;