library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity TC22_SUM4 is
    Port (
        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        Cin  : in  STD_LOGIC;
        Z    : out STD_LOGIC_VECTOR(3 downto 0);
        Cout : out STD_LOGIC
    );
end TC22_SUM4;

architecture Structural of TC22_SUM4 is
    signal Carry: STD_LOGIC_VECTOR(3 downto 0);
begin
    SBC0: entity work.TC22_SBC port map(
        A => A(0),
        B => B(0),
        Cin => Cin,
        Sum => Z(0),
        Cout => Carry(0)
    );
    SBC1: entity work.TC22_SBC port map(
        A => A(1),
        B => B(1),
        Cin => Carry(0),
        Sum => Z(1),
        Cout => Carry(1)
    );
    SBC2: entity work.TC22_SBC port map(
        A => A(2),
        B => B(2),
        Cin => Carry(1),
        Sum => Z(2),
        Cout => Carry(2)
    );
    SBC3: entity work.TC22_SBC port map(
        A => A(3),
        B => B(3),
        Cin => Carry(2),
        Sum => Z(3),
        Cout => Cout
    );
end Structural;
