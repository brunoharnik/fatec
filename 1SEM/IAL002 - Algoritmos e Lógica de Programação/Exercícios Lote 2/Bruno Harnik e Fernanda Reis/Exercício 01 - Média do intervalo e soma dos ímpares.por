programa{
	
	const inteiro qtd = 3

	inteiro vetor[qtd], i, qti, soma
	
	real md
	
	funcao inicio(){

	escreva("Exerc�cio 01 - Lote 2\n\nCriar e coletar um vetor [", qtd, "] inteiro. Calcular e exibir:\na)A m�dia dos valores entre 10 e 200;\nb)A soma dos n�meros �mpares.\n\nBruno Bega Harnik | RA 1110481823052\nProf. Ricardo Satoshi Oyakawa\n\n------------------------------------------------------------\n\n")

		i = 0
		qti = 0
		md = 0.0
		soma = 0

		para (i = 0; i < qtd; i++){

			escreva("Insira o ", i + 1, "� valor: ")
			leia(vetor[i])
			
			se (vetor[i] >= 10 e vetor[i] <= 200){

				md = md + vetor[i]
				qti = qti + 1
				
			}

			se (vetor[i] % 2 != 0){

				soma = soma + vetor[i]
				
			}
		}
		
		md = md / qti
		
		escreva("\nA m�dia dos valores inseridos, que estejam no intervalo de 10 a 200, � ", md)
		escreva("\n\nA soma valores �mpares inseridos � ", soma, "\n")

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 485; 
 * @PONTOS-DE-PARADA = 11;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */