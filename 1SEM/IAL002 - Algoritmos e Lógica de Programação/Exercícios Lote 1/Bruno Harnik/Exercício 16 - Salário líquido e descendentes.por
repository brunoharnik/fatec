programa
{
	funcao inicio()
	{
		real Q, V, P, p, N, B, L, X
		
		escreva("Quantidade de horas trabalhadas:")
		leia(Q)
		escreva("Valor recebido por hora:")
		leia(V)
		escreva("Percentual de desconto:")
		leia(P) // aqui tem que colocar que esse valor � em porcentagem, nao sei fazer isso
		escreva("N�mero de descendentes:")
		leia(N)

		B = Q * V

		p = P/100
		
		se (N<=0)
			{
				L = B - ( p * B )
			}
			senao
			{
				X = N * 100
				L = ( B + X ) - ( p * B )
			}
			escreva("Sal�rio l�quido:",L)
	
	}	
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 49; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */