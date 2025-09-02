module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);

    reg [7:0] ihh, imm, iss;

  function [7:0] BCD(input [7:0] val);
    begin
      BCD[3:0] = val % 10;
      BCD[7:4] = (val / 10) % 10;
    end
  endfunction

    always @(posedge clk)
    begin
        if (reset)
        begin
            pm = 0;
            ihh = 12;
            imm = 0;
            iss = 0;
        end
        else if (ena)
        begin
            iss = iss + 1;
            if (iss > 59)
            begin
                iss = 0;
                imm = imm + 1;
                if (imm > 59)
                begin
                    imm = 0;
                    ihh = ihh + 1;
                    if (ihh == 12)
                        pm = ~pm;
                    if (ihh > 12)
                    begin
                        ihh = 1;
                    end
                end
            end
        end
    end

    assign hh = BCD(ihh);
    assign mm = BCD(imm);
    assign ss = BCD(iss);
endmodule
