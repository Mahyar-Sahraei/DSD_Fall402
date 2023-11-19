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

    signal EQs, GTs, LTs : std_logic_vector(N-1 downto 0);
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
    -- this need to be written:
    EQ <= '1' when EQ_temp = (others => '1') else '0';
    GT <= '1' when GT_temp( else '0';
    LT <= '1' when LT_temp( else '0';

end Behavioral;
