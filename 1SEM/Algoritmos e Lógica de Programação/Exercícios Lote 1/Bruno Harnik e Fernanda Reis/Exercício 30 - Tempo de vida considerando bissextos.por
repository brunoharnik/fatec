programa
{
	
	inteiro ANOi, MESi, DIAi, ANOf, MESf, DIAf, total_dias, var_mes, var_ano, DIASMESi, novo_mes, total_mes, dias_resto, mes_intervalo, dias_intervalo
	
	funcao inicio(){
		
	escreva("<<<<< Data inicial >>>>>\n")
	escreva("Dia incial:")
	leia(DIAi)

	escreva("M�s incial:")
	leia(MESi)
		
	escreva("Ano incial:")
	leia(ANOi)
	
	escreva("\n<<<<< Data final >>>>>\n")
	escreva("Dia final:")
	leia(DIAf)

	escreva("M�s final:")
	leia(MESf)
	
	escreva("Ano final:")
	leia(ANOf)

	validacoes()
	calculo()

	}

	funcao validacoes(){ //Dispositivos para checar se o usu�rio n�o insere nenhuma data imposs�vel.
		
		se(ANOf < ANOi){
			escreva("O ano final n�o pode ser menor que o ano inicial. Refa�a...\n")
			inicio()
		}
	
		se(ANOf == ANOi e MESf < MESi){
			escreva("O m�s final n�o pode ser menor que o m�s inicial do mesmo ano. Refa�a...\n")
			inicio()
		}
	
		se(ANOf == ANOi e MESf == MESi e DIAf < DIAi){
			escreva("O dia final n�o pode ser menor que o dia inicial do mesmo m�s no mesmo ano. Refa�a...\n")
			inicio()
		}
		
		se (MESi <= 0 ou MESi > 12 ou MESf <= 0 ou MESf > 12){
			escreva("O ano tem 12 meses, insira um valor de 1 a 12 para o m�s. Refa�a...\n")
			inicio()
		}

		se (((MESi == 1 ou MESi == 3 ou MESi == 5 ou MESi == 8 ou MESi == 10 ou MESi == 12) e (DIAi > 31)) ou ((MESi == 4 ou MESi == 6 ou MESi == 7 ou MESi == 9 ou MESi == 11) e (DIAi > 30)) ou ((MESi == 2) e (DIAi > 29)) ou ((ANOi % 4 != 0) e (MESi == 2) e (DIAi > 28)) ou (DIAi <= 0)){
			escreva("Voc� digitou um dia inicial que n�o existe no m�s inicial. Refa�a...\n")
			inicio()
		}

		se (((MESf == 1 ou MESf == 3 ou MESf == 5 ou MESf == 8 ou MESf == 10 ou MESf == 12) e (DIAf > 31)) ou ((MESf == 4 ou MESf == 6 ou MESf == 7 ou MESf == 9 ou MESf == 11) e (DIAf > 30)) ou ((MESf == 2) e (DIAf > 29)) ou ((ANOf % 4 != 0) e (MESf == 2) e (DIAf > 28)) ou (DIAf <= 0)){
			escreva("Voc� digitou um dia final que n�o existe no m�s final. Refa�a...\n")
			inicio()
		}
		
	}

	funcao inteiro DiasMes(inteiro mes, inteiro ano){ //Fun��o que calcula quantos dias tem no m�s

		inteiro dias_no_mes
		
		se(mes == 1 ou mes == 3 ou mes == 5 ou mes == 8 ou mes == 10 ou mes == 12){
			dias_no_mes = 31
		}
		senao se((ano % 4 != 0) e (mes == 2)){
			dias_no_mes = 28
		}
		senao se((ano % 4 == 0) e (mes == 2)){
			dias_no_mes = 29
		}
		senao{
			dias_no_mes = 30
		}
		
		retorne dias_no_mes

	}
	
	funcao calculo(){
		se ((ANOi == ANOf) e (MESi == MESf)){	// Anos iguais e meses iguais

			total_dias = DIAf - DIAi
			escreva("Tempo decorrido: ", total_dias, " dia(s).")
			
		}
		senao{
			se(ANOi == ANOf){ //Anos iguais

				DIASMESi = DiasMes(MESi,ANOi) - DIAi
				
				se(MESf == MESi + 1){	//M�s final � o seguinte do m�s inicial
					total_dias = DIASMESi + DIAf
					escreva("Tempo decorrido: ", total_dias, " dia(s).\n")

					total_mes = total_dias / 30
					dias_resto = total_dias % 30

					escreva("Ou ", total_mes, " meses e ", dias_resto, " dias (considerando que um m�s tem 30 dias).")
					
				}
				senao{ //M�s final � pelo menos o segundo ap�s o inicial

					mes_intervalo = MESi + 1
					
					dias_intervalo = 0
					
					enquanto(mes_intervalo < MESf){			
		
						dias_intervalo = dias_intervalo + DiasMes(mes_intervalo,ANOi) //executa a fun��o de c�lculo de dias

						mes_intervalo = mes_intervalo + 1
						
					}

					total_dias = DIASMESi + dias_intervalo + DIAf

					escreva("Tempo decorrido: ", total_dias, " dia(s).\n")

					total_mes = total_dias / 30
					dias_resto = total_dias % 30

					escreva("Ou ", total_mes, " meses e ", dias_resto, " dias (considerando que um m�s tem 30 dias).")
				}
				
			}
		}

		
		
	}

	

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3627; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */