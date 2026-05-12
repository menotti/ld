# Classificador de Frutas — Mapa de Karnaugh na prática

O objetivo deste laboratório é simplificar uma função lógica a partir de um Mapa de Karnaugh e implementar o resultado em Verilog na placa DE1.

## Contexto

Uma cooperativa agrícola instalou quatro sensores binários em uma esteira de produção para avaliar a qualidade de cada fruta. Com base nas leituras dos sensores, o sistema deve acionar um sinal de **descarte** quando a fruta não atende aos critérios de qualidade.

| Sensor | Switch | Condição detectada |
|--------|--------|--------------------|
| A | SW[3] | Fruta **acima** do tamanho ideal |
| B | SW[2] | Fruta **abaixo** do tamanho ideal |
| C | SW[1] | Fruta **abaixo** do peso ideal |
| D | SW[0] | Fruta **machucada** |

A fruta deve ser descartada (F = 1) se:

- estiver **abaixo do tamanho ideal**; ou
- estiver **machucada**; ou
- estiver **acima do tamanho ideal** e ao mesmo tempo **abaixo do peso ideal**.

## Etapa 1 — Tabela-verdade

Preencha a tabela-verdade da função F. Antes disso, reflita: existe alguma combinação de sensores que é **fisicamente impossível** de ocorrer? Identifique essas combinações, justifique e marque-as com **X** na tabela — elas serão seus *don't cares*.

| A | B | C | D | F |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 |   |
| 0 | 0 | 0 | 1 |   |
| 0 | 0 | 1 | 0 |   |
| 0 | 0 | 1 | 1 |   |
| 0 | 1 | 0 | 0 |   |
| 0 | 1 | 0 | 1 |   |
| 0 | 1 | 1 | 0 |   |
| 0 | 1 | 1 | 1 |   |
| 1 | 0 | 0 | 0 |   |
| 1 | 0 | 0 | 1 |   |
| 1 | 0 | 1 | 0 |   |
| 1 | 0 | 1 | 1 |   |
| 1 | 1 | 0 | 0 |   |
| 1 | 1 | 0 | 1 |   |
| 1 | 1 | 1 | 0 |   |
| 1 | 1 | 1 | 1 |   |

## Etapa 2 — Mapa de Karnaugh

Transfira os valores da tabela para o mapa de Karnaugh. Marque os *don't cares* com **X**.

```
        CD
AB    00  01  11  10
  00 |   |   |   |   |
  01 |   |   |   |   |
  11 |   |   |   |   |
  10 |   |   |   |   |
```

Circule os maiores grupos possíveis de 1s, aproveitando os *don't cares* quando isso permitir formar grupos maiores. Escreva a expressão mínima obtida:

**F =** ______________________________

## Etapa 3 — Implementação em Verilog

Com a expressão obtida no mapa, crie um arquivo chamado [`top.v`](top.v) e implemente o módulo abaixo. O módulo deve declarar as entradas, as saídas, mapear os sensores e atribuir a função F que você simplificou.

```verilog
module top (
    input  [3:0] SW,
    output [9:0] LEDR
);

    // mapeie cada sensor ao seu switch correspondente

    // implemente a expressão que você obteve no Mapa de Karnaugh

    // acenda todos os LEDs quando F = 1

endmodule
```

Transfira o arquivo para a placa DE-01 e verifique seu funcionamento.


## Entrega

- Tabela-verdade preenchida com os *don't cares* identificados e justificados
- Mapa de Karnaugh com os grupos circulados e a expressão obtida
- Arquivo `top.v` com a implementação
