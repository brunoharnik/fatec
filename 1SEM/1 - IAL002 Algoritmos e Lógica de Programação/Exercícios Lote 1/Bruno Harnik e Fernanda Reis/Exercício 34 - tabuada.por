programa
{
	funcao inicio()
	{
	//34.	 Receba um n�mero. Calcule e mostre os resultados da tabuada desse n�mero.

	inteiro numero, cont, result

	cont = 0
	result = 0

	escreva("Vamos calcular a tabuada? Digite um valor: ")
	leia(numero)
	
	para (cont = 1; cont <= 10; cont++) 
		{
			result = numero * cont 
			escreva (numero, " X ", cont, " = ", result , "\n")
		}
	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 355; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */