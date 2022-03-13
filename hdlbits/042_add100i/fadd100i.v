module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout, sum );
    
    f_add inst0 (a[0], b[0], cin, sum[0], cout[0]);
    genvar i;
    generate
        for (i=1; i<$bits(a)-1; i++) begin : generate_fadd_block
            f_add instance_x (a[i], b[i], cout[i-1], sum[i], cout[i]);
        end 
    endgenerate
    f_add inst99 (a[$bits(a)-1], b[$bits(a)-1], cout[$bits(a)-2], sum[$bits(a)-1], cout[$bits(a)-1]);

endmodule

module f_add (input a, b, cin, output sum, cout);
    assign sum = a ^ b ^ cin;
    assign cout = (a && b) || (cin && a) || (cin && b);
endmodule
