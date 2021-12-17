# Explicação

É possível atribuir a entrada `b` para duas saídas (`x` e `y`), mas o contrário não, pois causaria um curto circuito. Dito de outra forma, um sinal pode ter múltiplos destinos, mas precisa ter uma única origem. 

Experimente a versão do comentário, usando o operador de concatenação {}. É preciso ter cuidado com a largura dos sinais concatenados, pois em Verilog a atribuição de larguras diferente não gera um erro, apenas despreza os bits excedentes. 

