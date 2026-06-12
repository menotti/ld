# Tabuada Japonesa

O objetivo deste laboratório é implementar um circuito sequencial síncrono para gerar a tabuada de multiplicação, exibindo o resultado em decimal via conversor BCD e depois na placa.

## O que é a tabuada japonesa?

Na tabuada japonesa, cada número começa sua tabuada a partir de si mesmo, pois os produtos anteriores já aparecem nas tabuadas precedentes. Por exemplo, a tabuada do 7 começa em 7×7, já que 7×1 até 7×6 já foram cobertos pelas tabuadas do 1 ao 6. Isso elimina repetições e reduz o total de combinações a memorizar.

## Funcionamento

- O valor da tabuada desejada é informado em `SW[3:0]` e carregado pressionando `KEY[0]` (aguardando o tempo necessário para o relógio de 1Hz completar o período).
- A tabuada é gerada automaticamente, mudando a cada ≈1Hz na sequência.
- O sinal `done` indica quando a tabuada terminou.

## Módulos fornecidos

### `regn` — Registrador de N bits

Registrador parametrizável com carga paralela e habilitação:

```verilog
module regn #(parameter N = 8) (
    input ld, clk, en,
    input [N-1:0] data_l, data_i,
    output reg [N-1:0] data_o);
    always @(posedge clk)
        if (ld) data_o = data_l;
        else if (en) data_o = data_i;
endmodule
```

### `bin2bcd` — Conversor binário para BCD

Converte um valor de 8 bits para BCD de 10 bits usando o algoritmo [Double Dabble](https://en.wikipedia.org/wiki/Double_dabble), permitindo exibir o resultado em decimal.

### `dec7seg` — Decodificador de 7 segmentos

Converte um dígito BCD (0–9) nos segmentos do display. Valores fora do intervalo exibem `-`.

## Implementação

### `tabuada_b` — Comportamental

Implemente o módulo gerando a sequência da tabuada de `i_a` usando descrição comportamental (construções como `always`, `if/else`, contadores):

```verilog
module tabuada_b (
    input clk, load,
    input [7:0] i_a,
    output [7:0] res,
    output done);
```

### `tabuada_s` — Estrutural

Implemente a mesma lógica instanciando e conectando módulos `regn`:

```verilog
module tabuada_s (
    input clk, load,
    input [7:0] i_a,
    output [7:0] res,
    output done);
```

## Simulação e placa

1. Crie o projeto com o código da tabuada, adapte a saída para BCD usando `bin2bcd` e simule.
2. Implemente o projeto na placa fgpa.
