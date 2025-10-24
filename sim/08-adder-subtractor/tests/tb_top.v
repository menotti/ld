`timescale 1ns / 1ps

module tb_add_sub_32();

    reg  [31:0] a, b, expected_result;
    reg         sub, expected_carry, expected_overflow;
    wire [31:0] result;
    wire        carry_out, overflow;

    integer i, n;
    reg [8*128:1] file_name;  
    reg [31:0] mem [0:16 * 6];  

    top dut (
        .a(a),
        .b(b),
        .sub(sub),
        .result(result),
        .carry_out(carry_out),
        .overflow(overflow)
    );

    initial begin
        if (!$value$plusargs("testfile=%s", file_name)) begin
            $display("ERRO: parametro +testfile nao informado");
            $finish;
        end
        $display("Usando arquivo de testes: %s", file_name);
        $readmemh(file_name, mem);
        n = 0;

        $display("=== Início dos testes ===");

        while (n*6 < 1024*6 && mem[n*6+0] !== 32'hx) begin
            a                = mem[n*6 + 0];
            b                = mem[n*6 + 1];
            sub              = mem[n*6 + 2][0];
            expected_result  = mem[n*6 + 3];
            expected_carry   = mem[n*6 + 4][0];
            expected_overflow= mem[n*6 + 5][0];

            #1;

            if (result !== expected_result ||
                carry_out !== expected_carry ||
                overflow !== expected_overflow) begin

                $display("ERRO no teste %2d:", n);
                $display("  Entrada:     a=%h b=%h sub=%b", a, b, sub);
                $display("  Esperado:    res=%h carry=%b overflow=%b",
                         expected_result, expected_carry, expected_overflow);
                $display("  Obtido:      res=%h carry=%b overflow=%b",
                         result, carry_out, overflow);
            end else begin
                $display("OK no teste %2d: a=%h b=%h sub=%b => %h",
                         n, a, b, sub, result);
            end

            n = n + 1;
        end

        $display("=== Fim dos testes (%0d casos) ===", n);
        $finish;
    end
endmodule
