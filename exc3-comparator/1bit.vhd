library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity oneBitComparator is
    port (
        A, B : in std_logic;
	GT_in,LT_in,EQ_in : in std_logic;
        EQ, GT, LT : out std_logic
    );
end oneBitComparator;

architecture behavioral of oneBitComparator is
begin
    EQ <= '1' when A = B and EQ_in = '1' else '0';
    GT <= '1' when (A > B and LT_in = '0') or GT_in = '1' else '0';
    LT <= '1' when (A < B and GT_in = '0') or LT_in = '1' else '0';
end behavioral;
