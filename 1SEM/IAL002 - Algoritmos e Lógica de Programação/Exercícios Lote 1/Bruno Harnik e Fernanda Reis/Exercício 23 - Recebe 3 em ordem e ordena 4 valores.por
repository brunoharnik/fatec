programa
{
	funcao inicio()
	{
		real a, b, c, d

		escreva("Digite o primeiro valor: ")
		leia(a)

		escreva("\nDigite um valor maior que ", a, ": ")
		leia(b)

		enquanto(b <= a)
		{
			escreva("\nVoc� digitou um valor menor ou igual a ", a, ". Digite um valor maior que ", a, ": ")
			leia(b)
		}
		
		escreva("\nDigite um valor maior que ", b, ": ")
		leia(c)

		enquanto(c <= b)
		{
			escreva("\nVoc� digitou um valor menor ou igual a ", b, ". Digite um valor maior que ", b, ": ")
			leia(c)
		}

		escreva("\nDigite o quarto valor: ")
		leia(d)

		se (d <= a){
			escreva("\nValores em ordem crescente: ", d, ", ", a, ", ", b, ", ", c)
		}
		se (d > a e d <= b){
			escreva("\nValores em ordem crescente: ", a, ", ", d, ", ", b, ", ", c)
		}
		se (d > b e d <= c){
			escreva("\nValores em ordem crescente: ", a, ", ", b, ", ", d, ", ", c)
		}
		se (d > c){
			escreva("\nValores em ordem crescente: ", a, ", ", b, ", ", c, ", ", d)
		}

		
	
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 441; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */