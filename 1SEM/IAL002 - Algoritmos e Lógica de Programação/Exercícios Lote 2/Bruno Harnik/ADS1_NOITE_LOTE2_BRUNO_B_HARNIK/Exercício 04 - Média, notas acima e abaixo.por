programa{

	const inteiro qtd = 13

	inteiro i, tops
	
	real nota[qtd], md, soma
	
	funcao inicio()
	{
		escreva("Exerc�cio 04 - Lote 2\n\nCriar e coletar em um vetor [", qtd, "] real e calcular e exibir:\na)A m�dia do grupo;\nb)A quantidade de notas acima da m�dia;\nc)As posi��es dos valores abaixo da m�dia do grupo.\n\nBruno Bega Harnik | RA 1110481823052\nProf. Ricardo Satoshi Oyakawa\n\n------------------------------------------------------------\n\n")

		entrada()
		media()
		acima()
		abaixo()
		
	}
	
	funcao entrada(){

		soma = 0
		
		para (i = 0; i < qtd; i++){

			escreva(i + 1, "� nota: ")
			leia(nota[i])

			soma = soma + nota[i]
			
		}

	}
	
	funcao media(){

		md = soma / qtd
		escreva("\nA m�dia das notas do grupo �: ", md)
		
	}

	funcao acima(){

		i = 0
		tops = 0
		
		para (i = 0; i < qtd; i ++){

			se (nota[i] > md){

				tops = tops + 1
				
			}
			
		}

		escreva("\n\n", tops, " nota(s) acima da m�dia")
			
	}

	funcao abaixo(){

		escreva("\n\nNotas abaixo da m�dia e suas respectivas entradas:\n")
		
		i = 0
		
		para (i = 0; i < qtd; i ++){

			se (nota[i] < md){

				escreva(nota[i], " | ", i + 1, "� nota\n")
				
			}
			
		}
		
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1173; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */