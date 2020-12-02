library ieee;
use ieee.std_logic_1164.all;

entity register is
  port(
    clk     : in  std_logic;
    rst_n   : in  std_logic;
    reg_in  : in  std_logic_vector(7 downto 0);
    enable  : in  std_logic;
    reg_out : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavior of register is
begin
  DUT : process(clk, rst_n)
  begin
    if (rst_n = '0') then
      reg_out <= x"00";
    elsif (clk'event and clk = '1') then
      if (enable = '1') then
        reg_out <= reg_in;
      end if;
    end if;
  end process;
end architecture;
