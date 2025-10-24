module register(clk, rst, data_in, data_out);

  parameter bits = 4;

  input clk, rst;
  input [bits-1:0] data_in;
  output [bits-1:0] data_out;

  reg [bits-1:0] data_out;

  always @ (posedge clk)
  if (rst)
    data_out <= 'b0;
  else
    data_out <= data_in;
    
endmodule
