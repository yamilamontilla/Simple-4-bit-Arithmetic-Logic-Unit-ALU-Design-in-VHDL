library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TC22_SBC is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end TC22_SBC;

architecture Behavioral of TC22_SBC is
begin

    Sum  <= A xor B xor Cin;
    Cout <= (A and B) or (Cin and (A xor B));
end Behavioral;
