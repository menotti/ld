`include "up1.v"
`include "jvn.v"
module up_tb;
  reg clock, reset;
  wire we;
  wire [7:0] address, ir, pc, data;

  uP proc(clock, reset, data, we, address, pc, ir);
  mem ram(clock, we, address, data);

  initial
  begin
    $display("time  pc  ir mar mbr we");
    $display("  ns   d   h   h   d  b");
    $monitor("%4d %3d %3h %3h %3d %b", $time, pc, ir, address, data, we);
    $dumpfile("dump.vcd"); $dumpvars(1);
    reset <= 1; #10; reset <= 0;
    #2725; $finish;
  end

  always
  begin
    clock <= 0; #5; clock <= 1; #5;
  end
endmodule
