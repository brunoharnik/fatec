programa
{
	inclua biblioteca Matematica --> mat  // Inclui a biblioteca Matem�tica

	funcao inicio()
	{
		real a, b, c, delta
		
		escreva("A soma dos quadrados dos catetos � igual ao quadrado da hipotenusa. ")

		escreva("\nCateto oposto: ")
		leia(a)
		escreva("Cateto adjacente: ")
		leia(b)

		delta = (a * a) + (b * b)

		c = mat.raiz(delta, 2.0)

		escreva("A hipotenusa �: ", c)

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */