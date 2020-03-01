       IDENTIFICATION DIVISION.
       PROGRAM-ID. P18204.
       AUTHOR. JAMES WANDER FERREIRA DE SOUZA JUNIOR.
      **************************************
      * MANUTENCAO DO CADASTRO DE AMIGOS *
      **************************************
      *----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
                         DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT AMIGOS ASSIGN TO DISK
                    ORGANIZATION IS INDEXED
                    ACCESS MODE  IS DYNAMIC
                    RECORD KEY   IS AMIGO-APELIDO
                    FILE STATUS  IS ST-ERRO
                    ALTERNATE RECORD KEY IS AMIGO-NOME
                                            WITH DUPLICATES.
      *
      *-----------------------------------------------------------------
       DATA DIVISION.
       FILE SECTION.
       FD AMIGOS
               LABEL RECORD IS STANDARD
               VALUE OF FILE-ID IS "AMIGO.DAT".
       01 REGAMIGO.
                03 AMIGO-APELIDO     PIC X(12).
                03 AMIGO-NOME        PIC X(30).
                03 AMIGO-EMAIL       PIC X(30).
                03 AMIGO-TELEFONE.
                    05 AMIGO-DDD     PIC 9(02).
                    05 AMIGO-NUMTEL  PIC 9(09).
                03 AMIGO-DATANASC.
                    05 AMIGO-DIA     PIC 9(02).
                    05 AMIGO-MES     PIC 9(02).
                    05 AMIGO-ANO.
                        07 AMIGO-SEC PIC 9(02).
                        07 AMIGO-DEC PIC 9(02).
                    05 AMIGO-SEXO    PIC X(01).
                    05 AMIGO-TIPO    PIC 9(01).
      *
      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.
       77 W-SEL        PIC 9(01) VALUE ZEROS.
       77 W-CONT       PIC 9(06) VALUE ZEROS.
       77 W-OPCAO      PIC X(01) VALUE SPACES.
       77 ST-ERRO      PIC X(02) VALUE "00".
       77 W-ACT        PIC 9(02) VALUE ZEROS.
       77 MENS         PIC X(50) VALUE SPACES.
       77 LIMPA        PIC X(50) VALUE SPACES.
       01 TSEXOAMI     PIC X(12) VALUE SPACES.
       01 TTIPOAMI     PIC X(12) VALUE SPACES.
      *
       01 TABAMIGO.
          03 T1 PIC X(48) VALUE
          "IGREJA      FACULDADE   CLUBE       BALADA    ".
          03 T2 PIC X(48) VALUE
          "BAIRRO      INTIMO      COLEGIO     FAMILIA   ".
          03 T3 PIC X(12) VALUE "EX NAMORADO ".
          03 T4 PIC X(12) VALUE "INIMIGO".
           
       01 TABAUX REDEFINES TABAMIGO.
           03 TDA        PIC X(12) OCCURS 10 TIMES. 
      *---------------------------------------------------------
       SCREEN SECTION.
       01  TELAAMIGO.
           05  BLANK SCREEN.
           05  LINE 01  COLUMN 01
               VALUE  "|---------------------------------------".
           05  LINE 01  COLUMN 41
               VALUE  "---------------------------------------|".
           05  LINE 02  COLUMN 01
               VALUE  "|                            CADASTRO DE".
           05  LINE 02  COLUMN 41
               VALUE  " AMIGOS                                |".
           05  LINE 03  COLUMN 01
               VALUE  "|".
           05  LINE 03  COLUMN 41
               VALUE  "                                       |".
           05  LINE 04  COLUMN 01
               VALUE  "|".
           05  LINE 04  COLUMN 41
               VALUE  "                                       |".
           05  LINE 05  COLUMN 01
               VALUE  "|   APELIDO".
           05  LINE 05  COLUMN 41
               VALUE  "                                       |".
           05  LINE 06  COLUMN 01
               VALUE  "|".
           05  LINE 06  COLUMN 41
               VALUE  "                                       |".
           05  LINE 07  COLUMN 01
               VALUE  "|   NOME".
           05  LINE 08  COLUMN 01
               VALUE  "|".
           05  LINE 09  COLUMN 01
               VALUE  "|   EMAIL".
           05  LINE 10  COLUMN 01
               VALUE  "|".
           05  LINE 11  COLUMN 01
               VALUE  "|   TELEFONE            (  )".
           05  LINE 12  COLUMN 01
               VALUE  "|".
           05  LINE 13  COLUMN 01
               VALUE  "|   DATA DE NASCIMENTO".
           05  LINE 14  COLUMN 01
               VALUE  "|".
           05  LINE 15  COLUMN 01
               VALUE  "|   SEXO ".
           05  LINE 16  COLUMN 01
               VALUE  "|".
           05  LINE 17  COLUMN 01
               VALUE  "|   TIPO DE AMIGO ".
           05  LINE 17  COLUMN 41
               VALUE  "                                       |".
           05  LINE 18  COLUMN 01
               VALUE  "|".
           05  LINE 18  COLUMN 41
               VALUE  "                                       |".
           05  LINE 19  COLUMN 01
               VALUE  "|".
           05  LINE 19  COLUMN 41
               VALUE  "                                       |".
           05  LINE 20  COLUMN 01
               VALUE  "|".
           05  LINE 20  COLUMN 41
               VALUE  "                                       |".
           05  LINE 21  COLUMN 01
               VALUE  "|".
           05  LINE 21  COLUMN 41
               VALUE  "                                       |".
           05  LINE 22  COLUMN 01
               VALUE  "|".
           05  LINE 22  COLUMN 41
               VALUE  "                                       |".
           05  LINE 23  COLUMN 01
               VALUE  "|   MENSAGEM".
           05  LINE 23  COLUMN 41
               VALUE  "                                       |".
           05  LINE 24  COLUMN 01
               VALUE  "|_______________________________________".
           05  LINE 24  COLUMN 41
               VALUE  "_______________________________________|".
           05  TAPELIDO
               LINE 05  COLUMN 25  PIC X(12)
               USING  AMIGO-APELIDO
               HIGHLIGHT.
           05  TNOME
               LINE 07  COLUMN 25  PIC X(30)
               USING  AMIGO-NOME
               HIGHLIGHT.
           05  TEMAIL
               LINE 09  COLUMN 25  PIC X(30)
               USING  AMIGO-EMAIL
               HIGHLIGHT.
           05  TDDD
               LINE 11  COLUMN 26  PIC 9(02)
               USING  AMIGO-DDD
               HIGHLIGHT.
           05  TTELEFONE
               LINE 11  COLUMN 30  PIC Z99999999
               USING  AMIGO-NUMTEL
               HIGHLIGHT.
           05  TDATANASC
               LINE 13  COLUMN 25  PIC XX/XX/XXXX
               USING  AMIGO-DATANASC
               HIGHLIGHT.
           05  TSEXO
               LINE 15  COLUMN 25  PIC X(01)
               USING  AMIGO-SEXO
               HIGHLIGHT.
           05  TTSEXO
               LINE 15  COLUMN 27  PIC X(12)
               USING  TSEXOAMI
               HIGHLIGHT.
           05  TAMIGO
               LINE 17  COLUMN 25  PIC X(01)
               USING  AMIGO-TIPO
               HIGHLIGHT.
           05  TTTIPOAMI
               LINE 17  COLUMN 27  PIC X(12)
               USING  TTIPOAMI
               HIGHLIGHT.
      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
       INICIO.
      *
       INC-OP0.
           OPEN I-O AMIGOS
           IF ST-ERRO NOT = "00"
               IF ST-ERRO = "30"
                      OPEN OUTPUT AMIGOS
                      MOVE "*** ARQUIVO PRODUTO SENDO CRIADO **" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      CLOSE AMIGOS
                      GO TO INC-OP0
                   ELSE
                      MOVE "ERRO NA ABERTURA DO ARQUIVO AMIGOS" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM
                ELSE
                    NEXT SENTENCE.
       INC-001.
                MOVE ZEROS  TO AMIGO-DDD AMIGO-NUMTEL AMIGO-DATANASC
                               AMIGO-TIPO
                MOVE SPACES TO AMIGO-NOME AMIGO-APELIDO AMIGO-EMAIL
                               AMIGO-SEXO
                DISPLAY TELAAMIGO.

       INC-002.
                ACCEPT TAPELIDO
                ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                   CLOSE AMIGOS
                   GO TO ROT-FIM.
                IF AMIGO-APELIDO = SPACES
                   MOVE "*** APELIDO INVALIDO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-002.
       LER-AMIGOS.
                MOVE 0 TO W-SEL
                READ AMIGOS
                IF ST-ERRO NOT = "23"
                   IF ST-ERRO = "00"
                      DISPLAY TELAAMIGO
                      MOVE "*** AMIGO JA CADASTRAD0 ***" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      MOVE 1 TO W-SEL
                      GO TO ACE-001
                   ELSE
                      MOVE "ERRO NA LEITURA ARQUIVO PRODUTO"   TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM
                ELSE
                   NEXT SENTENCE.
       INC-003.
                ACCEPT TNOME
                ACCEPT W-ACT FROM ESCAPE KEY
                IF AMIGO-NOME = SPACES
                     MOVE "****PREENCHA O NOME DO AMIGO****" TO MENS
                     PERFORM ROT-MENS THRU ROT-MENS-FIM
                     GO TO INC-003
                IF W-ACT = 02 GO TO INC-004.
       INC-004.
                ACCEPT TEMAIL
                ACCEPT W-ACT FROM ESCAPE KEY
                IF AMIGO-EMAIL = SPACES
                    MOVE "****PREENCHA O EMAIL DO AMIGO****" TO MENS
                    PERFORM ROT-MENS THRU ROT-MENS-FIM
                    GO TO INC-004
                IF W-ACT = 02 GO TO INC-005.
       INC-005.
                ACCEPT  TDDD
                ACCEPT W-ACT FROM ESCAPE KEY
                IF AMIGO-DDD = ZEROS
                    MOVE "****PREENCHA O DDD DO AMIGO****" TO MENS
                    PERFORM ROT-MENS THRU ROT-MENS-FIM
                    GO TO INC-005
                IF W-ACT = 02 GO TO INC-006.
       INC-006.
                ACCEPT  TTELEFONE
                ACCEPT W-ACT FROM ESCAPE KEY
                IF AMIGO-TELEFONE = ZEROS
                    MOVE "****PREENCHA O TELEFONE DO AMIGO****" TO MENS
                    PERFORM ROT-MENS THRU ROT-MENS-FIM
                    GO TO INC-006
                IF W-ACT = 02 GO TO INC-007.
       INC-007.
                ACCEPT  TDATANASC
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT= 02 GO TO INC-006.
       INC-008.
                ACCEPT  TSEXO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT= 02 GO TO INC-007.
                IF AMIGO-SEXO = "M" OR "m"
                   MOVE "MASCULINO" TO TSEXOAMI
                ELSE
                   IF AMIGO-SEXO NOT = "F" AND "f"
                     MOVE "SEXO DO AMIGO INCORRETO" TO MENS
                     PERFORM ROT-MENS THRU ROT-MENS-FIM
                     GO TO INC-008
                   ELSE
                     MOVE "FEMININO" TO TSEXOAMI.
                DISPLAY TELAAMIGO.
       INC-009.
                ACCEPT  TAMIGO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT= 02 GO TO INC-008.
      *
                IF W-SEL = 1
                              GO TO ALT-OPC.
                MOVE TDA(AMIGO-TIPO) TO TTIPOAMI
                DISPLAY TELAAMIGO.
       INC-OPC.
                MOVE "S" TO W-OPCAO
                DISPLAY (23, 40) "DADOS OK (S/N) : ".
                ACCEPT (23, 57) W-OPCAO WITH UPDATE
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-009.
                IF W-OPCAO = "N" OR "n"
                   MOVE "*** DADOS RECUSADOS PELO USUARIO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-001.
                IF W-OPCAO NOT = "S" AND "s"
                   MOVE "*** DIGITE APENAS S=SIM e N=NAO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-OPC.
       INC-WR1.
                WRITE REGAMIGO
                IF ST-ERRO = "00" OR "02"
                      MOVE "*** DADOS GRAVADOS *** " TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-001.
                IF ST-ERRO = "22"
                      MOVE "*** AMIGO JA EXISTE ***       " TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-001
                ELSE
                      MOVE "ERRO NA GRAVACAO DO ARQUIVO DE AMIGOS"
                                                       TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM.
      *
      *****************************************
      * ROTINA DE CONSULTA/ALTERACAO/EXCLUSAO *
      *****************************************
      *
       ACE-001.
                DISPLAY (23, 12)
                     "F1=NOVO REGISTRO   F2=ALTERAR   F3=EXCLUIR"
                ACCEPT (23, 55) W-OPCAO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT NOT = 02 AND W-ACT NOT = 03 AND W-ACT NOT = 04
                   GO TO ACE-001.
                MOVE SPACES TO MENS
                DISPLAY (23, 12) MENS
                IF W-ACT = 02
                   MOVE 02 TO W-SEL
                   GO TO INC-001.
                IF W-ACT = 03
                   GO TO INC-003.
      *
       EXC-OPC.
                DISPLAY (23, 40) "EXCLUIR   (S/N) : ".
                ACCEPT (23, 57) W-OPCAO
                IF W-OPCAO = "N" OR "n"
                   MOVE "*** REGISTRO NAO EXCLUIDO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-001.
                IF W-OPCAO NOT = "S" AND "s"
                   MOVE "*** DIGITE APENAS S=SIM  e  N=NAO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO EXC-OPC.
       EXC-DL1.
                DELETE AMIGOS RECORD
                IF ST-ERRO = "00"
                   MOVE "*** REGISTRO EXCLUIDO ***           " TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-001.
                MOVE "ERRO NA EXCLUSAO DO REGISTRO "   TO MENS
                PERFORM ROT-MENS THRU ROT-MENS-FIM
                GO TO ROT-FIM.
      *
       ALT-OPC.
                DISPLAY (23, 40) "ALTERAR  (S/N) : ".
                ACCEPT (23, 57) W-OPCAO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-005.
                IF W-OPCAO = "N" OR "n"
                   MOVE "*** INFORMACOES NAO ALTERADAS *** " TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-001.
                IF W-OPCAO NOT = "S" AND "s"
                   MOVE "*** DIGITE APENAS S=SIM  e  N=NAO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO ALT-OPC.
       ALT-RW1.
                REWRITE REGAMIGO
                IF ST-ERRO = "00" OR "02"
                   MOVE "*** REGISTRO ALTERADO ***         " TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-001.
                MOVE "ERRO NA EXCLUSAO DO REGISTRO PRODUTO"   TO MENS
                PERFORM ROT-MENS THRU ROT-MENS-FIM
                GO TO ROT-FIM.
      *
      **********************
      * ROTINA DE FIM      *
      **********************
      *
       ROT-FIM.
                DISPLAY (01, 01) ERASE
                EXIT PROGRAM.
       ROT-FIMP.
                EXIT PROGRAM.

       ROT-FIMS.
                STOP RUN.
      *
      **********************
      * ROTINA DE MENSAGEM *
      **********************
      *
       ROT-MENS.
                MOVE ZEROS TO W-CONT.
       ROT-MENS1.
               DISPLAY (23, 12) MENS.
       ROT-MENS2.
                ADD 1 TO W-CONT
                IF W-CONT < 1000
                   GO TO ROT-MENS2
                ELSE
                   DISPLAY (23, 12) LIMPA.
       ROT-MENS-FIM.
                EXIT.
       ROT-ALFA-FIM.
