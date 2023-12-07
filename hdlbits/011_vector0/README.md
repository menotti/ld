# Explicação 

Para usar o operador de concatenação `{}` como na solução apresentada é preciso ter certeza de que os dois lados possuem a mesma largura de bits, ou descartar deliberadamente os bits adicionais do lado esquerdo da atribuição. 

Se quiser atribuir cada sinal separadamente, pode-se usar a sintaxe:

```
	assign o0 = vec[0];
	assign o1 = vec[1];
	assign o2 = vec[2];
```