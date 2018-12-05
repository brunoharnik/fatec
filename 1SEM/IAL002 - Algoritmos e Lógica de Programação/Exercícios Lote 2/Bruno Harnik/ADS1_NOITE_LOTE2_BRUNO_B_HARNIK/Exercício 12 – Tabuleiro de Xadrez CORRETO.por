programa
{

	inteiro tabuleiro[8][8], pecas[7], somas[7], soma_total, l, c, i	

	cadeia nomes[7] = {"Pe�o", "Torre", "Bispo", "Cavalo", "Rainha", "Rei", "casa vazia"}
	
	funcao inicio(){

		//casa vazia
		pecas[0] = 1
		//Pe�o
		pecas[1] = 2
		//Torre
		pecas[2] = 3
		//Bispo
		pecas[3] = 4
		//Cavalo
		pecas[4] = 5
		//Rainha
		pecas[5] = 6
		//Rei
		pecas[6] = 7

		//Distribuir pe�as no tabuleiro (decidi distribuir como o jogo � iniciado)
		DistribuirPecas()

		Contagem()
		
	}
	funcao DistribuirPecas(){

		escreva("Distribui��o das pe�as no tabuleiro: \n\n")
		
		tabuleiro[0][0] = pecas[1]
		tabuleiro[0][1] = pecas[2]
		tabuleiro[0][2] = pecas[3]
		tabuleiro[0][3] = pecas[4]
		tabuleiro[0][4] = pecas[5]
		tabuleiro[0][5] = pecas[3]
		tabuleiro[0][6] = pecas[2]
		tabuleiro[0][7] = pecas[1]

		tabuleiro[7][0] = pecas[1]
		tabuleiro[7][1] = pecas[2]
		tabuleiro[7][2] = pecas[3]
		tabuleiro[7][3] = pecas[4]
		tabuleiro[7][4] = pecas[5]
		tabuleiro[7][5] = pecas[3]
		tabuleiro[7][6] = pecas[2]
		tabuleiro[7][7] = pecas[1]
		
		para(c = 0; c < 8; c++){

			tabuleiro[1][c] = pecas[0]
			tabuleiro[6][c] = pecas[0]

			para(l = 2; l < 6; l++){

				tabuleiro[l][c] = pecas[6]

			}
			
		}

		para(l = 0; l < 8; l++){

			para(c = 0; c < 8; c++){

				escreva("[ ", tabuleiro[l][c], " ]")
				
			}
			escreva("\n\n")
			
		}

	}

	funcao Contagem(){

		para(l = 0; l < 8; l++){

			para(c = 0; c < 8; c++){

				i = 0

				enquanto(i < 7 e tabuleiro[l][c] != pecas[i]){
					
					i++
					
				}

				somas[i] = somas[i] + 1
								
			}

		}
		
		para(i = 0; i < 7; i++){

			escreva("Total de ", nomes[i], ":")
			escreva(somas[i])
			escreva("\n")

			soma_total = somas[i] * pecas[i]
			
		}

		escreva("A soma total dos valores atribuidos � ", soma_total)
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1778; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */