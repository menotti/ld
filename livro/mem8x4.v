module mem8x4 (
  input clk, we,
  input [1:0] address,
  input [7:0] data_in,
  output [7:0] data_out);

  reg [7:0] RAM [3:0];

  assign data_out = RAM[address];

  always @(posedge clk)
    if (we)
      RAM[address] <= data_in;
endmodule
