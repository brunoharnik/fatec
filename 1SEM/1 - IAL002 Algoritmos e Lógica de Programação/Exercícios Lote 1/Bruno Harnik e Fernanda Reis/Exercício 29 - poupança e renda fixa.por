programa
{
	funcao inicio()
	{
		inteiro opcao, valor, nvalor
		escreva ("1)Poupan�a \n2)Renda fixa \n \n Escolha uma op��o: ")
		leia(opcao)
		escreva("\nInsira valor de investimento: ")
		leia(valor)


		se (opcao == 1) {
			nvalor=valor* 1.03
			escreva("\nValor de investimento ap�s 1 m�s: R$",nvalor)
		}
		senao {
			se(opcao == 2) {
				nvalor=valor * 1.05
				escreva("\nValor de investimento ap�s 1 m�s: R$",nvalor)
			}
			senao {
				escreva("\n Op��o inv�lida!")
				inicio()
			}
		}
	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 323; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */