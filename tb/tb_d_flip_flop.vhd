library ieee;
use ieee.std_logic_1164.all;

entity tb_d_flip_flop is
end entity;

architecture bench of tb_d_flip_flop is
  component d_flip_flop is
    port (
      clk           : in  std_logic;
      rst_n, preset : in  std_logic;
      D_in          : in  std_logic;
      Q_out         : out std_logic
      );
  end component;

  signal D_tb_in   : std_logic := '0';
  signal clk_tb    : std_logic := '0';
  signal rst_n_tb  : std_logic := '0';
  signal preset_tb : std_logic := '0';
  signal Q_tb_out  : std_logic;

  constant clk_period : time := 50 ns;

begin

  DUT : d_flip_flop port map (
    clk => clk_tb, rst_n => rst_n_tb, preset => preset_tb, D_in => D_tb_in, Q_out => Q_tb_out
    );

  clk_process : process
  begin
    clk_tb <= '0';
    wait for clk_period/2;
    clk_tb <= '1';
    wait for clk_period/2;
  end process;

  stimulus : process
  begin
    rst_n_tb <= '0';
    wait for 30 ns;
    assert(Q_tb_out = '0') report "Error in q" severity failure;

    rst_n_tb  <= '1';
    preset_tb <= '1';
    D_tb_in   <= '0';
    wait for 15 ns;
    assert(Q_tb_out = '0') report "Error in q" severity failure;

    rst_n_tb  <= '1';
    preset_tb <= '1';
    wait for 15 ns;
    assert(Q_tb_out = '0') report "Error in q" severity failure;

    rst_n_tb  <= '1';
    preset_tb <= '0';
    wait for 10 ns;
    assert(Q_tb_out = '1') report "Error in q" severity failure;

    rst_n_tb  <= '1';
    preset_tb <= '1';
    wait for 20 ns;
    assert(Q_tb_out = '0') report "Error in q" severity failure;

    assert(now > 100 ns) report "Simulation finished." severity failure;
  end process;
end architecture;
