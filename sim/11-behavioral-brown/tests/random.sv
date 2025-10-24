module random (
    input clk, ena,
    output [31:0] random);

    reg [31:0] lfsr = 32'hcafe_babe;

    always @(posedge clk)
        if (ena)
            lfsr = {lfsr, lfsr[16] ^~ lfsr[14] ^~ lfsr[13] ^~ lfsr[11]};

    assign random = lfsr;
endmodule