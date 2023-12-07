# Explicação

A solução apresentada não é muito prática para vetores muito grandes, então podemos usar duas outras formas de solução para o mesmo problema 

## Bloco combinacional

```verilog
	always @(*) begin	
		for (integer i=0; i<8; i++)	
			out[i] = in[8-i-1];
	end
```

`always @(*)` cria um bloco combinacional. Isso cria uma lógica combinacional que calcula o mesmo resultado como código sequencial. Repetições `for` descrevem o *comportamento* do circuito, não a *estrutura*, portanto, eles só podem ser usados dentro de blocos procedurais (por exemplo, bloco `always`).
O circuito criado (fios e portas) NÃO faz nenhuma iteração: apenas produz o mesmo resultado COMO SE a iteração tivesse ocorrido. Na realidade, um sintetizador lógico fará a iteração em tempo de compilação para descobrir qual circuito produzir. Em contraste, um simulador Verilog executará o loop sequencialmente durante a simulação.

## Bloco geracional 

```verilog
	generate
		genvar i;
		for (i=0; i<8; i = i+1) begin: my_block_name
			assign out[i] = in[8-i-1];
		end
	endgenerate
```

Também é possível fazer isso com uma repetição `generate/for`. As repetições geradas parecem `for` procedurais, mas são bastante diferentes em conceito e não são fáceis de entender. Repetições `generate/for` são usadas para fazer instanciações de "coisas" (ao contrário das procedurais, não descrevem ações). Essas "coisas" são instruções de atribuição, instanciações de módulos, declarações de fios/variáveis e blocos procedimentais (coisas que você pode criar quando NÃO estiver dentro um procedimento). Essas repetições são avaliadas inteiramente em tempo de compilação. Você pode pensar nelas como forma de pré-processamento para gerar mais código, que é então executado através do sintetizador lógico.
No exemplo acima, a repetição primeiro cria 8 instruções de atribuição em tempo de compilação, que é então sintetizado. Observe que devido ao uso pretendido (geração de código em tempo de compilação), existem algumas restrições sobre como você os usa: (i) algumas ferramentas requerem que um bloco `generate/for`  tenha um `begin/end` nomeado anexado (neste exemplo, denominado `my_block_name`); (ii) dentro do corpo da repetição, as `genvar`s são somente leitura.
