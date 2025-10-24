`timescale 10ns / 10ps

module tb_adders;
  parameter WIDTH = 16;
  reg [WIDTH-1:0] i_add1, i_add2;
	wire [WIDTH-1:0] o_result_ripple;
	wire [WIDTH-1:0] o_result_carry;
	 
	adders dut(i_add1, i_add2, o_result_ripple, o_result_carry);

  initial
  begin
    i_add1 = 0;
    i_add2 = 1;
    #10;
    i_add1 = 2;
    i_add2 = -2;
    #10;
    i_add1 = -3;
    i_add2 = -2;
    #10;
    i_add1 = -1;
    i_add2 = 1;
    #10;
    $stop;
  end

endmodule 
