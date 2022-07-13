module tb_top;
	wire [3:0] led;
	reg [3:0] sw;
	integer i;

	top dut(sw, led);

	initial 
	begin
		$dumpfile("dump.vcd");
		$dumpvars(0);
		$display(2**$bits(led));
		for (i=0; i<(2**$bits(led)); i++)
		begin
			#10 sw = i;
		end
		#10 $finish;
	end
endmodule
