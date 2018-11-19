programa{
	
	funcao inicio(){

		inteiro numero, tamanho_vetor

		escreva("Digite um n�mero natural maior que 0 e menor que 100000: ")
		leia(numero)

		se (numero < 1 ou numero > 100000){
			
			limpa()
			escreva("O n�mero que voc� digitou n�o atende � regra deste algoritmo. \n\n")

			inicio()
		}
		senao{
			limpa()

			tamanho_vetor = (numero / 4) + 20
			
			Primos(numero, tamanho_vetor)
		}
	}
	
	funcao Primos(inteiro n, inteiro t){

		inteiro i, p, primos[t]

		primos[0] = 1
		primos[1] = 2
		primos[2] = 3
		primos[3] = 5
		primos[4] = 7

		escreva("Os n�meros primos de 1 a ", n, " s�o:\n")

		i = 1
		p = 0

		enquanto(i <= n){

			enquanto(i < 8 e i <= n){

				se(primos[p] == i){
					
					escreva(primos[p], "\n")
					p++
				}
				
				i++
				
			}

			p = 1

			enquanto(p < i e i > 7){

				se(primos[p] == 0){

					primos[p] = i
					escreva(primos[p], "\n")
					p = i
					//grava um novo primo no vetor ao encontrar 0 e iguala o p ao i para sair do looping
				}
				senao se(i % primos[p] == 0){
					
					p = i
					//iguala o p ao i para sair do looping pois encontrou um divisor
					
				}
				senao se(i % primos[p] != 0){
					
					p++
					//Segue para o pr�ximo n�mero primo do vetor para testar i novamente
				}
				
			}
			i++
			
		}			
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 669; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */