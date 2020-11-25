library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library STD;
use STD.textio.all;

entity OneHotDecoder3to8Tb is
end entity;

architecture OneHotDecoder3to8Tb_arch of OneHotDecoder3to8Tb is

    component OneHotDecoder3to8
        port (
        ABC : in std_logic_vector(2 downto 0);
        F   : out std_logic_vector(7 downto 0)
    );
    end component;

    signal ABC_TB : std_logic_vector(2 downto 0);
    signal F_TB   : std_logic_vector(7 downto 0);
    
begin
    
    DUT : OneHotDecoder3to8 port map(ABC => ABC_TB, F => F_TB);
    
    process
        file Fin  : TEXT open READ_MODE is "onehotdecoder3to8_input.txt";
        file Fout : TEXT open WRITE_MODE is "onehotdecoder3to8_output.txt";
        
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
        
        end loop;
        
        wait;
    end process;

end architecture;