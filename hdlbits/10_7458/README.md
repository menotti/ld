# Explicação

Nesta solução foram usadas duas abordagens diferentes, uma para cada saída: 
- Para `p1y` usando uma abordagem *funcional*;
- Para `p2y` usando uma abordagem *estrutural*, instanciando primitivas básicas (`and` e `or`) da linguagem. 

Há ainda uma terceira abordagem, *comportamental*, que costuma ser mais adequada para descrever circuitos sequenciais. 

Note que:
1. Não é necessário nomear as instâncias de primitivas básicas (experimente remover as palavras `a1`, `a2` e `o1`; 
2. A saída de uma primitiva básica é a primeira porta, pois ela pode ter várias entradas; 
3. Foram declarados os fios `x` e `y` para fazer a ligação entre as portas lógias. Estas declarações podem ser omitidas quando se tratam de sinais de um único bit, mas algumas ferramentas podem exigir a declaração explícita. 
