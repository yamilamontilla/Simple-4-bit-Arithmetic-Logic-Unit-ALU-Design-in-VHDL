library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TC22_MUX2b4 is
    Port (
        I0 : in  STD_LOGIC_VECTOR(3 downto 0);
        I1 : in  STD_LOGIC_VECTOR(3 downto 0);
        S  : in  STD_LOGIC;
        Z  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end TC22_MUX2b4;

architecture Behavioral of TC22_MUX2b4 is
begin
    Z <= I0 when S = '0' else I1;
end Behavioral;
