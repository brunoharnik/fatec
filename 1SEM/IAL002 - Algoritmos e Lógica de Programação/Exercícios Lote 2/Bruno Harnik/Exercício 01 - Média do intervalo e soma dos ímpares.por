programa{
	
	funcao inicio(){

	const inteiro qtd = 3

	inteiro vetor[qtd], i, qti, soma
	
	real media

	escreva("Exerc�cio 01 - Lote 2\n\nCriar e coletar um vetor [", qtd, "] inteiro. Calcular e exibir:\na)A m�dia dos valores entre 10 e 200;\nb)A soma dos n�meros �mpares.\n\nBruno Bega Harnik | RA 1110481823052\nProf. Ricardo Satoshi Oyakawa\n\n------------------------------------------------------------\n\n")

		qti = 0
		media = 0.0
		soma = 0

		para (i = 0; i < qtd; i++){

			escreva("Insira o ", i + 1, "� valor: ")
			leia(vetor[i])
			
			se (vetor[i] > 10 e vetor[i] < 200){

				media = media + vetor[i]
				qti = qti + 1
				
			}

			se (vetor[i] % 2 != 0){

				soma = soma + vetor[i]
				
			}
		}
		
		media = media / qti
		
		escreva("\nA m�dia dos valores entre 10 e 200 � ", media)
		escreva("\n\nA soma dos valores �mpares inseridos � ", soma, "\n")

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 439; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */