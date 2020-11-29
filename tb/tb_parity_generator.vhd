library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library STD;
use STD.textio.all;

entity tb_parity_generator is
end entity;

architecture bench of tb_parity_generator is
  component parity_generator
    generic(
      length_g : integer   := 8;
      parity_g : std_logic := '0'       -- '0' for even, '1' for odd parity 
      );
    port(
      data_in    : in  std_logic_vector(length_g-1 downto 0);
      parity_out : out std_logic
      );
  end component;
  constant length_c    : integer   := 8;
  constant parity_c    : std_logic := '0';
  signal data_tb_in    : std_logic_vector(length_c-1 downto 0);
  signal parity_tb_out : std_logic;
begin
  DUT : parity_generator
    generic map (length_g => length_c, parity_g => parity_c)
    port map (data_in     => data_tb_in, parity_out => parity_tb_out);
  process

    file Fin : text open read_mode is "tb/parity_generator_input.txt";

    variable current_read_line   : line;
    variable current_read_field1 : std_logic_vector(length_c-1 downto 0);
    variable current_read_field2 : std_logic;

  begin
    while (not endFile(Fin)) loop

      readline(Fin, current_read_line);
      read(current_read_line, current_read_field1);
      read(current_read_line, current_read_field2);

      data_tb_in <= current_read_field1;

      wait for 50 ns;

      assert (parity_tb_out = current_read_field2) report "Error in parity" severity failure;
    end loop;
    wait;
  end process;
end architecture;

