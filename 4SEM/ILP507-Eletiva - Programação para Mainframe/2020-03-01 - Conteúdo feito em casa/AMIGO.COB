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
       SELECT IN-FILE ASSIGN TO DISK
           FILE STATUS IS ARQUIVO-STATUS
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD  IN-FILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "C:\AMIGO.TXT"
           DATA RECORD IS INPUT-REC.
       01  INPUT-REC.
           05 AMIGO-NOME               PIC X(10).
           05 AMIGO-SOBRENOME          PIC X(10).

       WORKING-STORAGE SECTION.
       
       01 SWITCHES.
           05 EOF-SWITCH               PIC X VALUE "N".
       01 COUNTERS.
           05 REC-COUNTER              PIC 9(3) VALUE 0.
       
       01 ARQUIVO-STATUS               PIC X(2).

       01 WS-MENU-OP                   PIC X.
       
       PROCEDURE DIVISION.
       000-MAIN.
           DISPLAY "------------------------------------------"
           DISPLAY "|        Programinha dos amigos          |"
           DISPLAY "------------------------------------------"
           DISPLAY "     .-::::::-.                           "
           DISPLAY "   .'          '.                         "
           DISPLAY "  /   O      O   \                        "
           DISPLAY " :       ..  `    :    Once upon a time,  "
           DISPLAY " |    .::::::.    |    in 1987...         "
           DISPLAY " :    .------.    :                       "
           DISPLAY "  \  '   ::   '  /                        "
           DISPLAY "   '.    ::    .'                         "
           DISPLAY "     '-.::::.-'"                          "
           DISPLAY "                                          "
           DISPLAY "                                          "
           DISPLAY "1 - Exibir lista de amigos     2 - Cadastrar amigo"
           DISPLAY "9 - Finalizar programa                    "
           DISPLAY "Digite a opcao que voce deseja:           "

           ACCEPT WS-MENU-OP
           IF WS-MENU-OP = 1
               GO TO 100-LER.

           IF WS-MENU-OP = 2
               GO TO 200-GRAVAR.

           IF WS-MENU-OP = 9
               DISPLAY "FIM DO PROGRAMA."
               DISPLAY " "
               STOP RUN.
           DISPLAY ERASE.
           DISPLAY "TA ME TIRANDO?"
           DISPLAY "Eu aqui perdendo o tempo pra descobrir"
           DISPLAY "todas as limitacoes deste compilador"
           DISPLAY "arcaico, que nao aceita acento, ELSE na"
           DISPLAY "estrutura de decisao, nao aceita SCREEN SECTION"
           DISPLAY "e voce digita uma opcao invalida?!?!?"
           DISPLAY "Tem 1, 2 e 9. Escolhe uma opcao!"
           GO TO 000-MAIN.
       
       100-LER.
           DISPLAY ERASE.
           DISPLAY "-------------------------------------------" 
           DISPLAY "Realizando a leitura sequencial do arquivo:"
           DISPLAY "-------------------------------------------"                       
           PERFORM 300-INIT.

           GO TO 000-MAIN.
       200-GRAVAR.
           DISPLAY ERASE.
           DISPLAY "GRAVAR"
           GO TO 000-MAIN.

       300-INIT.
           OPEN I-O IN-FILE.
           DISPLAY "CODIGO DE RETORNO DO ARQUIVO: " ARQUIVO-STATUS.
           DISPLAY " ".                                     
               READ IN-FILE                                               
               MOVE "S" TO EOF-SWITCH.                           
               DISPLAY 'O QUE FOI LIDO : ' INPUT-REC                                     
           CLOSE IN-FILE.