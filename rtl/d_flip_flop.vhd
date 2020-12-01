library ieee;
use ieee.std_logic_1164.all;

entity d_flip_flop is
  port (
    clk           : in  std_logic;
    rst_n, preset : in  std_logic;
    D_in          : in  std_logic;
    Q_out         : out std_logic
    );
end entity;

architecture behavior of d_flip_flop is
begin
  DUT : process(clk, rst_n, preset)
  begin
    if (rst_n = '0') then
      Q_out <= '0';
    elsif (preset = '0') then
      Q_out <= '1';
    elsif (clk'event and clk = '1') then
      Q_out <= D_in;
    end if;
  end process;
end architecture;
