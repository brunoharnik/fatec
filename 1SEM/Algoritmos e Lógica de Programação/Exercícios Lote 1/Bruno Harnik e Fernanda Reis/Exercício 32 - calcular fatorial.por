programa
{
	funcao inicio()
	{
		//32.	Receba um n�mero inteiro. Calcule e mostre o seu fatorial.

		inteiro numero, cont

		cont = 1
		
		escreva("Digite um n�mero inteiro: ")
		leia(numero)
		faca {
			cont = cont * (numero * (numero - 1))
			numero = numero -2
			escreva(cont, ",")
		}
		enquanto (numero > 1) 

		escreva("\nO fatorial desse n�mero �:", cont)
}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 363; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */