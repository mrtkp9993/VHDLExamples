library ieee;
use ieee.std_logic_1164.all;

entity Multiplexer_4to1 is
    port (
        ABCD    : in std_logic_vector(3 downto 0);
        Sel     : in std_logic_vector(1 downto 0);
        F       : out std_logic
    );
end entity;

architecture Multiplexer_4to1_arch of Multiplexer_4to1 is
begin
    Multiplexer4to1 : process(ABCD, Sel)
    begin
        case Sel is
            when "00"       => F <= ABCD(0);
            when "01"       => F <= ABCD(1);
            when "10"       => F <= ABCD(2);
            when "11"       => F <= ABCD(3);
            when others     => F <= 'X';
        end case;
    end process;
end architecture;
    