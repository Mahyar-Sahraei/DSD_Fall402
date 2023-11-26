LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY full_adder IS
	GENERIC (n: integer := 8);
	PORT (
		-- INPUT PORTS
		start, A, B, clk, nrst: IN std_logic;

		-- OUTPUT PORTS
		cout, done: OUT std_logic;
		Sum: OUT std_logic_vector(n - 1 DOWNTO 0)
	);
END full_adder;

ARCHITECTURE generic_arch OF full_adder IS
	SIGNAL carry: std_logic_vector(n DOWNTO 0);
	SIGNAL processing: std_logic := '0';
	SIGNAL cycle: integer := -1;
BEGIN
	carry(0) <= '0';
	L0: FOR i IN 0 TO n - 1 GENERATE
		Sum(i) <= A XOR B XOR carry(i) WHEN (i = cycle) AND (processing = '1');
		carry(i + 1) <= (A AND B) OR (A AND carry(i)) OR (B AND carry(i));
	END GENERATE L0;
	cout <= carry(n);

	controller: PROCESS(clk)
		VARIABLE cycle_var: integer := -1;
	BEGIN
		IF nrst = '0' THEN
			carry <= (OTHERS => '0');
			cycle <= -1;
			Sum <= (OTHERS => '0');
		ELSIF (start = '1' OR processing = '1') AND clk = '1' THEN
			processing <= '1';
			cycle_var := cycle + 1;
			cycle <= cycle_var;
			IF cycle_var = n THEN
				done <= '1';
				processing <= '0';
				cycle <= -1;
			END IF;
		END IF;
	END PROCESS controller;
END generic_arch;

ARCHITECTURE sequential_arch OF full_adder IS
	SIGNAL carry, processing: std_logic := '0';
	SIGNAL cycle: integer := 0;
BEGIN 
	PROCESS(clk)
		VARIABLE carry_var: std_logic := '0';
		VARIABLE cycle_var: integer := 0;
	BEGIN
		IF nrst = '0' THEN
			carry <= '0';
			cycle <= 0;
			processing <= '0';
			Sum <= (OTHERS => '0');
		ELSIF (start = '1' OR processing = '1') AND (clk = '1') THEN
			processing <= '1';
			done <= '0';
			Sum(cycle) <= A XOR B XOR carry;
			carry_var := (A AND B) OR (A AND carry) OR (B AND carry);
			carry <= carry_var;
			cycle_var := cycle + 1;
			cycle <= cycle_var;
			IF cycle_var = n THEN
				cout <= carry_var;
				done <= '1';
				carry <= '0';
				cycle <= 0;
				processing <= '0';
			END IF;
		END IF;
	END PROCESS;
END sequential_arch;