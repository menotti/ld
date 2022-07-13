CC=iverilog 
FLAGS=-Wall
VIEWER=code
all: *.v
	$(CC) $(FLAGS) *.v 
	vvp a.out
	$(VIEWER) dump.vcd
