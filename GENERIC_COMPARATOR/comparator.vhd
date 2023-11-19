LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY comparator IS
	GENERIC(n: integer := 8);
	PORT(
		-- INPUT PORTS
		a:    IN std_logic_vector(n - 1 DOWNTO 0);
		b:    IN std_logic_vector(n - 1 DOWNTO 0);
		agbi: IN std_logic;
		albi: IN std_logic;
		aebi: IN std_logic;

		-- OUTPUT PORTS
		agbo: OUT std_logic;
		albo: OUT std_logic;
		aebo: OUT std_logic
	);
END comparator;

ARCHITECTURE generic_comp OF comparator IS
	SIGNAL g: std_logic_vector(n DOWNTO 0);
	SIGNAL l: std_logic_vector(n DOWNTO 0);
	SIGNAL e: std_logic_vector(n DOWNTO 0);
BEGIN
	g(0) <= agbi;
	l(0) <= albi;
	e(0) <= aebi;
	LABEL_0: FOR i IN 0 TO n - 1 GENERATE
		g(i + 1) <= (a(i) AND (NOT b(i))) OR ((a(i) XOR b(i)) AND g(i));
		l(i + 1) <= ((NOT a(i)) AND b(i)) OR ((a(i) XOR b(i)) AND l(i));
		e(i + 1) <= (a(i) XNOR b(i)) AND e(i);
	END GENERATE LABEL_0;
	agbo <= g(n);
	albo <= l(n);
	aebo <= e(n);

END generic_comp;