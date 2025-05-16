module random (
    input clk, ena,
    output reg [30:0] lfsr);

    always @(posedge clk)
        if (ena)
            lfsr = {lfsr[29:0], lfsr[16] ^~ lfsr[14] ^~ lfsr[13] ^~ lfsr[11]};
        else
            lfsr = 31'h5eed_beef;
endmodule