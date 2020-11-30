library ieee;
use ieee.std_logic_1164.all;

entity sr_latch is
  port(
    s_in, r_in       : in    std_logic;
    q_out, q_not_out : inout std_logic
    );
end entity;

architecture behaviour of sr_latch is
begin
  DUT : process(s_in, r_in, q_out, q_not_out)
  begin
    q_out     <= q_not_out nor r_in;
    q_not_out <= q_out nor s_in;
  end process;
end architecture;
