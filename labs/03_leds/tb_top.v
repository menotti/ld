module tb_top;
	wire [3:0] led;
	reg [3:0] sw;

	integer i;
	reg [11:0] bancada = 12'hF7F; // Modificar

	top dut(sw, led);

	initial 
	begin
		$dumpfile("dump.vcd");
		$dumpvars(0);
		
		$display("Linhas totais: %0d", 2**$bits(led));
		$monitor("%b %b", sw, led);

		for (i = 0; i < (2**$bits(led)); i++)
			#10 sw = i;
		#10 $finish;
	end
endmodule
