module johnson #(parameter N = 4)(
    input clk, arst_n, 
    output reg [N-1:0] count);

    always@(posedge clk or negedge arst_n)
        if (!arst_n)
            count = 'b0;
        else
            count = {count, ~count[N-1]};

endmodule