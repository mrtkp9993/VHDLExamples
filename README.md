# VHDL Examples

Simple VHDL & Verilog examples.

## How to run

Just run ```make```or follow the steps:

1.  Analyze the source file(s):

        ghdl –a --ieee=synopsys <design>.vhd

2.  Analyze the testbench file(s):

        ghdl –a --ieee=synopsys tb_<design>.vhd

3.  Generate executable file:

        ghdl –e --ieee=synopsys tb_<design>

4.  Run the simulation:

        ghdl –r --ieee=synopsys tb_<design> --vcd=tb_<design>.vcd

5.  View the waveform:

        gtkwave tb_<design>.vcd

Source: [Link](https://www.physi.uni-heidelberg.de/~angelov/VHDL/VHDL_SS09_Teil05.pdf)
