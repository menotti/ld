module top_module( 
    input [254:0] in,
    output  [7:0] out);
    integer i;
    always@(in)
    begin
        out = 0;
        for (i=0; i<$bits(in); i=i+1)
            out = out + in[i];
    end
endmodule

