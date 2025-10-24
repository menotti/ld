module tb_top;
    reg [3:0] sw;
    wire [9:0] leds;
    integer i;

    top uut (sw, leds);

    initial 
    begin
        sw = 4'b0000;
        $monitor("%2d: sw = %b => leds = %b", i, sw, leds);
        for (i = 1; i < 16; i = i + 1)
            #10 sw = i;
        #10 $finish;
    end
endmodule

