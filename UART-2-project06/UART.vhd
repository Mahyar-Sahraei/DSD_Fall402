library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART is
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
end entity UART;

architecture Behavioral of UART is
    type State is (IDLE, TRANSMIT, RECEIVE);
    signal current_state: State;
    signal next_state: State;
    signal internal_io: std_logic;
    signal count_en: std_logic;
    signal count_rst: std_logic;
    signal bit_counter: integer range 0 to DATA_WIDTH + 3;
    signal parity_bit: std_logic;
    signal received_parity: std_logic;
    signal received_data: std_logic_vector(DATA_WIDTH - 1 downto 0);
    
    -- Parity calculation function
    function calculate_parity(data: std_logic_vector) return std_logic is
        variable parity: std_logic := '0';
    begin
        for i in data'range loop
            parity := parity xor data(i);
        end loop;
        return parity;
    end function calculate_parity;
    
begin
    seq: process (clk, rst)
    begin
        if (rst = '1') then
            current_state <= IDLE;
        elsif (rising_edge(clk)) then
            current_state <= next_state;
            if (count_rst = '1' and count_en = '1') then
                bit_counter <= 1;
	    elsif (count_rst = '1') then
                bit_counter <= 0;
	    elsif (count_en = '1') then
                bit_counter <= bit_counter + 1;
	    else
		bit_counter <= 0;
            end if;

        end if;
    end process seq;

    comb: process(current_state,start,io,din,bit_counter)
    begin
    case current_state is       
        when IDLE =>
            if (start = '1') then
                next_state <= TRANSMIT;
            elsif (io = '0') then
                next_state <= RECEIVE;
            else
                next_state <= IDLE;
            end if;
            count_rst <= '1';
            count_en <= '0';
            internal_io <= 'Z';
            io <= 'Z';
            received_parity <= '0';
            received_data <= (others => '0');
            done <= '0';

        when TRANSMIT =>
            case bit_counter is
                when 0 =>
                    --internal_io <= '0'; -- Start bit        
                    io <= '0'; -- Start bit        
                    count_en <= '1';
            	    count_rst <= '0';
                    next_state <= TRANSMIT;

                when 1 to DATA_WIDTH =>
                    --internal_io <= din(bit_counter - 1); -- Data bits
                    io <= din(DATA_WIDTH - bit_counter); -- Data bits
                    count_en <= '1';
            	    count_rst <= '0';
                    next_state <= TRANSMIT;

                when DATA_WIDTH + 1 =>
                    parity_bit <= calculate_parity(din); -- Calculate and store parity bit
                    --internal_io <= parity_bit;
		    io <= parity_bit;
                    count_en <= '1';
            	    count_rst <= '0';
                    next_state <= TRANSMIT;

                when DATA_WIDTH + 2 =>
                    --internal_io <= '1'; -- Stop bit
                    io <= '1'; -- Stop bit
                    count_en <= '1';
            	    count_rst <= '0';
                    next_state <= TRANSMIT;

                when others =>
                    internal_io <= 'Z';
                    if (io = '1') then -- Transmission successful
                        count_en <= '0';
            	    	count_rst <= '1';
                        next_state <= IDLE;
                        done <= '1';
                    else -- Transmission failed, retry
                        next_state <= TRANSMIT;
                        count_rst <= '1';
                        count_en <= '0';
                        done <= '0';
                    end if;
            end case;

        when RECEIVE =>
            case bit_counter is
                when 0 to DATA_WIDTH - 1 =>
                    received_data(bit_counter) <= io; -- Receive data bits
                    internal_io <= 'Z';
                    count_en <= '1';
                    count_rst <= '0';
                    next_state <= RECEIVE;

                when DATA_WIDTH =>
                    internal_io <= 'Z';
                    received_parity <= io; -- Receive parity bit
                    count_en <= '1';
                    count_rst <= '0';
                    next_state <= RECEIVE;

                when DATA_WIDTH + 1 =>
                    if (received_parity = calculate_parity(received_data)) then -- Parity check
                        internal_io <= '1';
                    else
                        internal_io <= '0';
                    end if;
                    count_en <= '1';
                    count_rst <= '0';
                    next_state <= RECEIVE;

                when others =>
                    dout <= received_data; -- Output received data
                    internal_io <= 'Z';
                    count_rst <= '1';
                    count_en <= '0';
                    next_state <= IDLE;
                    done <= '1';
            end case;
    end case;
    -- Internal signal assignment
	--if (current_state /= TRANSMIT) then
	--else
    --    io <= 'Z';
	--io <= internal_io;
	--end if;
    end process comb;

    -- Internal signal assignment
--    io <= internal_io when current_state /= TRANSMIT else 'Z';
end architecture Behavioral;