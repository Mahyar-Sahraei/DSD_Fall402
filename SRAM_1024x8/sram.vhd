LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY sram IS
	PORT(
		-- INPUT
		CLK:  IN std_logic;
		addr: IN std_logic_vector(9 DOWNTO 0);
		wr:   IN std_logic;
		din:  IN std_logic_vector(7 DOWNTO 0);
		
		-- OUTPUT
		dout: OUT std_logic_vector(7 DOWNTO 0)
	);
END sram;


ARCHITECTURE asynch_read OF sram IS
	-- TYPE DECLARATION
	TYPE mem1024x8_t IS ARRAY(1023 DOWNTO 0) OF std_logic_vector(7 DOWNTO 0);
	
	-- SIGNALS
	SIGNAL mem: mem1024x8_t;
BEGIN
	PROCESS(CLK)
	BEGIN
		-- SYNCHRONOUS WRITE
		IF CLK = '1' AND wr = '1' THEN
			mem(to_integer(unsigned(addr))) <= din;
		END IF;
	END PROCESS;
	-- ASYNCHRONOUS READ
	dout <= mem(to_integer(unsigned(addr)));
END asynch_read;


ARCHITECTURE synch_read OF sram IS
	-- TYPE DECLARATION
	TYPE mem1024x8_t IS ARRAY(1023 DOWNTO 0) OF std_logic_vector(7 DOWNTO 0);
	
	-- SIGNALS
	SIGNAL mem: mem1024x8_t;
BEGIN
	PROCESS(CLK)
	BEGIN
		-- SYNCHRONOUS WRITE
		IF CLK = '1' AND wr = '1' THEN
			mem(to_integer(unsigned(addr))) <= din;
		END IF;
			
		-- SYNCHRONOUS READ
		IF CLK = '1' THEN
			dout <= mem(to_integer(unsigned(addr)));
		END IF;
	END PROCESS;
END synch_read;
