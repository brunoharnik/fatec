programa
{
	funcao inicio()
	{
		//32.	Receba um n�mero inteiro. Calcule e mostre o seu fatorial.

		inteiro numero, natual, cont

		natual = 1
		cont = 1
		
		escreva("Digite um numero: ")
		leia(numero)
		
		enquanto (natual <= numero) // Itera 'atual' at� o valor informado
		{
			cont = cont * natual // C�lcula a pr�xima multipllica��o do fatorial
			natual = natual + 1
		}
		
		escreva("O fatorial de ", numero, " �: ", cont, "\n")
}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 431; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */