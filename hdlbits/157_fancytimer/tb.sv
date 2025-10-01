module TB();
    reg clk;
    reg reset;      
    reg data;
    wire [3:0] count;
    wire counting;
    wire done;
    reg ack;
  
  top_module dut(clk, reset, data, count, counting, done, ack);

  always begin
    clk = 0; #5; clk = 1; #5;
  end

  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0);
    $monitor("time=%t reset=%b data=%b count=%b counting=%b done=%b ack=%b state=%b delay=%b thousand=%d counter=%d", $time, reset, data, count, counting, done, ack, dut.state, dut.delay, dut.thousand, dut.counter);
    reset = 1; data = 0; ack = 0;
    #10 reset = 0;
    // 1101 sequence
    #10 data = 1;
    #10 data = 1;
    #10 data = 0;
    #10 data = 1;
    // delay
    #10 data = 0;
    #10 data = 0;
    #10 data = 0;
    #10 data = 0;
    // counting
    // #1000 $finish;
    wait(done);
    #15 ack = 1;
    #10 ack = 0;
    $finish;
   end

endmodule
