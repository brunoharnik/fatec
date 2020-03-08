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
       
      *************************
      * Variáveis de trabalho *
      *************************
       WORKING-STORAGE SECTION.  
       77 STATUS-ARQUIVO           PIC X(02).
       77 MENSAGEM                 PIC X(50) VALUE SPACES.
       77 TEMPORIZADOR             PIC 9(06) VALUE ZEROS.

       01 MASC1        PIC Z9,99.

       77 W-SEL        PIC 9(01) VALUE ZEROS.
       77 W-OPCAO      PIC X(01) VALUE SPACES.
       77 W-ACT        PIC 9(02) VALUE ZEROS.
       77 LIMPA        PIC X(50) VALUE SPACES.
       
      *********
      * Telas *
      *********
       SCREEN SECTION.
       01 TELA-MENSAGENS.
        05. BLANK SCREEN.
        05. VALUE "****************************************************"
           BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 10 COLUMN 16.
        05. VALUE "*                                                  *"
           BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 11 COLUMN 16.
        05. VALUE "*"
           BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 12 COLUMN 16.
        05. PIC X(50) FROM MENSAGEM
           BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 12 COLUMN 17.
        05. VALUE "*"
           BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 12 COLUMN 67.
        05. VALUE "*                                                  *"                                               
           BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 13 COLUMN 16.
        05. VALUE "****************************************************"
           BACKGROUND-COLOR 12 FOREGROUND-COLOR 14 LINE 14 COLUMN 16.

       PROCEDURE DIVISION.
       INICIO.

       000-ABERTURA.
           OPEN I-O ARQUIVO
           IF STATUS-ARQUIVO NOT = "00"
               IF STATUS-ARQUIVO = "30"
               OPEN OUTPUT ARQUIVO
               MOVE "              Arquivo sendo criado..."
                   TO MENSAGEM
               PERFORM MSG-ZERA THRU MSG-FIM
               CLOSE ARQUIVO
               GO TO 000-ABERTURA
               ELSE
               MOVE "Erro na abertura do arquivo."
                   TO MENSAGEM
               PERFORM MSG-ZERA THRU MSG-FIM
               GO TO ROT-FIM.

       001-ZERA-VARS.
           MOVE ZEROS  TO MATRICULA NOTA1 NOTA2 
           MOVE SPACES TO NOME.


      ************************
      * Rotinas de mensagens *
      ************************
       MSG-ZERA.
           MOVE ZEROS TO TEMPORIZADOR.
       MSG-1.
           DISPLAY TELA-MENSAGENS.
       MSG-2.
           ADD 1 TO TEMPORIZADOR
           IF TEMPORIZADOR < 6000
               GO TO MSG-2
           ELSE
               DISPLAY (23, 12) LIMPA.
       MSG-FIM.
                EXIT.
       
      **************************
      * Rotinas de finalização *
      **************************
       ROT-FIM.
                DISPLAY (01, 01) ERASE
                EXIT PROGRAM.
       ROT-FIMP.
                EXIT PROGRAM.

       ROT-FIMS.
                STOP RUN.