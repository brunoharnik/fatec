programa{

	const inteiro qtd = 10

	inteiro menor, maior, valor, i
	
	funcao inicio(){

		escreva("Digite ", qtd, " n�meros inteiros.\n")
		
		para(i = 0; i < qtd; i++){

			escreva(i + 1,"�: ")
			leia(valor)

			se(i == 0){
				menor = valor
				maior = valor
			}
			
			se(valor < menor){

				menor = valor
				
			}
			se(valor > maior){

				maior = valor
				
			}
		}

		escreva("\nMaior n�mero: ", maior, "\nMenor n�mero: ", menor, "\n")

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 431; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */