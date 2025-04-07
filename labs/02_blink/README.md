# Blink

Neste laboratório, o objetivo é piscar os LEDs da placa de diferentes maneiras. As frequências usadas serão sempre relativas ao *clock* de entrada. 

Usamos um contador inteiro de 32 bits, que é incrementado a cada subida do *clock*;

```verilog
integer count; // 32-bit counter
always @(posedge CLOCK_50)
    count <= count + 1;
```

Consequentemente, o LSB do contador (bit 0) será um *clock* com a metade da frequência do *clock* principal (de entrada).

Aqui você pode [calcular a frequência de cada um dos bits](https://www.wolframalpha.com/input?i=50Mhz+%2F+2%5E%2824%2B1%29) trocando o 24 por outra posição qualquer na equação. 

Na primeira tentativa, usamos o código original que contém a seguinte atribuição:

```verilog
assign LEDR = count; // 32 > 10 
```

Como o contador possui 32 bits e o sinal `LEDR` só tem 10 bits, os 10 bits **menos significativos** de `count` são usados e os demais são desprezados. 
- O que acontece com os LEDs?
- Qual a frequência do `LEDR[0]`?
- Qual a frequência do `LEDR[9]`?
- É possível vê-los piscando? Tente filmar com o seu celular... 

Na segunda tentativa, vamos usar o código a seguir que está comentado:

```verilog
assign LEDR = count[31:22];
```

Agora estamos **selecionando explicitamente** os dez bit mais significativos do contador. 

O que mudou? Responda novamente as perguntas anteriores. 

Por último, escolhemos um único bit do contador e o replicamos dez vezes para atribuir a todos os LEDs:

```verilog
assign LEDR = {10{count[24]}};
```

O que mudou? Responda novamente as perguntas anteriores. 
