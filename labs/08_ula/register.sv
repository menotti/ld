module register(clk, en, data_in, data_out);

  parameter bits = 4;

  input clk, en;
  input [bits-1:0] data_in;
  output [bits-1:0] data_out;

  reg [bits-1:0] data_out;

  always @ (posedge clk)
    if (en)
      data_out <= data_in;
    
endmodule
