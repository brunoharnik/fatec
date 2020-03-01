      ******************************************************************
      * Author: Bruno Bega Harnik
      * Date: `
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAD_AMIGO.
       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT IN-FILE ASSIGN TO "AMIGOS.DAT"
                   ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
           FILE SECTION.
               FD IN-FILE.
               01 IN-RECORD.
                   05 AMIGO-NOME       PIC A(20).
                   05 AMIGO-SOBRENOME  PIC A(20).
                   05 AMIGO-APELIDO    PIC X(20).
                   05 AMIGO-TELEFONE   PIC S9(20).
                   05 AMIGO-NASCIMENTO PIC 9(8).
       WORKING-STORAGE SECTION.
           77 WS-MENU PIC 9(1).
           77 WS-NUML PIC 999.
           77 WS-NUMC PIC 999.

           77 COR-FUNDO PIC 9 VALUE 1.
           77 COR-FRENTE PIC 9 VALUE 6.

           01 AMIGO.
               05 NOME         PIC A(20).
               05 SOBRENOME    PIC A(20).
               05 APELIDO      PIC X(20).
               05 TELEFONE     PIC S9(20).
               05 NASCIMENTO.
                   10 DIA      PIC XX.
                   10 MES      PIC XX.
                   10 ANO      PIC X(4).

           COPY screenio.
       SCREEN SECTION.
           01 SS-MENU BACKGROUND-COLOR 2.
               05 BLANK SCREEN.
               05 VALUE "Menu principal"               LINE 1 COL 1.
               05 VALUE "opcao: "                      LINE 2 COL 1.
               05 MENU-INPUT                           lINE 3 COL 1
                   PIC 9(1)    USING WS-MENU.

           01 SS-GRAVAR BACKGROUND-COLOR 3.
               05 BLANK SCREEN.
               05 VALUE "GRAVAR"                       LINE 1 COL 1.

           01 SS-LER BACKGROUND-COLOR 4.
               05 BLANK SCREEN.
               05 VALUE "LER"                          LINE 1 COL 1.
       PROCEDURE DIVISION.
       000-MAIN.
           SET ENVIRONMENT 'COB_SCREEN_EXCEPTIONS' TO 'Y'.
           SET ENVIRONMENT 'COB_SCREEN_ESC' TO 'Y'.
           SET ENVIRONMENT 'ESCDELAY' TO '25'.
           DISPLAY SS-MENU
           ACCEPT SS-MENU
           EVALUATE WS-MENU
               WHEN 1
                   PERFORM 100-LER
               WHEN 2
                   PERFORM 200-GRAVAR
               WHEN 9
                   DISPLAY "Fim do programa"
               WHEN OTHER
                   PERFORM 000-MAIN
           END-EVALUATE.
       100-lER.
           DISPLAY SS-LER
           PERFORM 000-MAIN.
       200-GRAVAR.
           DISPLAY SS-GRAVAR
           PERFORM 000-MAIN.
       STOP RUN.
       END PROGRAM CAD_AMIGO.
