module random (
    input clk, ena,
    output wire [30:0] rand);

    reg [30:0] lfsr = 31'h5eed_beef;

    always @(posedge clk)
        if (ena)
            lfsr = {lfsr[29:0], lfsr[16] ^~ lfsr[14] ^~ lfsr[13] ^~ lfsr[11]};

    assign rand = lfsr;
endmodule