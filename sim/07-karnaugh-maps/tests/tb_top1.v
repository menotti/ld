module tb_top1;
    reg a, b, c, d;
    wire f;
    integer i;

    top uut (.a(a), .b(b), .c(c), .d(d), .f1(f));

    initial 
    begin
        $display(" #|a|b|c|d|f1|");
        // Test all combinations of a, b, c, d
        for (i = 0; i < 16; i = i + 1) begin
            {a, b, c, d} = i;
            #10 $display("%2d|%b|%b|%b|%b|%2b|", i, a, b, c, d, f);
        end
        $finish;
    end
endmodule

