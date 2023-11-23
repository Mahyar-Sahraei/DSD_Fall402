library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NBitComparator is
    generic (
        N : positive := 8
    );
    port (
        A, B : in std_logic_vector(0 to N-1);
        EQ, GT, LT : out std_logic
    );
end NBitComparator;

architecture Behavioral of NBitComparator is

    component OneBitComparator is
        port (
            A, B : in std_logic;
            GT_in, LT_in, EQ_in : in std_logic;
            EQ, GT, LT : out std_logic
        );
    end component;

    signal EQ_temp, GT_temp, LT_temp : std_logic_vector(0 to N-1);

begin

    -- Instantiate N 1-bit comparators in a cascade
    BitComp: for i in 1 to N-1 generate
        Comp: OneBitComparator port map (
            A => A(i),
            B => B(i),
	    LT_in => LT_temp(i-1),  -- Connect LT_temp from previous stage
	    GT_in => GT_temp(i-1),  -- Connect GT_temp from previous stage
    	    EQ_in => EQ_temp(i-1),  -- Connect EQ_temp from previous stage
	    EQ => EQ_temp(i),
            GT => GT_temp(i),
            LT => LT_temp(i)
        );
    end generate BitComp;
	BitComp0: for i in 0 to 0 generate
	comp: OneBitComparator port map (
            A => A(i),
            B => B(i),
	    LT_in => '0',  -- Connect LT_temp from previous stage
	    GT_in => '0',  -- Connect GT_temp from previous stage
    	    EQ_in => '1',  -- Connect EQ_temp from previous stage
	    EQ => EQ_temp(i),
            GT => GT_temp(i),
            LT => LT_temp(i)
        );
    end generate BitComp0;

    -- Output signals
    EQ <= EQ_temp(N-1);
    GT <= GT_temp(N-1);
    LT <= LT_temp(N-1);

end Behavioral;
