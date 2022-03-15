# Explicação

Para este exercício será empregada a estrutura da instrução `case` dentro do bloco `always`, da  seginte  forma:

`always @(*) begin			
	case (entrada)
		caso1 : saída = valor1;	   // onde casoN são as diferentes entradas possíveis e valorN 
		caso2 : saída = valor2;    // são os valores da saída que variam em cada caso.
		   .      .       .
		   .      .       .
		   .      .       .
		casoN : saída = valorN;
		default: saída = valorX;   // defaut atribui uma saída aos casos não abordados na lista acima.
	endcase
end`

_Dica1_: Para este exercício lembre-se que o primeiro bit à direita está na posição zero, não 1.
_Dica2_: Usar hexadecimal economiza digitação, mas usar binário torna o exercício mais fácil de entender.