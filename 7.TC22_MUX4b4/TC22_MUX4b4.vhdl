library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TC22_MUX4b4 is
    Port (
        I0 : in  STD_LOGIC_VECTOR(3 downto 0);
        I1 : in  STD_LOGIC_VECTOR(3 downto 0);
        I2 : in  STD_LOGIC_VECTOR(3 downto 0);
        I3 : in  STD_LOGIC_VECTOR(3 downto 0);
        S  : in  STD_LOGIC_VECTOR(1 downto 0);
        Z  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end TC22_MUX4b4;

architecture Structural of TC22_MUX4b4 is
    signal Z0, Z1: STD_LOGIC_VECTOR(3 downto 0);
begin
    MUX1: entity work.TC22_MUX2b4 port map(
        I0 => I0,
        I1 => I1,
        S  => S(0),
        Z  => Z0
    );

    MUX2: entity work.TC22_MUX2b4 port map(
        I0 => I2,
        I1 => I3,
        S  => S(0),
        Z  => Z1
    );

    MUX3: entity work.TC22_MUX2b4 port map(
        I0 => Z0,
        I1 => Z1,
        S  => S(1),
        Z  => Z
    );
end Structural;
