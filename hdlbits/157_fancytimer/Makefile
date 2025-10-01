# http://iverilog.icarus.com/
CC=iverilog 
FLAGS=-Wall
# http://gtkwave.sourceforge.net/
VIEWER=gtkwave
# https://github.com/yne/vcd
#VIEWER=../../../vcd/vcd < 
# https://drom.io/vcd/?github=menotti/ld/master/labs/00_template/dump.vcd
simul: *.sv
	$(CC) $(FLAGS) *.sv 
	vvp a.out
	$(VIEWER) dump.vcd config.gtkw
