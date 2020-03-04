      **********************
      * Author: Bruno Harnik
      * Date: 2020-03
      * Purpose: Passar raiva
      * Tectonics: cobc
      **********************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. AMIGO.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT ARQUIVO ASSIGN TO DISK
           FILE STATUS IS ARQUIVO-STATUS
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD  ARQUIVO
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "C:\AMIGO.TXT"
           DATA RECORD IS ENTRADA-GRAVA.
       01  ENTRADA-GRAVA.
           05 AMIGO-NOME               PIC X(20).
           05 AMIGO-SOBRENOME          PIC X(20).
           05 AMIGO-APELIDO            PIC X(10).
           05 AMIGO-NASC               PIC 9(08).
           05 AMIGO-CELULAR            PIC 9(14).

       WORKING-STORAGE SECTION.
       01 CONTADORES.
           05 CONTADOR-ARQUIVO           PIC 9(3) VALUE 0.
           05 ITENS-POR-PAGINA           PIC 9(2) VALUE 23.
           05 DIVISAO-CONTADOR           PIC 9(2).
           05 RESTO-CONTADOR             PIC 9(2).
       
       01 ARQUIVO-STATUS               PIC X(2).

       01 WS-MENU-OP                   PIC X.

       01 CHAVE-EOF                    PIC X(01) VALUE "N".                     
           88 CHAVE-EOF-SIM            VALUE "S".                              
           88 CHAVE-EOF-NAO            VALUE "N".   

       01 PROSSEGUIR                   PIC X.

       01 CABECALHO-LEITURA PIC X(72) VALUE
       "NOME                SOBRENOME           APELIDO   NASC.   CEL.".

       SCREEN SECTION.
       01 SS-MAIN.
           05. VALUE "                                         "
               BLANK SCREEN    LINE 1 COLUMN 19.
           05. VALUE "-----------------------------------------"
           FOREGROUND-COLOR 14 LINE 2 COLUMN 19.
           05. VALUE "|        Programinha dos amigos         |"
           FOREGROUND-COLOR 14 LINE 3 COLUMN 19.
           05. VALUE "-----------------------------------------"
           FOREGROUND-COLOR 14 LINE 4 COLUMN 19.
           05. VALUE "     .-::::::-.                          "
           LINE 5 COLUMN 19.
           05. VALUE "   .'          '.                        "
           LINE 6 COLUMN 19.
           05. VALUE "  /   O      O   \                       "
           LINE 7 COLUMN 19.
           05. VALUE " :       ..  `    :    Once upon a time, "
           LINE 8 COLUMN 19.
           05. VALUE " |    .::::::.    |    in 1987...        "
           LINE 9 COLUMN 19.
           05. VALUE " :    .------.    :                      "
           LINE 10 COLUMN 19.
           05. VALUE "  \  '   ::   '  /                       "
           LINE 11 COLUMN 19.
           05. VALUE "   '.    ::    .'                        "
           LINE 12 COLUMN 19.
           05. VALUE "     '-.::::.-'                          "
           LINE 13 COLUMN 19.
           05. VALUE "                                         "
           LINE 14 COLUMN 19.
           05. VALUE "1 - Exibir lista de amigos               "
           FOREGROUND-COLOR 10 LINE 15 COLUMN 19.
           05. VALUE "2 - Cadastrar amigo                      "
           FOREGROUND-COLOR 11 LINE 16 COLUMN 19.
           05. VALUE "9 - Finalizar programa                   "
           FOREGROUND-COLOR 12 LINE 17 COLUMN 19.
           05. VALUE "Digite a opcao que voce deseja:          "
           FOREGROUND-COLOR 15 LINE 18 COLUMN 19.
           05. MENU-INPUT FOREGROUND-COLOR 15 LINE 19 COLUMN 19
                    PIC  X(1)     TO WS-MENU-OP.
       
       01 SS-FIM.
           05. BLANK SCREEN.
           05. VALUE "             #########       #                  "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 1 COLUMN 18.
           05. VALUE "           ########           ##                "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 2 COLUMN 18.
           05. VALUE "        ########                ###             "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 3 COLUMN 18.
           05. VALUE "     ##########                  ####           "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 4 COLUMN 18.
           05. VALUE "   ######### #####                ######        "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 5 COLUMN 18.
           05. VALUE "    ###        ####                ######       "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 6 COLUMN 18.
           05. VALUE "                 #####              ######      "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 7 COLUMN 18.
           05. VALUE "                     ####          #######      "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 8 COLUMN 18.
           05. VALUE "                       #####       #######      "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 9 COLUMN 18.
           05. VALUE "                          ####    #######       "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 10 COLUMN 18.
           05. VALUE "                            #### ########       "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 11 COLUMN 18.
           05. VALUE "         ##                   ##########        "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 12 COLUMN 18.
           05. VALUE "        ######            #############         "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 13 COLUMN 18.
           05. VALUE "      #### ######################## ####        "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 14 COLUMN 18.
           05. VALUE "    ####      ##################      #####     "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 15 COLUMN 18.
           05. VALUE "  ####             #######              ####    "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 16 COLUMN 18.
           05. VALUE "####                                       #####"
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 17 COLUMN 18.
           05. VALUE " ##                                          ## "
            BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 18 COLUMN 18.
           05. VALUE " Somente o ecossocialismo pode salvar o planeta."
            FOREGROUND-COLOR 12 LINE 19 COLUMN 18.
           05. VALUE " "
            LINE 20 COLUMN 18.
           05. VALUE "                 Fim do programa.               "
            FOREGROUND-COLOR 15 LINE 21 COLUMN 18.
           05. VALUE " "
            LINE 22 COLUMN 18.

       PROCEDURE DIVISION.
       000-MAIN.
           DISPLAY SS-MAIN
           ACCEPT SS-MAIN
           IF WS-MENU-OP = 1
               GO TO 500-EXIBIR-LISTA.

           IF WS-MENU-OP = 2
               GO TO 600-CADASTRAR-AMIGO.

           IF WS-MENU-OP = 9
               GO TO 900-FIM.
           DISPLAY "Opcao invalida!"
           DISPLAY "Pressione ENTER para prosseguir."
           ACCEPT PROSSEGUIR
           GO TO 000-MAIN.
       
       100-ABRE-ARQUIVO.
           OPEN I-O ARQUIVO.
           DISPLAY "STATUS DO ACESSO: " ARQUIVO-STATUS.
           IF ARQUIVO-STATUS = "00"
               DISPLAY "Arquivo acessado com sucesso."
               DISPLAY " "
           ELSE
               DISPLAY "Ocorreu algum erro. Consulte o manual"
               DISPLAY "do Cobol na parte de File Status."
               DISPLAY " ".
       
       200-FECHA-ARQUIVO.
           CLOSE ARQUIVO.
           COMPUTE CONTADOR-ARQUIVO = 0.
       
       300-LEITURA.
           READ ARQUIVO AT END MOVE "S" TO CHAVE-EOF.
           COMPUTE CONTADOR-ARQUIVO = CONTADOR-ARQUIVO + 1.

           DIVIDE CONTADOR-ARQUIVO BY ITENS-POR-PAGINA
           GIVING DIVISAO-CONTADOR REMAINDER RESTO-CONTADOR.

           IF RESTO-CONTADOR = 22
               DISPLAY "Pressione ENTER para exibir a pagina seguinte."
               ACCEPT PROSSEGUIR.

           DISPLAY ENTRADA-GRAVA.

       400-GRAVACAO.
           DISPLAY "AINDA NAO FIZ NADA AQUI.".
       
       500-EXIBIR-LISTA.
           DISPLAY "-------------------------------------------" 
           DISPLAY "Realizando a leitura sequencial do arquivo:"
           DISPLAY "-------------------------------------------"
           PERFORM 100-ABRE-ARQUIVO.
           DISPLAY CABECALHO-LEITURA.
           PERFORM 300-LEITURA UNTIL CHAVE-EOF-SIM
           MOVE "N" TO CHAVE-EOF.
           DISPLAY "Total de registros: " CONTADOR-ARQUIVO.
           PERFORM 200-FECHA-ARQUIVO.
           DISPLAY "Pressione ENTER para prosseguir."
           ACCEPT PROSSEGUIR
           GO TO 000-MAIN.

       600-CADASTRAR-AMIGO.
           DISPLAY "GRAVAR"
           DISPLAY "Pressione ENTER para prosseguir."
           ACCEPT PROSSEGUIR
           GO TO 000-MAIN.
           
       900-FIM.
               DISPLAY SS-FIM.
               STOP RUN.