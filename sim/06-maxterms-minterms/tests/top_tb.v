module top_tb;
    reg x, y, z;
    wire f;
    integer i;

    top uut (x, y, z, f);

    initial 
    begin
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #10;
            $display("x=%b, y=%b, z=%b, f=%b", x, y, z, f);
        end
        #10 $finish;
    end
endmodule