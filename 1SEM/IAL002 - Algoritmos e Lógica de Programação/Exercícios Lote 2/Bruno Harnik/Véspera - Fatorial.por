programa
{

	inteiro numero, f, fatorial = 1
	
	funcao inicio()
	{
	
		escreva("Digite um n�mero inteiro positivo: ")
		leia(numero)

		se(numero == 0 ou numero == 1){

			escreva("O fatorial de ", numero, " � igual a 1.")
		}senao{

			para(f = numero; f > 1; f--){

				fatorial = fatorial * f
				
			}

			escreva("O fatorial de ", numero, " � igual a ", fatorial)
			
		}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 305; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */