# Explicação

Este módulo vai gerar um _warning_ na maioria nas feramentas, pois apresenta uma saída constante 0 (GND). 

A sintaxe `1'b0`, usada na resposta alternativa, possui três partes:
- O número de bits total; 
- A base usada para descrevê-los;
- Os valores dos bits na base escolhida. 

Ela é melhor do que a inicial, pois apenas `0` significa um número de 32 bits e pode gerar _warnings_ adicionais. 

Veja mais detalhes sobre [formatos numéricos em Verilog](https://verilogguide.readthedocs.io/en/latest/verilog/datatype.html#number-representation).
