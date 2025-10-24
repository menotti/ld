module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    reg [3:0] delay;
    wire [3:0] last_delay = {delay, data};
    reg [9:0] state, thousand, counter;
    always@(posedge clk)
        if (reset)
            state = 10'b1;
    	else begin
            delay = {delay, data};
            if (state[7]) begin
                counter = last_delay;
                thousand = 1000;
            end 
            if (state[8]) begin
                thousand = thousand - 1;
                if (thousand == 0) begin
                    thousand = 1000;
                    counter = counter - 1;
                end
            end
            case (state)
                         10'b1: state = data ?     10'b10 :    10'b1;
                        10'b10: state = data ?    10'b100 :    10'b1;
                       10'b100: state = data ?    10'b100 : 10'b1000;
                      10'b1000: state = data ? 10'b1_0000 :    10'b1;
                    10'b1_0000: state =       10'b10_0000;
                   10'b10_0000: state =      10'b100_0000;
                  10'b100_0000: state =     10'b1000_0000;
                 10'b1000_0000: state =   10'b1_0000_0000;
               10'b1_0000_0000: state = done_counting ? 10'b10_0000_0000 :  10'b1_0000_0000;
              10'b10_0000_0000: state = ack           ?            10'b1 : 10'b10_0000_0000;
            endcase
        end
    wire done_counting = counter == 0 && thousand == 1;
    wire shift_ena = |state[7:4];
    assign counting = state[8];
    assign done = state[9];
    assign count = counter;
endmodule