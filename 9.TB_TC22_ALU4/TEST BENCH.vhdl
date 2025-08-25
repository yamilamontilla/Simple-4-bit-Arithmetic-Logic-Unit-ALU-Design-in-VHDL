library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_TC22_ALU4 is
end TB_TC22_ALU4;

architecture Test of TB_TC22_ALU4 is
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal S    : STD_LOGIC_VECTOR(1 downto 0);
    signal Z    : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;                    

begin
    DUT: entity work.TC22_ALU4 port map(
            A    => A,
            B    => B,
            S    => S,
            Z    => Z,
            Cout => Cout
        );
    process
    begin
        A <= "0010";
        B <= "0011";
        S <= "10";
        wait for 10 ns;

        A <= "0010";
        B <= "0011";
        S <= "11";
        wait for 10 ns;

        A <= "1011";
        B <= "0011";
        S <= "10";
        wait for 10 ns;

        A <= "1011";
        B <= "0011";
        S <= "11";
        wait for 10 ns;

        A <= "0101";
        B <= "0011";
        S <= "10";
        wait for 10 ns;

        A <= "1011";
        B <= "0100";
        S <= "00";
        wait for 10 ns;

        A <= "1011";
        B <= "0100";
        S <= "01";
        wait for 10 ns;

        wait;
    end process;
end Test;


