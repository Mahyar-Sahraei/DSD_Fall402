LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

PACKAGE uart_test IS
    PROCEDURE test_from_file (
        SIGNAL period:  IN  time; 
        SIGNAL start:    OUT std_logic;
	SIGNAL data_in:  OUT std_logic_vector(7 DOWNTO 0);
	SIGNAL rx:       OUT std_logic;
	SIGNAL clk:      OUT std_logic;
	SIGNAL nreset:   OUT std_logic);
END uart_test;

PACKAGE BODY uart_test IS
    PROCEDURE test_from_file (
        SIGNAL period:   IN  time;
        SIGNAL start:    OUT std_logic;
	SIGNAL data_in:  OUT std_logic_vector(7 DOWNTO 0);
	SIGNAL rx:       OUT std_logic;
	SIGNAL clk:      OUT std_logic;
	SIGNAL nreset:   OUT std_logic
    ) IS
            TYPE char_file_t IS FILE OF character;
            FILE     fp:           char_file_t;
            VARIABLE c:            character;
            VARIABLE current_time: time    := 0 ns;
            VARIABLE line_number:  integer := 1;
            CONSTANT n_columns:    integer := 18;
            VARIABLE data_in_reg:    std_logic_vector(7 DOWNTO 0);
    
    BEGIN
        FILE_OPEN(fp, "test.txt", READ_MODE);

        -- Ignoring two lines
        FOR i IN 0 TO 2 * n_columns - 1 LOOP
            READ(fp, c);
        END LOOP;

        WHILE ( NOT ENDFILE(fp) ) LOOP

            -- Read start
            READ(fp, c);
            IF c = '0' THEN
                start <= TRANSPORT '0' AFTER current_time;
            ELSIF c = '1' THEN
                start <= TRANSPORT '1' AFTER current_time;
	    ELSE
		start <= TRANSPORT 'U' AFTER current_time;
            END IF;

            READ(fp, c);

            -- Read data_in
            FOR j IN 0 TO 7 LOOP
                READ(fp, c);
                IF c = '0' THEN
                    data_in_reg(j) := '0';
                ELSIF c = '1' THEN
                    data_in_reg(j) := '1';
		ELSE
		    data_in_reg(j) := 'U';
                END IF;
            END LOOP;
            data_in <= TRANSPORT data_in_reg AFTER current_time;

            READ(fp, c);

            -- Read rx
            READ(fp, c);
            IF c = '0' THEN
                rx <= TRANSPORT '0' AFTER current_time;
            ELSIF c = '1' THEN
                rx <= TRANSPORT '1' AFTER current_time;
	    ELSE
		rx <= TRANSPORT 'X' AFTER current_time;
            END IF;

            READ(fp, c);
            
            -- Read clk
            READ(fp, c);
            IF c = '0' THEN
                clk <= TRANSPORT '0' AFTER current_time;
            ELSE
                clk <= TRANSPORT '1' AFTER current_time;
            END IF;

            READ(fp, c);
            
            -- Read nreset
            READ(fp, c);            
            IF c = '0' THEN
                nreset <= TRANSPORT '0' AFTER current_time;
            ELSIF c = '1' THEN
                nreset <= TRANSPORT '1' AFTER current_time;
	    ELSE
		nreset <= TRANSPORT 'U' AFTER current_time;
            END IF;

            -- Read carriage return
            READ(fp, c);
            -- Read line feed
            READ(fp, c);

            current_time := current_time + period;
            line_number := line_number + 1;
        END LOOP;
        FILE_CLOSE(fp);
        
    END PROCEDURE test_from_file;
END PACKAGE BODY uart_test;