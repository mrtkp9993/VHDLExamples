library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library STD;
use STD.textio.all;

entity tb_onehot_decoder_3to8 is
end entity;

architecture bench of tb_onehot_decoder_3to8 is

  component onehot_decoder_3to8
    port (
      ABC_in : in std_logic_vector(2 downto 0);
      F_out  : out std_logic_vector(7 downto 0)
    );
  end component;

  signal ABC_TB_in : std_logic_vector(2 downto 0);
  signal F_TB_out  : std_logic_vector(7 downto 0);

begin

  DUT : onehot_decoder_3to8 port map(ABC_in => ABC_TB_in, F_out => F_TB_out);

  process
    file Fin  : text open read_mode is "tb/onehot_decoder_3to8_input.txt";
    file Fout : text open write_mode is "onehot_decoder_3to8_output.txt";

    variable current_read_line  : line;
    variable current_read_field : std_logic_vector(2 downto 0);
    variable current_write_line : line;

  begin
    while (not endFile(Fin)) loop

      readline(Fin, current_read_line);
      read(current_read_line, current_read_field);

      ABC_TB_in <= current_read_field;
      wait for 50 ns;

      write(current_write_line, string'("Input: ABC_TB="));
      write(current_write_line, ABC_TB_in);
      write(current_write_line, string'(" "));

      write(current_write_line, string'("DUT Output: F_TB="));
      write(current_write_line, F_TB_out);
      writeline(Fout, current_write_line);

    end loop;

    wait;
  end process;

end architecture;