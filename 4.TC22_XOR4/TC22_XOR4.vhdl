library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TC22_XOR4 is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        Z : out STD_LOGIC_VECTOR(3 downto 0)
    );
end TC22_XOR4;

architecture Behavioral of TC22_XOR4 is
begin
    Z <= A xor B;
end Behavioral;