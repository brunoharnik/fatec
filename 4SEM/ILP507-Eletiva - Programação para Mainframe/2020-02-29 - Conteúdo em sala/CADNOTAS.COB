      ************************************
      * Authors: Bruno Bega Harnik       *
      *          Fernanda Pinheiro Reis  *
      * Date: 2020-03                    *
      * Purpose: Academics               *
      * Tectonics: cobc                  *
      ************************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID. CADNOTAS.
           AUTHOR. Bruno Bega Harnik
           AUTHOR. Fernanda Pinheiro Reis
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQUIVO ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE  IS DYNAMIC
           RECORD KEY   IS MATRICULA
           ALTERNATE RECORD KEY IS NOME WITH DUPLICATES
           FILE STATUS  IS STATUS-ARQUIVO.

       DATA DIVISION.
       FILE SECTION.
       FD ARQUIVO
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "CADNOTAS.DAT".
           
       01 RECNOTAS.  
           05 MATRICULA            PIC 9(06).
           05 NOME                 PIC X(30).
           05 NOTA1                PIC 99V99.
           05 NOTA2                PIC 99V99.
           05 FALTAS1              PIC 9(02).
           05 FALTAS2              PIC 9(02).
       
      *************************
      * Variáveis de trabalho *
      *************************
       WORKING-STORAGE SECTION.  
       77 STATUS-ARQUIVO           PIC X(02).
       77 MENSAGEM                 PIC X(48) VALUE SPACES.
       77 TEMPORIZADOR             PIC 9(06) VALUE ZEROS.
       77 MENU-OPCAO               PIC X(01) VALUE SPACES.
       77 WS-ESC-KEY               PIC 9(02) VALUE ZEROS.



       01 MASC1                    PIC Z9,99.

       77 W-SEL                    PIC 9(01) VALUE ZEROS.
       
      *********
      * Telas *
      *********
       SCREEN SECTION.
       01 BLANK-SCREEN.
           05. BLANK SCREEN.

       01 TELA-MENSAGENS.
        05. VALUE "**************************************************"
           BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 10 COLUMN 16.
        05. VALUE "*                                                *"
           BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 11 COLUMN 16.
        05. VALUE "*"
           BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 12 COLUMN 16.
        05. PIC X(48) FROM MENSAGEM
           BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 12 COLUMN 17.
        05. VALUE "*"
           BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 12 COLUMN 65.
        05. VALUE "*                                                *"                                               
           BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 13 COLUMN 16.
        05. VALUE "**************************************************"
           BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 14 COLUMN 16.

       01 TELA-MENU-PRINCIPAL.
        05. VALUE "**************************************************"
           FOREGROUND-COLOR 12 LINE 02 COLUMN 16.
        05. VALUE "*                                                *"
           FOREGROUND-COLOR 12 LINE 03 COLUMN 16.
        05. VALUE "*                Cadastro de notas               *"
           FOREGROUND-COLOR 12 LINE 04 COLUMN 16.
        05. VALUE "*                                                *"                                               
           FOREGROUND-COLOR 12 LINE 05 COLUMN 16.
        05. VALUE "**************************************************"
           FOREGROUND-COLOR 12 LINE 06 COLUMN 16.
        05. VALUE "C"
           FOREGROUND-COLOR 14 LINE 08 COLUMN 16.
        05. VALUE "adastrar um estudante e suas notas."
           FOREGROUND-COLOR 15 LINE 08 COLUMN 17.
        05. VALUE "L"
           FOREGROUND-COLOR 14 LINE 10 COLUMN 16.
        05. VALUE "ista completa de matriculas, estudantes e notas."
           FOREGROUND-COLOR 15 LINE 10 COLUMN 17.
        05. VALUE "A"
           FOREGROUND-COLOR 14 LINE 12 COLUMN 16.
        05. VALUE "tualizar os dados de um estudante."
           FOREGROUND-COLOR 15 LINE 12 COLUMN 17.
        05. VALUE "D"
           FOREGROUND-COLOR 14 LINE 14 COLUMN 16.
        05. VALUE "eletar um registro."
           FOREGROUND-COLOR 15 LINE 14 COLUMN 17.
        05. VALUE "E"
           FOREGROUND-COLOR 14 LINE 16 COLUMN 16.
        05. VALUE "statisticas."
           FOREGROUND-COLOR 15 LINE 16 COLUMN 17.
        05. VALUE "F"
           FOREGROUND-COLOR 14 LINE 18 COLUMN 16.
        05. VALUE "inalizar o programa."
           FOREGROUND-COLOR 15 LINE 18 COLUMN 17.
        05. VALUE "Digite a letra que corresponde"
           FOREGROUND-COLOR 15 LINE 23 COLUMN 16.
        05. VALUE "ao item desejado do menu:"
           FOREGROUND-COLOR 15 LINE 24 COLUMN 16.
        05. MENU-INPUT             PIC X(01) TO MENU-OPCAO
           FOREGROUND-COLOR 14 LINE 24 COLUMN 41 AUTO.

       01 TELA-CADASTRO.
        05. VALUE "**************************************************"
           FOREGROUND-COLOR 14 LINE 02 COLUMN 16.
        05. VALUE "*                                                *"
           FOREGROUND-COLOR 14 LINE 03 COLUMN 16.
        05. VALUE "*          Cadastrar estudante e notas           *"
           FOREGROUND-COLOR 14 LINE 04 COLUMN 16.
        05. VALUE "*                                                *"                                               
           FOREGROUND-COLOR 14 LINE 05 COLUMN 16.
        05. VALUE "**************************************************"
           FOREGROUND-COLOR 14 LINE 06 COLUMN 16.
        05. MATRICULA-INPUT                PIC 9(06) TO MATRICULA
           BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 24 COLUMN 41.
       
       01 TELA-SAIDA.
        05. VALUE "Deseja realmente sair?"
           FOREGROUND-COLOR 14 LINE 12 COLUMN 30.
        05. VALUE "Esc"
           FOREGROUND-COLOR 14 LINE 14 COLUMN 26.
        05. VALUE "- Nao"
           FOREGROUND-COLOR 15 LINE 14 COLUMN 30.
        05. VALUE "Tab ou Enter"
           FOREGROUND-COLOR 08 LINE 14 COLUMN 38.
        05. VALUE "- Sim"
           FOREGROUND-COLOR 15 LINE 14 COLUMN 51.

      **************
      * O Programa *
      **************
       PROCEDURE DIVISION.
       INICIO.

       000-ABERTURA.
           OPEN I-O ARQUIVO
           IF STATUS-ARQUIVO NOT = "00"
               IF STATUS-ARQUIVO = "30"
               OPEN OUTPUT ARQUIVO
               MOVE "            Arquivo sendo criado..." TO MENSAGEM
               PERFORM MSG-ZERA THRU MSG-FIM
               CLOSE ARQUIVO
               GO TO 000-ABERTURA
               ELSE
               MOVE "         Erro na abertura do arquivo." TO MENSAGEM
               PERFORM MSG-ZERA THRU MSG-FIM
               GO TO ROT-FIM-EXIT.

       001-ZERA-VARS.
           MOVE ZEROS  TO MATRICULA NOTA1 NOTA2 FALTAS1 FALTAS2
           MOVE SPACES TO NOME.

       002-MENU-PRINCIPAL.
           DISPLAY BLANK-SCREEN
           DISPLAY TELA-MENU-PRINCIPAL
           ACCEPT TELA-MENU-PRINCIPAL.
           
           IF MENU-OPCAO = "C" OR "c"
               PERFORM 100-CADASTRAR THRU 100-CADASTRAR-FIM
               GO TO 002-MENU-PRINCIPAL

           ELSE IF MENU-OPCAO = "L" OR "c"
               PERFORM 200-LISTAR THRU 200-LISTAR-FIM
               GO TO 002-MENU-PRINCIPAL

           ELSE IF MENU-OPCAO = "A" OR "a"
               PERFORM 300-ATUALIZAR THRU 300-ATUALIZAR-FIM
               GO TO 002-MENU-PRINCIPAL

           ELSE IF MENU-OPCAO = "D" OR "d"
               PERFORM 400-DELETAR THRU 400-DELETAR-FIM
               GO TO 002-MENU-PRINCIPAL

           ELSE IF MENU-OPCAO = "E" OR "e"
               PERFORM 500-ESTATISTICAS THRU 500-ESTATISTICAS-FIM
               GO TO 002-MENU-PRINCIPAL

           ELSE IF MENU-OPCAO = "F" OR "f"
               GO TO ROT-FIM

           ELSE
               MOVE "              Opcao invalida!" TO MENSAGEM
               PERFORM MSG-ZERA THRU MSG-FIM
               GO TO 002-MENU-PRINCIPAL.

      *************
      * Cadastrar *
      *************
       100-CADASTRAR.
           DISPLAY BLANK-SCREEN.
           DISPLAY TELA-CADASTRO.
           ACCEPT TELA-CADASTRO.

       100-CADASTRAR-FIM.
           DISPLAY "FOI".
           EXIT.

      **********
      * Listar *
      **********
       200-LISTAR.
           DISPLAY BLANK-SCREEN.
           DISPLAY TELA-CADASTRO.
           ACCEPT TELA-CADASTRO.
       
       200-LISTAR-FIM.
           DISPLAY "FOI".
           EXIT.
       
      *************
      * Atualizar *
      *************
       300-ATUALIZAR.
           DISPLAY BLANK-SCREEN.
           DISPLAY TELA-CADASTRO.
           ACCEPT TELA-CADASTRO.
       
       300-ATUALIZAR-FIM.
           DISPLAY "FOI".
           EXIT.

      ***********
      * Deletar *
      ***********
       400-DELETAR.
           DISPLAY BLANK-SCREEN.
           DISPLAY TELA-CADASTRO.
           ACCEPT TELA-CADASTRO.

       400-DELETAR-FIM.
           DISPLAY "FOI".
           EXIT.

      ****************
      * Estatísticas *
      ****************
       500-ESTATISTICAS.
           DISPLAY BLANK-SCREEN.
           DISPLAY TELA-CADASTRO.
           ACCEPT TELA-CADASTRO.

       500-ESTATISTICAS-FIM.
           DISPLAY "FOI".
           EXIT.

      ************************
      * Rotinas de mensagens *
      ************************
       MSG-ZERA.
           MOVE ZEROS TO TEMPORIZADOR.
       MSG-DISPLAY.
           DISPLAY BLANK-SCREEN.
           DISPLAY TELA-MENSAGENS.
       MSG-TEMPO.
           ADD 1 TO TEMPORIZADOR
           IF TEMPORIZADOR < 3000
               GO TO MSG-TEMPO
           ELSE
               DISPLAY BLANK-SCREEN.
       MSG-FIM.
           MOVE SPACES TO MENSAGEM
           EXIT.
       
      **************************
      * Rotinas de finalização *
      **************************
       ROT-FIM.
           DISPLAY BLANK-SCREEN
           DISPLAY TELA-SAIDA
           CLOSE ARQUIVO.
       ROT-FIM-EXIT.
           EXIT PROGRAM.
       ROT-STOP-RUN.
           STOP RUN.