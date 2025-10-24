module top_module (input clk, input d, output q);
    wire [2:1] ic; // internal connections
    my_dff inst2 (clk, d,     ic[2]);
    my_dff inst1 (clk, ic[2], ic[1]);
    my_dff inst0 (clk, ic[1], q);
endmodule

