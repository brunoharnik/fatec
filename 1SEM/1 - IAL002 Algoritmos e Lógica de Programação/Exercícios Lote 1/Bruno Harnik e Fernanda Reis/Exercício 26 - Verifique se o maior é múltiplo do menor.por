programa
{
	inclua biblioteca Matematica --> mat
	
	funcao inicio()
	{
		inteiro a, b, maior, menor
		
		escreva("Digite dois n�meros inteiros: ")
		leia(a,b)
		
		maior = mat.maior_numero(a, b)
		menor = mat.menor_numero(a, b)

		se (maior % menor == 0){
			escreva(maior, " � divis�vel por ", menor, ".\n", maior, " / ", menor, " = ", maior / menor)
		}
		senao{
			escreva(maior, " n�o � divis�vel por ", menor, ".")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 423; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */