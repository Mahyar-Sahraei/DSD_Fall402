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
    process (clk, rst)
    begin
        if (rst = '1') then
            current_state <= IDLE;
            bit_counter <= 0;
            internal_io <= '0';
            received_parity <= '0';
            received_data <= (others => '0');
            done <= '0';
        elsif (rising_edge(clk)) then
            current_state <= next_state;
            case current_state is
                
                when IDLE =>
                    if (start = '1') then
                        next_state <= TRANSMIT;
                    elsif (io = '0') then
                        next_state <= RECEIVE;
                    else
                        next_state <= IDLE;
                    end if;
                
                when TRANSMIT =>
                    case bit_counter is
                        when 0 =>
                            internal_io <= '0'; -- Start bit
                            bit_counter <= bit_counter + 1;
                            next_state <= TRANSMIT;
                            
                        when 1 to DATA_WIDTH =>
                            internal_io <= din(bit_counter - 1); -- Data bits
                            bit_counter <= bit_counter + 1;
                            next_state <= TRANSMIT;
                            
                        when DATA_WIDTH + 1 =>
                            parity_bit <= calculate_parity(din); -- Calculate and store parity bit
                            internal_io <= parity_bit;
                            bit_counter <= bit_counter + 1;
                            next_state <= TRANSMIT;
                            
                        when DATA_WIDTH + 2 =>
                            internal_io <= '1'; -- Stop bit
                            bit_counter <= bit_counter + 1;
                            next_state <= IDLE;
                            
                        when others =>
                            if (io = '1') then -- Transmission successful
                                bit_counter <= 0;
                                next_state <= IDLE;
                                done <= '1';
                            else -- Transmission failed, retry
                                next_state <= TRANSMIT;
                                bit_counter <= 0;
                                done <= '0';
                            end if;
                    end case;
                    
                when RECEIVE =>
                    case bit_counter is
                        when 0 to DATA_WIDTH - 1 =>
                            received_data(bit_counter) <= io; -- Receive data bits
                            bit_counter <= bit_counter + 1;
                            next_state <= RECEIVE;
                            
                        when DATA_WIDTH =>
                            received_parity <= io; -- Receive parity bit
                            bit_counter <= bit_counter + 1;
                            next_state <= RECEIVE;
                            
                        when DATA_WIDTH + 1 =>
                            if (received_parity = calculate_parity(received_data)) then -- Parity check
                                internal_io <= '1';
                            else
                                internal_io <= '0';
                            end if;
                            bit_counter <= bit_counter + 1;
                            next_state <= RECEIVE;
                            
                        when others =>
                            dout <= received_data; -- Output received data
                            next_state <= IDLE;
                            done <= '1';
                    end case;
                    
            end case;
	io <= internal_io;
        end if;
    end process;

end architecture Behavioral;