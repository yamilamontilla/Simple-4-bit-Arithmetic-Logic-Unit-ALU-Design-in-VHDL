library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TC22_ALU4 is
    Port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        S     : in  STD_LOGIC_VECTOR(1 downto 0);
        Z     : out STD_LOGIC_VECTOR(3 downto 0);
        Cout  : out STD_LOGIC
    );
end TC22_ALU4;

architecture Structural of TC22_ALU4 is
    signal Z_xor, Z_nand, Z_sum: STD_LOGIC_VECTOR(3 downto 0);
    signal Cout_sum: STD_LOGIC;

begin
    XOR4: entity work.TC22_XOR4 port map(
        A => A,
        B => B,
        Z => Z_xor
    );

    NAND4: entity work.TC22_NAND4 port map(
        A => A,
        B => B,
        Z => Z_nand
    );

    SR4: entity work.TC22_SR4 port map(
        A    => A,
        B    => B,
        Op   => S(0),
        Z    => Z_sum,
        Cout => Cout_sum
    );

    MUX4b4: entity work.TC22_MUX4b4 port map(
        I0 => Z_xor,
        I1 => Z_nand,
        I2 => Z_sum,
        I3 => Z_sum,
        S  => S,
        Z  => Z
    );
    
    Cout <= Cout_sum when S(1) = '1' else '0';

end Structural;
