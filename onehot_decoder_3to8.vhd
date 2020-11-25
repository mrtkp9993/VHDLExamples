library ieee;
use ieee.std_logic_1164.all;

entity OneHotDecoder3to8 is
    port (
        ABC : in std_logic_vector(2 downto 0);
        F   : out std_logic_vector(7 downto 0)
    );
end entity;

architecture OneHotDecoder3to8_arch of OneHotDecoder3to8 is
begin
    OneHotDec_case : process(ABC)
    begin
        case ABC is
            when "000" => F <= "00000001";
            when "001" => F <= "00000010";
            when "010" => F <= "00000100";
            when "011" => F <= "00001000";
            when "100" => F <= "00010000";
            when "101" => F <= "00100000";
            when "110" => F <= "01000000";
            when "111" => F <= "10000000";    
            when others => F <= (others => 'X');
        end case;    
    end process;    
end architecture;
