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
           RECORD CONTAINS 72 CHARACTERS
           VALUE OF FILE-ID IS "C:\AMIGO.DAT"
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

       01  WS-AMIGO.
           05 WS-AMIGO-NOME               PIC X(20).
           05 WS-AMIGO-SOBRENOME          PIC X(20).
           05 WS-AMIGO-APELIDO            PIC X(10).
           05 WS-AMIGO-NASC.
               10  WS-NASC-DIA            PIC 9(02).
               10  WS-NASC-MES            PIC 9(02).
               10  WS-NASC-ANO            PIC 9(04).
           05 WS-AMIGO-CELULAR            PIC X(14).

           05 WS-NASC-CONCAT              PIC X(08).

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
           05. MENU-INPUT             PIC X(1) TO WS-MENU-OP
           FOREGROUND-COLOR 15 LINE 19 COLUMN 19.
       

       01 SS-CADASTRO.
           05. VALUE "                                         "
               BLANK SCREEN    LINE 1 COLUMN 19.
           05. VALUE "-----------------------------------------"
           FOREGROUND-COLOR 11 LINE 2 COLUMN 19.
           05. VALUE "|          Cadastro de amigo            |"
           FOREGROUND-COLOR 11 LINE 3 COLUMN 19.
           05. VALUE "-----------------------------------------"
           FOREGROUND-COLOR 11 LINE 4 COLUMN 19.
           05. VALUE " "
           LINE 5 COLUMN 19.

           05. VALUE "               Nome: "
           FOREGROUND-COLOR 11 LINE 6 COLUMN 19.
           05. CADASTRO-NOME      PIC X(20) TO WS-AMIGO-NOME
           FOREGROUND-COLOR 15 BACKGROUND-COLOR 09    LINE 6 COLUMN 40.
           05. VALUE "ex. Joao"
           FOREGROUND-COLOR 03 LINE 7 COLUMN 40.

           05. VALUE "          Sobrenome: "
           FOREGROUND-COLOR 11 LINE 8 COLUMN 19.
           05. CADASTRO-NOME      PIC X(20) TO WS-AMIGO-SOBRENOME
           FOREGROUND-COLOR 15 BACKGROUND-COLOR 09    LINE 8 COLUMN 40.
           05. VALUE "ex. da Silva"
           FOREGROUND-COLOR 03 LINE 9 COLUMN 40.

           05. VALUE "            Apelido: "
           FOREGROUND-COLOR 11 LINE 10 COLUMN 19.
           05. CADASTRO-NOME      PIC X(10) TO WS-AMIGO-APELIDO
           FOREGROUND-COLOR 15 BACKGROUND-COLOR 09    LINE 10 COLUMN 40.
           05. VALUE "ex. Jao"
           FOREGROUND-COLOR 03 LINE 11 COLUMN 40.

           05. VALUE " Data de nascimento: "
           FOREGROUND-COLOR 11 LINE 12 COLUMN 19.
           05. CADASTRO-DIA      PIC X(02) TO WS-NASC-DIA
           FOREGROUND-COLOR 15 BACKGROUND-COLOR 09    LINE 12 COLUMN 40.
           05. CADASTRO-MES      PIC X(02) TO WS-NASC-MES
           FOREGROUND-COLOR 15 BACKGROUND-COLOR 09    LINE 12 COLUMN 43.
           05. CADASTRO-ANO      PIC X(04) TO WS-NASC-ANO
           FOREGROUND-COLOR 15 BACKGROUND-COLOR 09    LINE 12 COLUMN 46.
           05. VALUE "DD MM AAAA"
           FOREGROUND-COLOR 03 LINE 13 COLUMN 40.

           05. VALUE "            Celular: "
           FOREGROUND-COLOR 11 LINE 14 COLUMN 19.
           05. CADASTRO-NOME      PIC X(14) TO WS-AMIGO-CELULAR
           FOREGROUND-COLOR 15 BACKGROUND-COLOR 09    LINE 14 COLUMN 40.
           05. VALUE "ex. +5511987654321"
           FOREGROUND-COLOR 03 LINE 15 COLUMN 40.
           
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
       000-INICIO.
           OPEN EXTEND ARQUIVO.
           CLOSE ARQUIVO.

       100-MAIN.
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
           GO TO 100-MAIN.
       
       200-ABRE-ARQUIVO.
           OPEN I-O ARQUIVO.
           DISPLAY "STATUS DO ACESSO: " ARQUIVO-STATUS.
           IF ARQUIVO-STATUS = "00"
               DISPLAY "Arquivo acessado com sucesso."
               DISPLAY " "
           ELSE
               DISPLAY "Ocorreu algum erro. Consulte o manual"
               DISPLAY "do Cobol na parte de File Status."
               DISPLAY " ".
       
       300-FECHA-ARQUIVO.
           CLOSE ARQUIVO.
           MOVE "N" TO CHAVE-EOF.
           
       400-LEITURA.
           READ ARQUIVO AT END MOVE "S" TO CHAVE-EOF.
           COMPUTE CONTADOR-ARQUIVO = CONTADOR-ARQUIVO + 1.

           DIVIDE CONTADOR-ARQUIVO BY ITENS-POR-PAGINA
           GIVING DIVISAO-CONTADOR REMAINDER RESTO-CONTADOR.

           IF RESTO-CONTADOR = 22
               DISPLAY "Pressione ENTER para exibir a pagina seguinte."
               ACCEPT PROSSEGUIR.

           DISPLAY ENTRADA-GRAVA.
       
       500-EXIBIR-LISTA.
           PERFORM 000-INICIO.
           DISPLAY "-------------------------------------------" 
           DISPLAY "Realizando a leitura sequencial do arquivo:"
           DISPLAY "-------------------------------------------"
           COMPUTE CONTADOR-ARQUIVO = 0.
           PERFORM 200-ABRE-ARQUIVO.
           DISPLAY CABECALHO-LEITURA.
           PERFORM 400-LEITURA UNTIL CHAVE-EOF-SIM

           COMPUTE CONTADOR-ARQUIVO = CONTADOR-ARQUIVO - 1;
           DISPLAY "Total de registros: " CONTADOR-ARQUIVO
                               " - Pressione ENTER para prosseguir.".
           PERFORM 300-FECHA-ARQUIVO.
           ACCEPT PROSSEGUIR
           GO TO 100-MAIN.

       600-CADASTRAR-AMIGO.
           DISPLAY SS-CADASTRO
           ACCEPT SS-CADASTRO
           
           MOVE WS-AMIGO-NOME TO AMIGO-NOME
           MOVE WS-AMIGO-SOBRENOME TO AMIGO-SOBRENOME
           MOVE WS-AMIGO-APELIDO TO AMIGO-APELIDO
           STRING WS-NASC-ANO DELIMITED BY SIZE
                  WS-NASC-MES DELIMITED BY SIZE
                  WS-NASC-DIA DELIMITED BY SIZE
                  INTO WS-NASC-CONCAT.
           MOVE WS-NASC-CONCAT TO AMIGO-NASC
           MOVE WS-AMIGO-CELULAR TO AMIGO-CELULAR
           
           OPEN EXTEND ARQUIVO WRITE ENTRADA-GRAVA.
           CLOSE ARQUIVO.
           DISPLAY " "
           DISPLAY " "
           DISPLAY " "
           DISPLAY "Registro gravado com sucesso:"
           DISPLAY WS-AMIGO
           DISPLAY "Pressione ENTER para prosseguir."
           ACCEPT PROSSEGUIR
           GO TO 100-MAIN.

           
       900-FIM.
               DISPLAY SS-FIM.
               STOP RUN.