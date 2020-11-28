library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library STD;
use STD.textio.all;

entity tb_full_adder is
end entity;

architecture bench of tb_full_adder is
  component full_adder
    port (
      x_in, y_in, c_in : in  std_logic;
      s_out, c_out     : out std_logic
      );
  end component;

  signal x_tb_in  : std_logic;
  signal y_tb_in  : std_logic;
  signal c_tb_in  : std_logic;
  signal s_tb_out : std_logic;
  signal c_tb_out : std_logic;

begin

  DUT : full_adder port map(x_in => x_tb_in, y_in => y_tb_in, c_in => c_tb_in, s_out => s_tb_out, c_out => c_tb_out);

  process

    file Fin : text open read_mode is "full_adder_input.txt";

    variable current_read_line   : line;
    variable current_read_field1 : std_logic;
    variable current_read_field2 : std_logic;
    variable current_read_field3 : std_logic;
    variable current_read_field4 : std_logic;
    variable current_read_field5 : std_logic;

  begin
    while (not endFile(Fin)) loop

      readline(Fin, current_read_line);
      read(current_read_line, current_read_field1);
      read(current_read_line, current_read_field2);
      read(current_read_line, current_read_field3);
      read(current_read_line, current_read_field4);
      read(current_read_line, current_read_field5);

      x_tb_in <= current_read_field1;
      y_tb_in <= current_read_field2;
      c_tb_in <= current_read_field3;

      wait for 50 ns;

      assert(c_tb_out = current_read_field4) report "Error in carry" severity failure;
      assert(s_tb_out = current_read_field5) report "Error in sum" severity failure;
    end loop;
    wait;
  end process;
end architecture;
