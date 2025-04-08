module top(
    input CLOCK_50, // 50 MHz clock
    output [9:0] LEDR);

    integer count; // 32-bit counter
    always @(posedge CLOCK_50)
        count <= count + 1;
    /*
    count[0] = 25 MHz
    count[1] = 12.5 MHz
    count[2] = 6.25 MHz
    ...
    */
    //assign LEDR = count; // 32 > 10 
    assign LEDR = count[31:22];
    //assign LEDR = {10{count[24]}}; // https://www.youtube.com/watch?v=jWkMhCLkVOg
endmodule
