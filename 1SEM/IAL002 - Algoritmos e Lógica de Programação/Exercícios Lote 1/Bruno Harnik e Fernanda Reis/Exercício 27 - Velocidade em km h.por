programa
{
	funcao inicio()
	{
		real volt, ext, temp, vm
		
		escreva("N�mero de voltas: ")
		leia(volt)

		escreva("Extens�o do circuito (em metros): ")
		leia(ext)
		
		escreva("Dura��o (em minutos): ")
		leia(temp)

		temp = temp * 60
		vm = ((ext/temp) * 3.6) * volt

		escreva(vm,"Km/h")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 218; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */