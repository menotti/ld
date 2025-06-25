module top (
    input CLOCK_50,
    output GPIO);

    localparam NLEDS  = 64;
    localparam NBITS  = NLEDS * 24;

    // Temporizações WS2812B @ 50 MHz
    localparam T0H = 18;      // 0.36 µs
    localparam T0L = 40;      // 0.80 µs
    localparam T1H = 35;      // 0.70 µs
    localparam T1L = 30;      // 0.60 µs
    localparam TRESET = 3000; // 60 µs

    reg gpio_out;   // registrador intermediário
    assign GPIO = gpio_out;

    reg [11:0] clk_cnt = 0;
    reg [10:0] bit_idx = 0;

    reg [1:0] state = 0;
    localparam IDLE  = 2'd0,
               HIGH  = 2'd1,
               LOW   = 2'd2,
               RESET = 2'd3;

    reg [11:0] reset_cnt = 0;
    reg [11:0] phase_len = 0;

    reg current_bit = 0;

    wire [5:0] led_idx = bit_idx / 24;
    wire [4:0] color_bit_idx = 23 - (bit_idx % 24);

    // Mapa de cores (7 cores principais: RGB, CMY, White)
    wire [23:0] color =
        (led_idx % 7 == 0) ? 24'h00FF00 : // Red
        (led_idx % 7 == 1) ? 24'hFF0000 : // Green
        (led_idx % 7 == 2) ? 24'h0000FF : // Blue
        (led_idx % 7 == 3) ? 24'hFF00FF : // Cyan
        (led_idx % 7 == 4) ? 24'h00FFFF : // Magenta
        (led_idx % 7 == 5) ? 24'hFFFF00 : // Yellow
                            24'hFFFFFF ;  // White

    always @(posedge CLOCK_50) begin
        case (state)
            IDLE: begin
                gpio_out <= 0;
                clk_cnt <= 0;
                bit_idx <= 0;
                state <= HIGH;
            end

            HIGH: begin
                current_bit <= color[color_bit_idx];
                phase_len <= current_bit ? T1H : T0H;

                gpio_out <= 1;

                if (clk_cnt >= phase_len) begin
                    clk_cnt <= 0;
                    state <= LOW;
                end else begin
                    clk_cnt <= clk_cnt + 1;
                end
            end

            LOW: begin
                phase_len <= current_bit ? T1L : T0L;

                gpio_out <= 0;

                if (clk_cnt >= phase_len) begin
                    clk_cnt <= 0;
                    bit_idx <= bit_idx + 1;
                    if (bit_idx == NBITS - 1) begin
                        state <= RESET;
                        reset_cnt <= 0;
                    end else begin
                        state <= HIGH;
                    end
                end else begin
                    clk_cnt <= clk_cnt + 1;
                end
            end

            RESET: begin
                gpio_out <= 0;
                reset_cnt <= reset_cnt + 1;
                if (reset_cnt >= TRESET) begin
                    state <= IDLE;
                end
            end
        endcase
    end

endmodule
