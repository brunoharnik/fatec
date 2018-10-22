programa{

	const inteiro semanas = 2, produtos = 2

	inteiro tabela[semanas][produtos], linha, coluna, total_vendas, p, s, nome
	
	funcao inicio(){

		escreva("Exerc�cio 08 - Lote 2\n\nCriar e carregar uma matriz [", semanas,"][", produtos, "] inteiro com quantidade\nde produtos vendidos em ", semanas," semanas. Calcular e exibir:\na)A quantidade de cada produto vendido no m�s;\nb)A quantidade de produtos vendidos por semana;\nc)O total de produtos vendidos no m�s.\n\nBruno Bega Harnik | RA 1110481823052\nProf. Ricardo Satoshi Oyakawa\n\n------------------------------------------------------------\n\n")
		
		escreva("Digite quantos produtos foram vendidos por semana.\n")
		
		total_vendas = 0

		para(linha = 0; linha < semanas; linha++){

			escreva("\n", linha  + 1, "� semana\n")

			para(coluna = 0; coluna < produtos; coluna++){

				escreva("Produto ", coluna + 1, ": ")
				
				leia(tabela[linha][coluna])

				total_vendas = total_vendas + tabela[linha][coluna]
				
			}
		}

		escreva("\nVendas		")

		para(nome = 0; nome < produtos; nome++){

			escreva("Prod. ", nome + 1, "	")
		}

		escreva("\n")
		
		para(linha = 0; linha < semanas; linha++){
			
			escreva(linha + 1, "� semana:	")
			
			para(coluna = 0; coluna < produtos; coluna++){

				escreva(tabela[linha][coluna],"	")

			}

			escreva("\n")
			
		}

		escreva("\nTotal de produtos vendidos: ", total_vendas)
		escreva("\n")
		
		para(p = 0; p < produtos; p++){

			escreva("\nTotal de vendas do ", p + 1, "� produto: ", SomaProduto(p))
			
		}

		escreva("\n")
		
		para(s = 0; s < semanas; s++){

			escreva("\nTotal de vendas na ", s + 1, "� semana: ", SomaSemana(s))
			
		}

	}
	
	funcao inteiro SomaProduto(inteiro produto){

		inteiro total_produto = 0
		
		para(linha = 0; linha < semanas; linha++){

			total_produto = total_produto + tabela[linha][produto]
			
		}

		retorne total_produto
	}
	
	funcao inteiro SomaSemana(inteiro semana){

		inteiro total_semana = 0
		
		para(coluna = 0; coluna < produtos; coluna++){

			total_semana = total_semana + tabela[semana][coluna]
			
		}

		retorne total_semana
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 676; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */