programa{

	inclua biblioteca Util --> util
	
	const inteiro qtd = 10, total = 100
	
	inteiro MAT[qtd][qtd], i, j
	
	funcao inicio(){

		inteiro opcao
		
		escreva("P2 do Satoshi\n\nExerc�cio 3\nMenu de op��es das quest�es 1 e 2.\n\n")
		escreva("[1] Carregar matriz\n[2]Ordenar matriz\n[9]Finalizar programa\n\nDigite a op��o desejada: ")
		leia(opcao)

		escolha(opcao){
			caso 1 :	limpa()
					CarregaMat()
					inicio()
					pare
					
			caso 2 :	OrdenaMat(MAT)
					inicio()
					pare

			caso 9 : 	escreva("Fim")
					pare

			caso contrario : 	escreva("Voc� digitou uma op��o inv�lida. Refa�a...\n\n")
							inicio()
		}

	}

	//Procedimento Carrega Matriz e soma os divid�veis por 3 e 5
	funcao CarregaMat(){

		MAT[0][0] = 1
		
		inteiro soma_div = 0

		//Enunciado
		escreva("Exerc�cio 1\nCarregue a matriz como exibida no enunciado, com diagonal principal\nque o valor seguinte tem dobro do valor anterior e o primeiro valor � 1,\nmostre a soma dos divis�veis por 3 e 5.\n\n")
		escreva("N�o pode movimentar conte�do na matriz, tipo \"chumbar campo\".\n\n\n")

		//Looping de carregamento da Matriz
		para(i = 0; i < qtd; i++){

			para(j = 0; j < qtd; j++){

				//se os �ndices i e j s�o iguais executa a regra
				se(i == j){
					//mas s� a partir da segunda posi��o da diagonal
					se(i > 0){
						MAT[i][j] = MAT[i - 1][j - 1] * 2
					}
				//sen�o, coloca um n�mero aleat�rio
				}senao{
					MAT[i][j] = util.sorteia(-99, 999)
				}
				//A� escreve a matriz para vermos bonitinha.
				escreva(MAT[i][j], "	")

				se(MAT[i][j] % 3 == 0 e MAT[i][j] % 5 == 0){

					soma_div = soma_div + MAT[i][j]
					
				}
			}
			
			//Pula linha na tabela
			escreva("\n")
		}
		//Escreve a soma dos divis�veis por 3 e 5
		escreva("\nA soma dos n�meros divis�veis por 3 e 5 desta matriz �: ", soma_div, "\n\n\n")
	}

	funcao OrdenaMat(inteiro ORD[][]){

		inteiro ordenador[total], k = 0, aux

		//Enunciado
		escreva("Exerc�cio 2\nCriar uma fun��o que receba a matriz e\nretorne-a classificada em ordem crescente.\n\n\n")

		//O primeiro looping passa a matriz inteira para um vetor de �ndice �nico
		para(i = 0; i < qtd; i++){

			para(j = 0; j < qtd; j++){

				ordenador[k] =  MAT[i][j]
				k++

			}
		}

		//Bubble sort no vetor
		para(i = 0; i < total; i++){
			//O segundo �ndice deve ir at� um antes do �ndice em quest�o no looping
			para(j = 0; j < i; j++){
				//e ent�o avaliar se o valor do novo �ndice � maior que o �ndice "travado", se for...
				se(ordenador[j] > ordenador[i]){

					//faz a troca de ordenador[i] com ordenador[j]
					aux = ordenador[j]
					ordenador[j] = ordenador[i]
					ordenador[i] = aux
				
				}
				
			}	

		}

		//Remonto a matriz ordenada
		k = 0
		para(i = 0; i < qtd; i++){

			para(j = 0; j < qtd; j++){

				MAT[i][j] = ordenador[k]
				k++
				escreva(MAT[i][j], "	")

			}
			escreva("\n")
		}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 434; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */