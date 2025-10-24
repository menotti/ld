module tb;
  reg [31:0] cafebabe = 32'hcafebabe;
  reg [1:0] sel = 2'b11;
  wire [7:0] out;

  top dut(.in(cafebabe), .sel(sel), .out(out));

  initial begin
    $display("|byte|val|");
    $display("+----+---+");
    $monitor("|%4d|%3h|", sel, out);
    #1 sel = 2'b10;
    #1 sel = 2'b01;
    #1 sel = 2'b00;
    #1 $finish;
  end
endmodule
