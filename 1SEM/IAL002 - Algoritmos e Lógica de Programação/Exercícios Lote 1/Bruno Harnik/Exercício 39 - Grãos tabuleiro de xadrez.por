programa{
	
	inteiro casa, qtd, total
	
	funcao inicio(){

		qtd = 1
		total = 0

		para(casa = 1; casa < 65; casa++){

			escreva(casa, "� casa: ")


			se(casa < 65){

				qtd = qtd * 2
				total = total + qtd
				
				escreva(qtd, " gr�os\n")
			}
			

		}

	escreva("Total de gr�os: ", total)
	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 57; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */