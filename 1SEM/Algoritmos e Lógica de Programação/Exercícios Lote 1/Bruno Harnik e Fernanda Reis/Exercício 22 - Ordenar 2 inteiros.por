programa
{
	funcao inicio()
	{
		inteiro x, y
		escreva("Ordenador de dois inteiros\n\n")
		escreva("Digite o primeiro n�mero inteiro: ")
		leia(x)
		escreva("Digite outro n�mero inteiro: ")
		leia(y)

		se(x < y){
			escreva("\nOrdem crescente: ", x,", ",y)
		}
		senao{
			escreva("\nOrdem crescente: ", y,", ",x)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 306; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */