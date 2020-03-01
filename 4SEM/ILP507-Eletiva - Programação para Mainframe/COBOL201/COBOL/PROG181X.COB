       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG181X.
         *  A U T H O R .  DEBORAH PELICER . 
      * MANUTENCAO DO CADASTRO DE AMIGOS  *
      **************************************
      *----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
                         DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT ARQAMIG ASSIGN TO DISK
                    ORGANIZATION IS INDEXED
                    ACCESS MODE  IS DYNAMIC
                     RECORD KEY   IS  I S   A P E L I D O   
                    FILE STATUS  IS ST-ERRO
                    ALTERNATE RECORD KEY IS NOME WITH DUPLICATES.
  * 
 
        * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
       DATA DIVISION.
       FILE SECTION.
       FD ARQAMIG
               LABEL RECORD IS STANDARD
               VALUE OF FILE-ID IS "ARQAMIG.DAT".
       01 REGAMIGO.
                03 APELIDO         PIC X(12).
                03 NOME            PIC X(30).
                03 EMAIL           PIC X(30).
                03 TELEFONE.
                   05 DDD          PIC 9(02).
                   05 NUMERO       PIC 9(09).
                03 DATA_NASCIMENTO.
                    05 DIAN        PIC 9(02).
                    05 MESN        PIC 9(02).
                    05 ANON.
                        07 SECN    PIC 9(02).
                        07 DEZN    PIC 9(02).
                03 TIPO_AMIGO      PIC X(01).
                03 DIAS_VIDAAMIGO  PIC 9(10).
                03 UNID_FEDERACAO  PIC X(02).
                03 FILLER          PIC X(10).
      *
      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.
       01 MASC1        PIC 99.99.9999.
       77 W-SEL        PIC 9(01) VALUE ZEROS.
       77 W-CONT       PIC 9(06) VALUE ZEROS.
       77 W-OPCAO      PIC X(01) VALUE SPACES.
       77 ST-ERRO      PIC X(02) VALUE "00".
       77 W-ACT        PIC 9(02) VALUE ZEROS.
       77 MENS         PIC X(50) VALUE SPACES.
       77 LIMPA        PIC X(50) VALUE SPACES.
       01 TIPOAMIGOX   PIC X(15) VALUE SPACES.
      * 
       01 TABAMIGO.
          03 FILLER PIC X(30) VALUE "FACULDADE      IGREJA".
          03 FILLER PIC X(30) VALUE "BAIRRO         CLUBE".
          03 FILLER PIC X(30) VALUE "BALADA         TRABALHO".
          03 FILLER PIC X(30) VALUE "FAMILIA        EX-NAMORO".
          03 FILLER PIC X(30) VALUE "INIMIGO".
       01 TBAMIGO REDEFINES TABAMIGO.
          03 TPAMI      PIC X(15) OCCURS 10 TIMES.
      * 
      *
       SCREEN SECTION.
       01  TELAAMIGO.
           05  BLANK SCREEN.
           05  LINE 03  COLUMN 01 
               VALUE  "                           CADASTRO DE A".
           05  LINE 03  COLUMN 41 
               VALUE  "MIGOS".
           05  LINE 04  COLUMN 01 
               VALUE  "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
           05  LINE 04  COLUMN 41 
               VALUE  "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
           05  LINE 05  COLUMN 01 
               VALUE  "    ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿".
           05  LINE 06  COLUMN 01 
               VALUE  "    ³  APELIDO               ³".
           05  LINE 07  COLUMN 01 
               VALUE  "    ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ".
           05  LINE 09  COLUMN 01 
               VALUE  "       NOME".
           05  LINE 11  COLUMN 01 
               VALUE  "       EMAIL".
           05  LINE 13  COLUMN 01 
               VALUE  "       TELEFONE (   )".
           05  LINE 15  COLUMN 01 
               VALUE  "       DATA NASCIMENTO".
           05  LINE 17  COLUMN 01 
               VALUE  "       TIPO DE AMIGO".
           05  LINE 19  COLUMN 01 
               VALUE  "       DIAS DE VIDA".
           05  LINE 21  COLUMN 01 
               VALUE  "       UNIDADE DA FEDERA€AO".
           05  LINE 23  COLUMN 01 
               VALUE  "  MENSAGEM".
           05  TAPELIDO
               LINE 06  COLUMN 16  PIC X(12)
               USING  APELIDO
               HIGHLIGHT.
           05  TNOME
               LINE 09  COLUMN 16  PIC X(30)
               USING  NOME
               HIGHLIGHT.
           05  TEMAIL
               LINE 11  COLUMN 16  PIC X(30)
               USING  EMAIL
               HIGHLIGHT.
           05  T-DDD
               LINE 13  COLUMN 18  PIC 999
               USING  DDD
               HIGHLIGHT.
           05  TNUMERO
               LINE 13  COLUMN 23  PIC Z9999.9999
               USING  NUMERO
               HIGHLIGHT.
           05  TDATANASC
               LINE 15  COLUMN 25  PIC XX/XX/XXXX
               USING  DATANASC
               HIGHLIGHT.
           05  TTIPOAMIGO
               LINE 17  COLUMN 25  PIC 9(01)
               USING  TIPOAMIGO
               HIGHLIGHT.
           05  TTIPOAMIGOX
               LINE 17  COLUMN 28  PIC X(15)
               USING  TIPOAMIGOX.
           05  TDIASVIDA
               LINE 19  COLUMN 25  PIC 9(06)
               USING  DIASVIDA
               HIGHLIGHT.
           05  TUF
               LINE 21  COLUMN 30  PIC X(02)
               USING  UF
               HIGHLIGHT.
      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
       INICIO.
      *
       INC-OP0.
           OPEN I-O ARQAMIG
           IF ST-ERRO NOT = "00"
               IF ST-ERRO = "30"
                      OPEN OUTPUT ARQAMIG
                      CLOSE ARQAMIG
                      MOVE "*** ARQUIVO AMIGO SENDO CRIADO **" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-OP0
                   ELSE
                      MOVE "ERRO ABERTURA DO ARQUIVO DE AMIGO"
            TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM
                ELSE
                      NEXT SENTENCE.
       INC-001.
                MOVE ZEROS  TO TELEFONE DATA_NASCIMENTO TIPO_AMIGO
                DIAS_VIDAAMIGO
                MOVE SPACES TO APELIDO NOME EMAIL UNID_FEDERACAO.
                DISPLAY TELAAMIGO.
       INC-002.
                ACCEPT TAPELIDO
                ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                   CLOSE ARQAMIG
                   GO TO ROT-FIM.
                IF APELIDO  = SPACES
                   MOVE "*** APELIDO INVALIDO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-002.
       LER-APELIDO01.
                MOVE 0 TO W-SEL
                READ ARQAMIG
                IF ST-ERRO NOT = "23"
                   IF ST-ERRO = "00"
                      DISPLAY TELAAMIGO
                      MOVE "*** AMIGO JA CADASTRAD0 ***" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      MOVE 1 TO W-SEL
                      GO TO ACE-001
                   ELSE
                      MOVE "ERRO NA LEITURA ARQUIVO AMIGO"   TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM
                ELSE
                   NEXT SENTENCE.
       INC-004.
                ACCEPT TNOME
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-002.
       INC-005.
                ACCEPT TEMAIL
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-004.
       INC-007.
                ACCEPT TDDD
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-005.
       INC-008.
                ACCEPT TNUMERO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-007.
       INC-009.
                ACCEPT TDATA_NASCIMENTO
                MOVE DATANASCT TO MASC1
                DISPLAY (11, 21) MASC1
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-008.
       INC-010.
                ACCEPT TTIPO_AMIGO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT= 02 GO TO INC-009.
                IF TIPO_AMIGO = 0
                      MOVE "TIPO DE AMIGO INCORRETO"   TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-010.       
                MOVE TPAMI(TIPO_AMIGO) TO TIPOAMIGOX
                DISPLAY TTIPOAMIGOX



                IF TIPO_AMIGO = 1
                   MOVE "FACULDADE" TO TIPOAMIGOX
                ELSE
                   IF TIPO_AMIGO = 9
                      MOVE "BALADA" TO TIPOAMIGOX
                   ELSE
                      MOVE "TIPO DE AMIGO INCORRETO"   TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-010.                    
       INC-011.
                ACCEPT (13, 21) DIAS_VIDAAMIGO
                   AUX8 = 0
                   AUX9 = 0
                IF MESATUAL > 2
                COMPUTE AUX9 = ANOATUAL / 4
                COMPUTE AUX9 = AUX9 * 4
                COMPUTE AUX9 = ANOATUAL - AUX9.

                IF MESATUAL = 1
                MOVE 0 TO AUX8
                ELSE

                IF MESATUAL = 2
                MOVE 31 TO AUX8
                ELSE

                IF MESATUAL = 3
                MOVE 59 TO AUX8
                ELSE

                IF MESATUAL = 4
                MOVE 90 TO AUX8
                ELSE

                IF MESATUAL = 5
                MOVE 120 TO AUX8
                ELSE

                IF MESATUAL = 6
                MOVE 151 TO AUX8
                ELSE

                IF MESATUAL = 7
                MOVE 181 TO AUX8
                ELSE

                IF MESATUAL = 8
                MOVE 212 TO AUX8
                ELSE

                IF MESATUAL = 9
                MOVE 243 TO AUX8
                ELSE

                IF MESATUAL = 10
                MOVE 273 TO AUX8
                ELSE

                IF MESATUAL = 11
                MOVE 304 TO AUX8
                ELSE

                MOVE 334 TO AUX8

               COMPUTE AUX9 = ((ANOATUAL - 1) * 365,25) + AUX8 + MESATUAL + AUX9

                IF W-ACT= 02 GO TO INC-010.
       INC-012.
                ACCEPT TUNID_FEDERACAO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT= 02 GO TO INC-011.
      *
                IF W-SEL = 1
                              GO TO ALT-OPC.

       INC-OPC.
                MOVE "S" TO W-OPCAO
                DISPLAY (23, 40) "DADOS OK (S/N) : ".
                ACCEPT (23, 57) W-OPCAO WITH UPDATE
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-005.
                IF W-OPCAO = "N" OR "n"
                   MOVE "*** DADOS RECUSADOS PELO OPERADOR ***" TO MENS
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
                      MOVE "*** AMIGO JA EXISTE ***" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-001
                ELSE
                      MOVE "ERRO NA GRAVACAO DO ARQUIVO DE AMIGO"
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
                DELETE AMIGO RECORD
                IF ST-ERRO = "00"
                   MOVE "* REGISTRO EXCLUIDO * " TO MENS
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
                MOVE "ERRO NA EXCLUSAO DO REGISTRO AMIGO"   TO MENS
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
                IF W-CONT < 1500
                   GO TO ROT-MENS2
                ELSE
                   DISPLAY (23, 12) LIMPA.
       ROT-MENS-FIM.
                EXIT.
       FIM-ROT-TEMPO.
