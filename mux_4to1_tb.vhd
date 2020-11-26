library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library STD;
use STD.textio.all;

entity Multiplexer_4to1Tb is
end entity;

architecture Multiplexer_4to1Tb_arch of Multiplexer_4to1Tb is

    component Multiplexer_4to1
    port (
        ABCD    : in std_logic_vector(3 downto 0);
        Sel     : in std_logic_vector(1 downto 0);
        F       : out std_logic
    );
    end component;

    signal ABCD_TB : std_logic_vector(3 downto 0);
    signal Sel_TB  : std_logic_vector(1 downto 0);
    signal F_TB    : std_logic;
    
begin
    
    DUT : Multiplexer_4to1 port map(ABCD => ABCD_TB, Sel => Sel_TB, F => F_TB);
    
    process
        file Fin  : TEXT open READ_MODE is "mux_4to1_tests.txt";
        
        variable current_read_line   : line;
        variable current_read_field1 : std_logic_vector(0 to 3);
        variable current_read_field2 : std_logic_vector(0 to 1);
        variable current_read_field3 : std_logic;
        
    begin
        while (not endFile(Fin)) loop
        
            readline(Fin, current_read_line);
            read(current_read_line, current_read_field1);
            read(current_read_line, current_read_field2);
            read(current_read_line, current_read_field3);

            ABCD_TB <= current_read_field1;
            Sel_TB  <= current_read_field2;
            wait for 50 ns;
            
            assert(F_TB = current_read_field3);
        
        end loop;
        
        wait;
    end process;

end architecture;