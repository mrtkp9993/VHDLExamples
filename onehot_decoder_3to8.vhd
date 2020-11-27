library ieee;
use ieee.std_logic_1164.all;

entity onehot_decoder_3to8 is
  port (
    ABC_in : in  std_logic_vector(2 downto 0);
    F_out  : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavior of onehot_decoder_3to8 is
begin
  onehot_decoder_case : process(ABC_in)
  begin
    case ABC_in is
      when "000"  => F_out <= "00000001";
      when "001"  => F_out <= "00000010";
      when "010"  => F_out <= "00000100";
      when "011"  => F_out <= "00001000";
      when "100"  => F_out <= "00010000";
      when "101"  => F_out <= "00100000";
      when "110"  => F_out <= "01000000";
      when "111"  => F_out <= "10000000";
      when others => F_out <= (others => 'X');
    end case;
  end process;
end architecture;
