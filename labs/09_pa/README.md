# 📈 Progressão Aritmética (PA)

O objetivo deste laboratório é implementar um circuito capaz de gerar os termos de uma PA, realimentando um registrador através da ULA e exibindo o resultado no display.

## 📚 Fundamentos teóricos

### Como um circuito gera uma PA

Numa progressão aritmética cada termo é o anterior somado a uma constante, a **razão**:

$$a_n = a_{n-1} + r$$

Repare que a fórmula depende do termo anterior — logo o circuito precisa **guardar** o valor atual e usá-lo para calcular o próximo. Isso é feito fechando um laço entre um registrador e a ULA:

- o **registrador** guarda o termo atual e o apresenta na saída;
- a **ULA** soma a razão a esse valor, produzindo o próximo termo;
- o resultado volta para a entrada do registrador, que o captura na próxima borda de clock.

Essa estrutura — registrador realimentado através de um operador — é chamada de **acumulador**, e é a base de praticamente todo circuito sequencial que conta ou soma ao longo do tempo.

---

### Power-on reset (`por`)

Ao ligar a placa, os registradores partem de um valor indefinido. O `por` (*power-on reset*) resolve isso gerando um pulso de reset automático nos primeiros ciclos de clock, sem precisar de botão:

**Código Verilog**

```verilog
module por(
  input clk,
  output reset);

  reg q0 = 1'b0;
  reg q1 = 1'b0;
  reg q2 = 1'b0;

  always@(posedge clk)
  begin
       q0 <= 1'b1;
       q1 <= q0;
       q2 <= q1;
  end

  assign reset = !(q0 & q1 & q2);
endmodule
```

São três flip-flops em cadeia, todos começando em 0. O `1'b1` vai entrando pela ponta e leva três bordas de clock para percorrer os três — enquanto isso `reset` fica em 1. Quando os três chegam a 1, `reset` cai para 0 e **nunca mais sobe**.

---

### Registrador com reset (`register`)

Diferente do registrador do laboratório anterior, este não tem habilitação: ele captura a entrada a **toda** borda de clock. O que ele tem é um `rst` síncrono, que zera a saída:

**Código Verilog**

```verilog
module register(clk, rst, data_in, data_out);

  parameter bits = 4;

  input clk, rst;
  input [bits-1:0] data_in;
  output [bits-1:0] data_out;

  reg [bits-1:0] data_out;

  always @ (posedge clk)
  if (rst)
    data_out <= 'b0;
  else
    data_out <= data_in;

endmodule
```

O `parameter bits` permite escolher a largura na instanciação, com `register #(8) r1 (...)` para 8 bits, por exemplo.

---

### Unidade Lógica e Aritmética (`alu`)

A mesma ULA do laboratório anterior, agora parametrizável em largura:

| `S` | Operação | | `S` | Operação |
|:---:|:---------|-|:---:|:---------|
| `000` | `0` | | `100` | `A ^ B` |
| `001` | `B - A` | | `101` | `A \| B` |
| `010` | `A - B` | | `110` | `A & B` |
| `011` | `A + B` | | `111` | `1` |

**Código Verilog**

```verilog
module alu(S, A, B, F);
    parameter N = 4;
    input [2:0] S;
    input [N-1:0] A, B;
    output reg [N-1:0] F;

    always @(S, A, B)
        case (S)
            0: F = 'b0;
            // ...
            3: F = A + B;
            7: F = 'b1;
         endcase
endmodule
```

Para a PA interessa a operação `011` (`A + B`). A operação `010` (`A - B`) será útil no critério de nota máxima.

---

### Divisor de clock

O `CLOCK_50` oscila a 50 MHz, rápido demais para acompanhar os termos com os olhos. A saída é contar bordas de clock e usar um bit alto do contador como clock lento — cada bit `n` de um contador troca de valor a cada 2ⁿ ciclos, ou seja, tem período de 2ⁿ⁺¹ ciclos:

```verilog
integer count = 0; // 32 bits
always@(posedge CLOCK_50)
  count = count + 1;
// descomente as duas linhas abaixo para a Etapa 2
//assign clk1hz = count[23]; //≅3Hz
//por p1(CLOCK_50, rst);
```

Quanto mais alto o bit escolhido, mais lenta a contagem.

## 🎛️ Funcionamento na placa

- `SW` é usado para informar a razão da PA;
- Os termos devem aparecer no *display* em sequência, avançando sozinhos;
- Ao ligar a placa o `por` zera o registrador, então a sequência começa em 0: `0, r, 2r, 3r, ...`

## 🛠️ Implementação

### ⚙️ Etapa 1 — Responda as perguntas da bancada

O `top.v` vem com um contador já funcionando, que mostra dois dígitos do `count` no display. Antes de modificá-lo, use-o para responder às duas perguntas do cabeçalho do arquivo, e preencha também a linha de identificação da bancada:

```verilog
/* Bancada:
000000 Subistituir esta linha pelos ras e nomes

1. Com que frequência este contator conta?
R:

2. Com que frequência os digitos se alternam no display?
R:

*/
```

### 🔌 Etapa 2 — Gerador de PA (`top.v`)

Transforme o contador num gerador de PA. As linhas comentadas do `top.v` são as dicas do que precisa ser habilitado:

```verilog
module top(
  input CLOCK_50, // 50MHz
  output [6:0] HEX1, HEX0);

  wire [6:0] segs1, segs0;

  integer count = 0; // 32 bits
  always@(posedge CLOCK_50)
    count = count + 1;
  // descomente as duas linhas abaixo para a Etapa 2
  //assign clk1hz = count[23]; //≅3Hz
  //por p1(CLOCK_50, rst);

  dec7seg dig1(count[31:28], segs1);
  dec7seg dig0(count[27:24], segs0);

  assign {HEX1, HEX0} = ~{segs1, segs0};
endmodule
```

O que precisa ser feito:

1. Acrescentar a porta de entrada dos *switches* para informar a razão;
2. Descomentar as duas linhas indicadas, que habilitam o clock lento e o reset inicial;
3. Instanciar o `register` e a `alu` fechando o laço do acumulador, ambos na mesma largura;
4. Trocar as entradas dos `dec7seg`: em vez dos bits do contador, os dígitos do termo atual.

Depois, carregue o código para a placa FPGA. 🚀

## 🏆 Critérios de avaliação

* **6.0** - Implemente o funcionamento básico na placa.
* **8.0** - Implemente um botão de *reset* sem remover o `por`.
* **10.0** - Implemente um botão de decremento para fazer a **regressão** do mesmo valor.
