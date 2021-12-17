`timescale 1ps / 1ps
module top_module;
    reg clk = 0;
    dut dut(clk);
    initial
        forever #5 clk = ~clk;
endmodule

