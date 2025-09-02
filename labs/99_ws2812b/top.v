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

    reg [25:0] frame_div = 0;         // 26 bits para contar até 50_000_000
    reg [5:0] frame_counter = 0;      // controla deslocamento (até 64 LEDs)

    always @(posedge CLOCK_50) begin
        if (frame_div == 26'd49_999_999) begin
            frame_div <= 0;
            frame_counter <= frame_counter + 1;
        end else 
            frame_div <= frame_div + 1;
    end

    wire [5:0] shifted_idx = led_idx + frame_counter; // rotação

    wire [7:0] intensity = (shifted_idx * 4);  // variação visual junto com rotação

    wire [2:0] bits = shifted_idx % 8;

    wire [7:0] base_R = {8{bits[2]}};
    wire [7:0] base_G = {8{bits[1]}};
    wire [7:0] base_B = {8{bits[0]}};

    wire [15:0] prod_R = base_R * intensity;
    wire [15:0] prod_G = base_G * intensity;
    wire [15:0] prod_B = base_B * intensity;

    wire [7:0] R = prod_R[15:8];
    wire [7:0] G = prod_G[15:8];
    wire [7:0] B = prod_B[15:8];

    wire [23:0] color = {G, R, B}; // GRB para WS2812B

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
