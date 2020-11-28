library ieee;
use ieee.std_logic_1164.all;

entity sop_circuit is
  port (
    ABC_in : in std_logic_vector(2 downto 0);
    F_out  : out std_logic
  );
end entity;

architecture behavior of sop_circuit is
begin
  DUT : process (ABC_in)
  begin
    case ABC_in is
      when "000" | "010" | "110" => F_out <= '1';
      when others                => F_out                <= '0';
    end case;
  end process;
end architecture;