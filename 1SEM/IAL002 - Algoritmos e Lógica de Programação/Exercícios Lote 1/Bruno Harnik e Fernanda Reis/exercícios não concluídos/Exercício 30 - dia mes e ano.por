programa
{
	funcao inicio()
	{
		inteiro nascano, nascmes, nascdia, hjano, hjmes, hjdia, ano, mes, dia

		escreva("Digite dia, m�s e ano de nascimento: ")
		leia(nascdia)
		leia(nascmes)
		leia(nascano)

		escreva("Digite data de hoje: ")
		leia(hjdia)
		leia(hjmes)
		leia(hjano)



		// nascano e hjano possuem 4 d�gitos e n�o podem > 2018
		//nascmes e hjmes n�o podem ser <1 e >12
		//nascdia e hjdia s�o 30 se nascmes ou hjmes == 4 ou 6 ou 9 ou 11
		//					senao s�o 30, exceto se nascmes ou hjmes == 2 pois
		//					se nascmes ou hjmes == 2, nascdia ou hjdia == 28
		//					por�m, se nascano ou hjano % 400 = 0 ou (nascano ou hjano % 4 = 0 
		//					e nascano ou hjdia % 100 <> 0, nascdia ou hjdia == 29
		//	se nascano < hjano, erro pois nascano n�o pode ser > hjano
		//	CONTAS: 
		//		hjano - nascano = ano
		//		nasc
		//iniciar as condicionais de ano de nascimento
		//anobissexto =  
		se ((nascano % 400 == 0) ou ((nascano % 4 == 0) e (nascano % 100 <> 0)) e (nascmes == 2)) {
      			nascdia == 29
		}
      	senao {
      		//segue programa

      		se (nascmes == 1 ou 3 ou 5 ou 7 ou 8 ou 10 ou 12) {
      			nascdia == 31
      		}
			senao {
				nascdia == 30 
			}
		se (nascmes > 12 e < 1) {
			escreva ("erro! m�s informado n�o existe!")
		senao
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 280; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */