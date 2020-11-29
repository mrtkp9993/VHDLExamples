library ieee;
use ieee.std_logic_1164.all;

entity parity_generator is
  generic(
    length_g : integer   := 8;
    parity_g : std_logic := '0'         -- '0' for even, '1' for odd parity 
    );
  port(
    data_in    : in  std_logic_vector(length_g-1 downto 0);
    parity_out : out std_logic
    );
end entity;

architecture behavior of parity_generator is
begin
  DUT : process(data_in)
    variable result : std_logic;
  begin
    result := parity_g;
    for i in data_in'range loop
      result := result xor data_in(i);
    end loop;
    parity_out <= result;
  end process;
end architecture;
