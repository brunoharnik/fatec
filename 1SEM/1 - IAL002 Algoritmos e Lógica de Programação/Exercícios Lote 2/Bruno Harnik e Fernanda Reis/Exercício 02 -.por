programa
{//2.	Criar e coletar um vetor [100] inteiro e exibir:
	//a.	O maior e o menor valor;
	//b.	A m�dia dos valores.	
	inteiro i, soma=0, 
	funcao inicio(){

		MaioreMenor()
		Media()
	}

	funcao MaioreMenor () {
		escreva("Escreva 5 n�meros: ")
		para (i=0;i<=4;i++)
			leia(vetor[i])
			soma = soma + vetor[i] //para facilitar a fun�ao media
			se(ni>i){
				//precisa guardar os valores obtidos em vetor[i] para dpois comparar
			}
			senao {
				
			}
	}
	real media
	funcao Media () {
		leia(soma)
		media = soma/i
		escreva("M�dia: ", media)
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 209; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */