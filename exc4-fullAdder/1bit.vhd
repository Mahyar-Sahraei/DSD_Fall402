library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity oneBitFullAdder is
    port (
        A, B,Cin : in std_logic;
        start,clk,nrst : in std_logic;
        Cout,sum,done : out std_logic
    );
end oneBitFullAdder;

architecture behavioral of oneBitFullAdder is
	signal s_temp, cout_temp: std_logic;
begin
    process(clk,nrst)
    begin
      if rising_edge(clk) then
  	    if nrst = '0' then
  		s_temp <='0';
  		cout_temp <= '0';
  	    else
  		s_temp <= (a xor b) xor cin;
          	cout_temp <= (a and b) or ((a xor b) and cin);
      	    end if;
      end if;
    end process;

-- Output assignments
sum <= s_temp;
cout <= cout_temp;
done <= '1';

end behavioral;
