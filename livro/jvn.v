module mem (
  input clock, we,
  input [7:0] address,
  inout [7:0] data);

  reg [7:0] RAM[0:255];

  initial
  begin
    // code section
    RAM[0] = 8'b0100_0000;
    RAM[1] = 8'b0101_0001;
    RAM[2] = 8'b0011_0010;
    RAM[3] = 8'b0100_0001;
    RAM[4] = 8'b0011_0000;
    RAM[5] = 8'b0100_0010;
    RAM[6] = 8'b0011_0001;
    RAM[7] = 8'b1_0000000;
    // data section
    RAM[240] = 8'b00000000;
    RAM[241] = 8'b00000001;
  end

  assign data = we ? 'bz : RAM[address];

  always @(posedge clock)
    if (we) RAM[address] <= data;
endmodule
