library ieee;
use ieee.std_logic_1164.all;

entity tb_sr_latch is
end entity;

architecture bench of tb_sr_latch is
  component sr_latch is
    port(
      s_in, r_in       : in    std_logic;
      q_out, q_not_out : inout std_logic
      );
  end component;

  signal s_tb_in, r_tb_in, q_tb_out, q_not_tb_out : std_logic;

begin
  DUT : sr_latch port map(
    s_in => s_tb_in, r_in => r_tb_in, q_out => q_tb_out, q_not_out => q_not_tb_out
    );
  process
  begin
    s_tb_in <= '0';
    r_tb_in <= '1';
    wait for 50 ns;
    assert (q_tb_out = '0') report "Error in q" severity failure;

    s_tb_in <= '0';
    r_tb_in <= '0';
    wait for 50 ns;
    assert (q_tb_out = '0') report "Error in q" severity failure;

    s_tb_in <= '1';
    r_tb_in <= '0';
    wait for 50 ns;
    assert (q_tb_out = '1') report "Error in q" severity failure;

    s_tb_in <= '0';
    r_tb_in <= '0';
    wait for 50 ns;
    assert (q_tb_out = '1') report "Error in q" severity failure;

    s_tb_in <= '0';
    r_tb_in <= '1';
    wait for 50 ns;
    assert (q_tb_out = '0') report "Error in q" severity failure;

    wait;
  end process;
end architecture;
