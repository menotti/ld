module top_module (input x, input y, output z);
    wire a,b;
    assign a = (x ^ y) & x,
        b = (x ~^ y),
        z = (a | b) ^ (a & b);
endmodule
