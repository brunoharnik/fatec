programa{

	funcao inicio(){

		inteiro numero_binario, x = 1, potencia = 1, vetor_binario[10], i, soma = 0, decimal

		escreva("Insira um n�mero bin�rio maior que 1 e menor que 1000000000: ")
		leia(numero_binario)

		//Valida��o do intervalo do enunciado
		se(numero_binario < 1 ou numero_binario > 1000000000){

			limpa()
			escreva("Voc� digitou um valor inv�lido. Refa�a...\n")

			inicio()
			
		}senao{
			//Separa os algarismos e popula o vetor
			para(i = 0; i < 10; i++){
	
				vetor_binario[i] = numero_binario / x % 10 
				
				x = x * 10

				se(vetor_binario[i] < 0 ou vetor_binario[i] > 1){
	
					limpa()
					escreva("O n�mero que voc� digitou n�o � bin�rio. Refa�a...\n")
	
					inicio()
					
				}
			}
			
			para(i = 0; i < 10; i++){
	
				se(i == 0){
	
					soma = vetor_binario[i]
					
				}senao{
	
					potencia = potencia * 2
					soma = soma + (vetor_binario[i] * potencia)
					
				}
				
			}
	
			decimal = soma

			limpa()
			escreva("O n�mero bin�rio ", numero_binario, " em decimal � ", decimal)

			escreva("\n\nVerifique outro n�mero bin�rio :-)\n")
			inicio()

		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1106; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */