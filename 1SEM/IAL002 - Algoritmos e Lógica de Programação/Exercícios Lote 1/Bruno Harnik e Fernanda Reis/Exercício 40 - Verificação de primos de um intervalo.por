programa{
	
	inteiro a, b, aux, numero, quadrado
	
	funcao inicio()
	{
		escreva("Receba 2 n�meros inteiros.\nVerifique e mostre todos os n�meros primos existentes entre eles.\n\nDigite o primeiro n�mero inteiro: ")

		leia(a)
		escreva("Digite o segundo n�mero inteiro: ")
		leia(b)
		aux = a
		
		se(a > b){
			aux = a
			a = b
			b = aux
		}

		escreva("\nOs n�meros primos do intervalo entre ", a, " e ", b ," s�o:\n")
		para(numero = a + 1; numero < b; numero++){

			quadrado = numero * numero
			
			se(quadrado % 2 != 0 e quadrado % 3 != 0 e quadrado % 5 != 0 e quadrado % 7 != 0 ou numero == 2 ou numero == 3 ou numero == 5 ou numero == 7){

				escreva(numero,"\n")
				
			}
			
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 211; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */