programa
{		
	const inteiro qtd = 3, total = 6

	inteiro VT1[qtd], VT2[qtd], VT3[total], i, par, impar
	
	funcao inicio(){

		escreva("Exerc�cio 03 - Criar e coletar valores inteiros nos vetores VT1[3] e VT2[3].\nConcatenar esses valores em um 3� vetor (VT3[6]) e mostrar os seus dados.\n\nBruno Bega Harnik | RA 1110481823052\nProf. Ricardo Satoshi Oyakawa\n\n------------------------------------------------------------\n\n")

		EntraDados()

		OrganizaVT3()


		escreva("\nVetor 3 resultante da concatena��o dos vetores 1 e 2.\n")
		para (i = 0; i < total; i++){

			escreva(i + 1, "� valor: ", VT3[i], "\n")
		}

		
		
	}
	
	funcao EntraDados(){
		
		escreva("Digite os valores do 1� vetor\n")
		para (i = 0; i < qtd; i++){
	
			escreva(i + 1, "� valor: ")
			leia(VT1[i])
			
		}
	
		escreva("\nDigite os valores do 2� vetor\n")
		para (i = 0; i < qtd; i++){
	
			escreva(i + 1, "� valor: ")
			leia(VT2[i])
			
		}
	}

	funcao OrganizaVT3(){

		para (i = 0; i < total; i = i + 2){
	
			par = i / 2
			VT3[i] = VT1[par]
	
		}

		para (i = 1; i < total; i = i + 2){
	
			impar = (i + 1) / 2 - 1
			VT3[i] = VT2[impar]
	
		}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1127; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */