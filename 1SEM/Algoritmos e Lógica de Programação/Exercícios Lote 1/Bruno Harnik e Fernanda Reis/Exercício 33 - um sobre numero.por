programa
{
	inclua biblioteca Matematica --> mat
	//33.	Receba um n�mero. Calcule e mostre a s�rie 1 + 1/2 + 1/3 + ... + 1/N.
	funcao inicio()
	{
		real numero, cont, result

		cont=0
		result=0

		escreva("Calcularemos o resultado de 1/1+1/2+1/3+...+1/N")
		escreva("\nDigite o n�mero N:")
		leia(numero)

		 enquanto (numero >= 1) {
		 	
			result = mat.potencia(numero, -1.0)
			cont = cont + result
			numero = (numero -1)
			escreva(cont, ",") 
		 }
		
			escreva("\nO resultado da soma �:", cont)
		}
		
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 492; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */