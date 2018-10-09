
/* CLIQUE NO SINAL DE "+", � ESQUERDA, PARA EXIBIR A DESCRI��O DO EXEMPLO
 *  
 * Copyright (C) 2014 - UNIVALI - Universidade do Vale do Itaja�
 * 
 * Este arquivo de c�digo fonte � livre para utiliza��o, c�pia e/ou modifica��o
 * desde que este cabe�alho, contendo os direitos autorais e a descri��o do programa, 
 * seja mantido.
 * 
 * Se tiver dificuldade em compreender este exemplo, acesse as v�deoaulas do Portugol 
 * Studio para auxili�-lo:
 * 
 * https://www.youtube.com/watch?v=K02TnB3IGnQ&list=PLb9yvNDCid3jQAEbNoPHtPR0SWwmRSM-t
 * 
 * Descri��o:
 * 
 * 	Este exemplo pede ao usuario que informe um n�mero inteiro. Logo ap�s, calcula e
 * 	exibe todos os n�meros da sequ�ncia de Fibonacci at� a posi��o informada pelo usu�rio.
 * 	
 * 	Neste exemplo, os n�meros da sequ�ncia de Fibonacci s�o calculados chamando recursivamente
 * 	a fun��o "fibonacci" definida no programa.
 * 	
 * 	A sequ�ncia de Fibonacci � uma sequ�ncia num�rica especial, na qual cada elemento da sequ�ncia 
 * 	� calculado somando os dois elementos anteriores.
 * 	
 * 	Para saber mais sobre a sequ�ncia de Fibonacci, acesse: 
 * 	http://www.infoescola.com/matematica/sequencia-de-fibonacci/
 * 	
 * Autores:
 * 
 * 	Giordana Maria da Costa Valle
 * 	Carlos Alexandre Krueger
 * 	
 * Data: 01/06/2013
 */
 
programa
{
	funcao inicio()
	{
		// 37.	Receba um n�mero inteiro. Calcule e mostre a s�rie de Fibonacci at� o seu N?n�simo termo.
		
		inteiro numero
		 
		escreva("Quantos elementos da sequ�ncia de Fibonacci deseja calcular? ")
		leia(numero)

		
		para (inteiro i = 1; i <= numero ; i++)
		{
			escreva(fibonacci(i), " ")  // Calcula e exibe o n�mero da sequ�ncia na posi��o atual
		}

		escreva("\n")
	}

	
	funcao inteiro fibonacci(inteiro posicao)
	{		
		se (posicao == 1)
		{
			retorne 0
		}
		senao se (posicao == 2)
		{
			retorne 1
		}

		retorne fibonacci(posicao - 1) + fibonacci(posicao - 2)		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1780; 
 * @DOBRAMENTO-CODIGO = [1];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */