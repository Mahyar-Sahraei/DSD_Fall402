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
BEGIN

END generic_arch;

ARCHITECTURE sequential_arch OF full_adder IS
	SIGNAL carry, processing: std_logic := '0';
	SIGNAL cycle: integer := 0;
BEGIN 
	PROCESS(clk)
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
			carry <= (A AND B) OR (A AND carry) OR (B AND carry);
			cycle <= cycle + 1;
			IF cycle = n - 1 THEN
				cout <= carry;
				done <= '1';
				processing <= '0';
			END IF;
		END IF;
	END PROCESS;
END sequential_arch;