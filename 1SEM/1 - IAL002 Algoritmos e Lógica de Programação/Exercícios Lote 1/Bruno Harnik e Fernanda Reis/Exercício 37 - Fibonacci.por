programa
{
	funcao inicio(){	
				
		inteiro posicoes
		 
		escreva("Quantas posi��es da sequ�ncia de Fibonacci deseja calcular? ")
		leia(posicoes)

		
		para (inteiro i = 1; i <= posicoes ; i++)
		{
			escreva(fibonacci(i), "\n")
		}

		escreva("\n")
	}
	
	funcao inteiro fibonacci(inteiro posicao)
	{		
		se (posicao == 1)
		{
			retorne 0
		}
		senao se (posicao == 2)
		{
			retorne 1
		}
		retorne fibonacci(posicao - 1) + fibonacci(posicao - 2)		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 255; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */