programa
{
	const inteiro qtd = 100
	
	inteiro vetor[qtd], i, maior, menor
	
	real media
		
	funcao inicio(){

		escreva("Exerc�cio 02 - Lote 2\n\nCriar e coletar um vetor [", qtd ,"] inteiro e exibir:\na)O maior e o menor valor;\nb)A m�dia dos valores.\n\nBruno Bega Harnik | RA 1110481823052\nProf. Ricardo Satoshi Oyakawa\n\n------------------------------------------------------------\n\n")

		media = 0.0
		
		para(i = 0; i < qtd; i++){

			escreva("Insira o ", i + 1, "� n�mero: ")
			leia(vetor[i])

			se (i == 0){
				maior = vetor[i]
				menor = vetor[i]
			}

			se (vetor[i] > maior){
	
				maior = vetor[i]
				
			}
	
			se (vetor[i] < menor){
	
				menor = vetor[i]
				
			}

			media = media + vetor[i]

		}

		media = media / qtd

		escreva("\nO maior n�mero inseirido foi ", maior, ", o menor foi ", menor, ".\n\n")

		escreva("A m�dia dos n�meros inseridos � ", media, "\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 35; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */