module top_module(
    input clk,
    input a,
    output q);
    
    always@(posedge clk)
        q = ~a;
endmodule

