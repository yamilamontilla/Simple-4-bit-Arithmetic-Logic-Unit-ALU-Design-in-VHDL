library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TC22_NAND4 is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        Z : out STD_LOGIC_VECTOR(3 downto 0)
    );
end TC22_NAND4;

architecture Behavioral of TC22_NAND4 is
begin
    Z <= not (A and B);
end Behavioral;
