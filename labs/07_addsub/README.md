# Somador/Subtrator de 4 bits com sinal

O objetivo desta prática é implementar e testar um somador/subtrator de 4 bits, **a partir de um somador fornecido**, em duas etapas:
1. [Implementar](addsub4bits.v) e testar por simulação;
2. [Adaptar](top.v) e colocar no kit de FPGA. 

## Funcionamento na placa

Deseja-se implementar um Somador/Subtrator de 4 bits utilizando como saída o valor em hexadecimal nos displays de sete segmentos. O sistema deve ter as seguintes características: 
- O *switch* `SW[9]` escolhe entre Soma=0 e Subtração=1;
- Os *switches*` SW[8:5]` e `SW[4:1]` informam os operandos X e Y respectivamente; 
- Em caso de *overflow*, o *switch* `SW[0]` escolhe entre mostrar "Erro"=0 ou as Entradas=1 que o geraram;
- Os 4 dígitos mais à esquerda mostram as entradas ou "Erro", dependendo de `SW[0]`; 
- Os 2 dígitos mais à direita mostram sempre o resultado da operação
- Os LEDs acendem todos em caso de erro;
