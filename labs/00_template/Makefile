CC=iverilog 
FLAGS=-Wall
VIEWER=gtkwave

simul: *.v
	$(CC) $(FLAGS) *.v 
	vvp a.out
	$(VIEWER) dump.vcd config.gtkw
