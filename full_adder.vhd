library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  port (
    x_in, y_in, c_in : in  std_logic;
    s_out, c_out     : out std_logic
    );
end entity;

architecture behavior of full_adder is
begin
  DUT : process(x_in, y_in, c_in)
  begin
    s_out  <= x_in xor y_in xor c_in;
    c_out <= (x_in and y_in) or (x_in and c_in) or (y_in and c_in);
  end process;
end architecture;
