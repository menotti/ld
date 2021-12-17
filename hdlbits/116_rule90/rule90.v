module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q);
    
    always@(posedge clk) 
        if (load)
            q = data;
        else
            q = {q[510],q[511:2]^q[509:0],q[1]};
endmodule

