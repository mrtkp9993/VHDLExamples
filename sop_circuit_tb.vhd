library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library STD;
use STD.textio.all;

entity SOPCircuitTb is
end entity;

architecture SOPCircuitTb_arch of SOPCircuitTb is

    component SOPCircuit
        port(
            ABC : in  std_logic_vector(2 downto 0);
            F   : out std_logic
        );
    end component;

    signal ABC_TB : std_logic_vector(2 downto 0);
    signal F_TB   : std_logic;

begin

    DUT : SOPCircuit port map(ABC => ABC_TB, F => F_TB);

    process
        file Fin  : TEXT open READ_MODE is "sop_circuit_input.txt";
        file Fout : TEXT open WRITE_MODE is "sop_circuit_output.txt";

        variable current_read_line  : line;
        variable current_read_field : std_logic_vector(2 downto 0);
        variable current_write_line : line;

    begin
        while (not endFile(Fin)) loop

            readline(Fin, current_read_line);
            read(current_read_line, current_read_field);

            ABC_TB <= current_read_field;
            wait for 50 ns;

            write(current_write_line, string'("Input: ABC_TB="));
            write(current_write_line, ABC_TB);
            write(current_write_line, string'(" "));

            write(current_write_line, string'("DUT Output: F_TB="));
            write(current_write_line, F_TB);
            writeline(Fout, current_write_line);

        end loop;                       --    end process;    

        wait;
    end process;

end architecture;
