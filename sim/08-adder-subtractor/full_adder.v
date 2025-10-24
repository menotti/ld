module full_adder (
    input  a, b, cin,
    output s, cout);
    assign s = a ^ b ^ cin; // Sum output
    assign cout = (a & b) | (cin & (a ^ b)); // Carry output
endmodule