CC = iverilog 
FLAGS = -Wall
VIEWER = gtkwave
all: *.v
	$(CC) $(FLAGS) *.v 
	vvp a.out
	$(VIEWER) dump.vcd config.gtkw
