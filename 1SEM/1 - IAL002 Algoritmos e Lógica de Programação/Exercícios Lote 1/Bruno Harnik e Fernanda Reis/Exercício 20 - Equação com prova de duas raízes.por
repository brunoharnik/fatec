programa
{
     inclua biblioteca Matematica --> mat

     funcao inicio()
     {
		escreva("Equa��o do 2� grau (Ax�+ Bx + C)\n\n")
     	
          real A, B, C, delta, X1, X2
          
          escreva("Valor de A: ")
          leia(A)
          escreva("Valor de B: ")
          leia(B)
          escreva("Valor de C: ")
          leia(C)


		//Equa��o de Segundo Grau

		delta = (B * B) - (4 * A * C)

		escreva("\nDelta: ", delta)

		se (delta > 0){
			
			X1 = ( -B + mat.raiz( delta, 2.0 ) ) / 2 * A
			X2 = ( -B - mat.raiz( delta, 2.0 ) ) / 2 * A
			escreva("\nX1 = ", X1)
			escreva("\nX2 = ", X2)
			
		}
		senao{
			se (delta==0) {
			
				X1 = -B  / 2 * A
				escreva("\nUma �nica ra�z real: ", X1)
		
			}
			senao{
			
				escreva("\nDelta negativo ou menor que 0 n�o pode ser calculado")
			
			}
			
		}
		
     }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 815; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */