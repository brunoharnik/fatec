programa
{
	const inteiro qtd = 20

	inteiro i, j, meio

	real vetor[qtd], aux, key

	funcao inicio(){

		meio = 0

		escreva("Exerc�cio 07 - Lote 2\n\nCriar e coletar em um vetor [", qtd, "] com n�meros aleat�rios.\nClassificar este vetor em ordem crescente e mostrar os dados.\n\nBruno Bega Harnik | RA 1110481823052\nProf. Ricardo Satoshi Oyakawa\n\n------------------------------------------------------------\n\n")
		
		escreva("Insira ", qtd, " valores reais:\n")
	
		aux = 0.0
		
		para(i = 0; i < qtd; i++){
				
			leia(vetor[i])

			para(j = 0; j < qtd; j++){	

				se(vetor[i] < vetor[j]){

					aux = vetor[i]
					vetor[i] = vetor[j]
					vetor[j] = aux
					
				}
			}
		}
		escreva("\nValores ordenados:\n")
		para(i = 0; i < qtd; i++){
			
			escreva(vetor[i], "\n")
			
		}
		
		escreva("\nDigite um valor, verifique se ele est� na lista e em qual posi��o se encontra: ")
		leia(key)
		
		PesquisaBinaria(vetor, key, qtd )

		se(meio == -1){
			escreva("\nO valor que voc� solicitou n�o foi encontrado no vetor.\n")
		}
		senao{
			escreva("\nO valor que voc� solicitou foi encontrado na ", meio + 1, "� posi��o.\n")
		}
	}
	
	funcao PesquisaBinaria(real vet[], real chave, inteiro tam){
	
			inteiro zero = 0
	
			enquanto (zero < tam - 1){
	
				meio = (zero + tam) / 2

				se (chave == vet[meio]){
					
					retorne
					
				}
				se (chave < vet[meio]){
					
					tam = meio
					
				}
				senao{
					zero = meio
				}
					
			}		

		meio = -1
		retorne
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 34; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */