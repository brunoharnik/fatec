programa
{
	funcao inicio()
	{
		inteiro a, b, c

		escreva("Digite um n�mero inteiro: ")
		leia(a)

		b = a % 2
		c = a % 3

		se (b != 0 ou c != 0){
			escreva("O n�mero n�o � divis�vel por 2 e 3")
		}
		senao{
			escreva("O n�mero � divis�vel por 2 e 3.\n")
			escreva("\n", a, " / 2 = ", a / 2, "\n", a, " / 3 = ", a / 3)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 150; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */