# VHDL Examples

Simple VHDL & Verilog examples.

## How to run

1.  Analyze the source file(s):

        ghdl –a --ieee=synopsys <design>.vhd

2.  Analyze the testbench file(s):

        ghdl –a --ieee=synopsys <design>_tb.vhd

3.  Generate executable file:

        ghdl –e <design>_tb

4.  Run the simulation:

        ghdl –r <design>_tb --vcd=<design>_tb.vcd

5.  View the waveform:

        gtkwave <design>_tb.vcd

Source: [Link](https://www.physi.uni-heidelberg.de/~angelov/VHDL/VHDL_SS09_Teil05.pdf)
