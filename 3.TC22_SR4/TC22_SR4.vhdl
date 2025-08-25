library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity TC22_SR4 is
    Port (
        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        Op   : in  STD_LOGIC;
        Z    : out STD_LOGIC_VECTOR(3 downto 0);
        Cout : out STD_LOGIC
    );
end TC22_SR4;

architecture Behavioral of TC22_SR4 is
    signal B_mod : STD_LOGIC_VECTOR(3 downto 0);
    signal Cin   : STD_LOGIC;

begin
    B_mod <= B xor (Op & Op & Op & Op);

    Cin <= Op;

    SUM4: entity work.TC22_SUM4 port map(
        A => A,
        B => B_mod,
        Cin => Cin,
        Z => Z,
        Cout => Cout
    );
end Behavioral;
