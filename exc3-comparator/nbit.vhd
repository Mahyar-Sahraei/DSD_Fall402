library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NBitComparator is
    generic(
        N : positive := 8
    );
    port(
        A, B : in std_logic_vector(N-1 downto 0);
        EQ, GT, LT : out std_logic;
        CLK : in std_logic
    );
end NBitComparator;

architecture Behavioral of NBitComparator is

    component OneBitComparator is
        port(
            A, B : in std_logic;
            EQ, GT, LT : out std_logic;
            CLK : in std_logic
        );
    end component;

    signal EQ_temp, GT_temp, LT_temp : std_logic_vector(N-1 downto 0);

begin

    -- Instantiate N 1-bit comparators in a cascade
    BitComp: for i in 0 to N-1 generate
        Comp: OneBitComparator port map (
            A => A(i),
            B => B(i),
            EQ => EQ_temp(i),
            GT => GT_temp(i),
            LT => LT_temp(i),
            CLK => CLK
        );
    end generate BitComp;

    -- Output signals
    EQ <= '1' when EQ_temp = (others => '1') else '0';

    Loop_GT: FOR i IN N-1 TO 0 GENERATE
              GT <= '1' when GT_temp(i) = '1' 
        else  GT <= '0' when LT_temp(i) = '1'
        else  GT <= '0' when i=0 
        else next Loop_GT;
        exit when GT = '1' or GT = '0';
	END GENERATE Loop_GT;

    Loop_LT: FOR i IN N-1 TO 0 GENERATE
              LT <= '1' when LT_temp(i) = '1' 
        else  LT <= '0' when GT_temp(i) = '1'
        else  LT <= '0' when i=0 
        else next Loop_LT;
        exit when LT = '1' or LT = '0';
	END GENERATE Loop_LT;

            
end Behavioral;
