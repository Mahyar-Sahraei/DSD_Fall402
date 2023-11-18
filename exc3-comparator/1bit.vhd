library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity oneBitComparator is
    port(
        A, B : in std_logic;
        EQ, GT, LT : out std_logic;
        CLK : in std_logic
    );
end oneBitComparator;

architecture behavioral of oneBitComparator is
begin
    process(CLK)
    begin
      EQ <= '1' when A_reg = B_reg else '0';
      GT <= '1' when A_reg > B_reg else '0';
      LT <= '1' when A_reg < B_reg else '0';
    end process;

end behavioral;
