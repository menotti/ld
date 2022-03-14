module top_module (input x, input y, output z);
    wire [1:0] w;
    assign w[0] = (x ^ y) & x,
        w[1] = (x ~^ y),
        z = (w[0] | w[1]) ^ (w[0] & w[1]);
endmodule