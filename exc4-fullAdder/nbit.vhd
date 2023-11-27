library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity oneBitFullAdder is
    generic (
        N : positive := 8
    );
    port (
        A, B : in std_logic_vector(0 to N-1)
	Cin : in std_logic;
        start,clk,nrst : in std_logic;
        Cout,done : out std_logic
	sum : out std_logic_vector(0 to N-1)
    );
end oneBitFullAdder;




architecture Behavioral of NBitFullAdder is

    component  is oneBitFullAdder
	port (
        A, B,Cin : in std_logic;
        start,clk,nrst : in std_logic;
        Cout,sum,done : out std_logic
	);

    end component;

    signal Cin_temp, done_temp : std_logic_vector(0 to N-1);

begin

    BitComp: for i in 1 to N-1 generate
        Comp: OneBitFullAdder port map (
            A => A(i),
            B => B(i),
	    Cin => _temp(i-1),  
	    start => _temp(i-1),  
	    EQ => EQ_temp(i),
            GT => GT_temp(i),
	    clk => clk,
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
