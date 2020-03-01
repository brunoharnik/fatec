       IDENTIFICATION DIVISION.
       PROGRAM-ID. CEP001.
       AUTHOR. ANGELO.
      **************************************
      * MANUTENCAO DO CADASTRO DE PRODUTO  *
      **************************************
      *----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
                         DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT PRODUTO ASSIGN TO DISK
                    ORGANIZATION IS INDEXED
                    ACCESS MODE  IS DYNAMIC
                    RECORD KEY   IS CODPRO
                    FILE STATUS  IS ST-ERRO
                    ALTERNATE RECORD KEY IS CHAVE2 = DESCR
                                                      WITH DUPLICATES.
      *
      *-----------------------------------------------------------------
       DATA DIVISION.
       FILE SECTION.
       FD PRODUTO
               LABEL RECORD IS STANDARD
               VALUE OF FILE-ID IS "PRODUTO.DAT".
       01 REGPRO.
                03 CODPRO          PIC 9(06).
                03 DESCR           PIC X(30).
                03 UNID            PIC X(02).
                03 QUANT           PIC 9(05)V9.
                03 PRECMD          PIC 9(06)V999.
                03 VRESTOQ         PIC 9(10)v99.
                03 FUNCIONARIO     PIC X(30).
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
      *
       SCREEN SECTION.
       01  TCEP001.
           05  BLANK SCREEN.
           05  LINE 01  COLUMN 01
               VALUE  "зддддддддддддддддддддддддддддддддддддддд".
           05  LINE 01  COLUMN 41
               VALUE  "ддддддддддддддддддддддддддддддддддддддд©".
           05  LINE 02  COLUMN 01
               VALUE  "Ё                           CADASTRO DE".
           05  LINE 02  COLUMN 41
               VALUE  "PRODUTO                                Ё".
           05  LINE 03  COLUMN 01
               VALUE  "цддддддддддддддддддддддддддддддддддддддд".
           05  LINE 03  COLUMN 41
               VALUE  "ддддддддддддддддддддддддддддддддддддддд╢".
           05  LINE 04  COLUMN 01
               VALUE  "Ё".
           05  LINE 04  COLUMN 41
               VALUE  "                                       Ё".
           05  LINE 05  COLUMN 01
               VALUE  "Ё       зддддддддддддддддд©".
           05  LINE 05  COLUMN 41
               VALUE  "                                       Ё".
           05  LINE 06  COLUMN 01
               VALUE  "Ё       Ё CODIGO          Ё".
           05  LINE 06  COLUMN 41
               VALUE  "                                       Ё".
           05  LINE 07  COLUMN 01
               VALUE  "Ё       юддддддддддддддддды".
           05  LINE 07  COLUMN 41
               VALUE  "                                       Ё".
           05  LINE 08  COLUMN 01
               VALUE  "Ё       зддддддддддддддддддддддддддддддд".
           05  LINE 08  COLUMN 41
               VALUE  "дддддддддддд©                          Ё".
           05  LINE 09  COLUMN 01
               VALUE  "Ё       Ё DESCRICAO".
           05  LINE 09  COLUMN 41
               VALUE  "            Ё                          Ё".
           05  LINE 10  COLUMN 01
               VALUE  "Ё       юддддддддддддддддддддддддддддддд".
           05  LINE 10  COLUMN 41
               VALUE  "дддддддддддды                          Ё".
           05  LINE 11  COLUMN 01
               VALUE  "Ё      здддддддддддддддд©".
           05  LINE 11  COLUMN 41
               VALUE  "                                       Ё".
           05  LINE 12  COLUMN 01
               VALUE  "Ё      Ё  UNIDADE       Ё".
           05  LINE 12  COLUMN 41
               VALUE  "                                       Ё".
           05  LINE 13  COLUMN 01
               VALUE  "Ё      юдддддддддддддддды".
           05  LINE 13  COLUMN 41
               VALUE  "                                       Ё".
           05  LINE 14  COLUMN 01
               VALUE  "Ёздддддддддддддддддддбдддддддддддддддддд".
           05  LINE 14  COLUMN 41
               VALUE  "ддддддбдддддддддддддддддддддддддддддд© Ё".
           05  LINE 15  COLUMN 01
               VALUE  "ЁЁQUANTIDADE         Ё PRECO MEDIO".
           05  LINE 15  COLUMN 41
               VALUE  "      Ё VALOR ESTOQUE                Ё Ё".
           05  LINE 16  COLUMN 01
               VALUE  "Ёюдддддддддддддддддддадддддддддддддддддд".
           05  LINE 16  COLUMN 41
               VALUE  "ддддддадддддддддддддддддддддддддддддды Ё".
           05  LINE 17  COLUMN 01
               VALUE  "Ё       зддддддддддддддддддддддддддддддд".
           05  LINE 17  COLUMN 41
               VALUE  "ддддддддддддд©                         Ё".
           05  LINE 18  COLUMN 01
               VALUE  "Ё       Ё FUNCIONARIO".
           05  LINE 18  COLUMN 41
               VALUE  "             Ё                         Ё".
           05  LINE 19  COLUMN 01
               VALUE  "Ё       юддддддддддддддддддддддддддддддд".
           05  LINE 19  COLUMN 41
               VALUE  "ддддддддддддды                         Ё".
           05  LINE 20  COLUMN 01
               VALUE  "Ё".
           05  LINE 20  COLUMN 41
               VALUE  "                                       Ё".
           05  LINE 21  COLUMN 01
               VALUE  "Ё".
           05  LINE 21  COLUMN 41
               VALUE  "                                       Ё".
           05  LINE 22  COLUMN 01
               VALUE  "Ё".
           05  LINE 22  COLUMN 41
               VALUE  "                                       Ё".
           05  LINE 23  COLUMN 01
               VALUE  "ЁMENSAGEM :".
           05  LINE 23  COLUMN 41
               VALUE  "                                       Ё".
           05  LINE 24  COLUMN 01
               VALUE  "юддддддддддддддддддддддддддддддддддддддд".
           05  LINE 24  COLUMN 41
               VALUE  "ддддддддддддддддддддддддддддддддддддддды".
           05  TCODPRO
               LINE 06  COLUMN 18  PIC 999.999
               USING  CODPRO
               HIGHLIGHT.
           05  TDESCR
               LINE 09  COLUMN 21  PIC X(30)
               USING  DESCR
               HIGHLIGHT.
           05  TUNID
               LINE 12  COLUMN 20  PIC X(02)
               USING  UNID
               HIGHLIGHT.
           05  TQUANT
               LINE 15  COLUMN 14  PIC ZZZZ9,9
               USING  QUANT
               HIGHLIGHT.
           05  TPRECMD
               LINE 15  COLUMN 36  PIC ZZZZZ9.999
               USING  PRECMD
               HIGHLIGHT.
           05  TVRESTOQ
               LINE 15  COLUMN 63  PIC ZZZ.ZZZ.ZZ9,99
               USING  VRESTOQ
               HIGHLIGHT.
           05  TFUNC
               LINE 18  COLUMN 23  PIC X(30)
               USING  FUNCIONARIO
               HIGHLIGHT.
      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
       INICIO.
      *
       INC-OP0.
           OPEN I-O PRODUTO
           IF ST-ERRO NOT = "00"
               IF ST-ERRO = "30"
                      OPEN OUTPUT PRODUTO
                      CLOSE PRODUTO
                      MOVE "*** ARQUIVO PRODUTO SENDO CRIADO **" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-OP0
                   ELSE
                      MOVE "ERRO NA ABERTURA DO ARQUIVO PRODTUO" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM
                ELSE
                    NEXT SENTENCE.
       INC-001.
                MOVE ZEROS  TO CODPRO QUANT PRECMD VRESTOQ
                MOVE SPACES TO DESCR UNID.
                DISPLAY TCEP001.
       INC-002.
                ACCEPT  TCODPRO
                ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                   CLOSE PRODUTO
                   GO TO ROT-FIM.
                IF CODPRO  = 0
                   MOVE "*** PRODUTO INVALIDO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-002.
       LER-PRODUTO01.
                MOVE 0 TO W-SEL
                READ PRODUTO
                IF ST-ERRO NOT = "23"
                   IF ST-ERRO = "00"
                      DISPLAY TCEP001
                      MOVE "*** PRODUTO JA CADASTRAD0 ***" TO MENS
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
                ACCEPT TDESCR
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-002.
       INC-004.
                ACCEPT TUNID
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-003.
       INC-005.
                ACCEPT TQUANT
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-004.
       INC-006.
                ACCEPT TPRECMD
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-005.
       INC-007.
                COMPUTE VRESTOQ = QUANT * PRECMD
                DISPLAY TVRESTOQ.
       INC-008.
                ACCEPT TFUNCIONARIO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT= 02 GO TO INC-006.
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
                WRITE REGPRO
                IF ST-ERRO = "00" OR "02"
                      MOVE "*** DADOS GRAVADOS *** " TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-001.
                IF ST-ERRO = "22"
                      MOVE "*** PRODUTO JA EXISTE ***       " TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-001
                ELSE
                      MOVE "ERRO NA GRAVACAO DO ARQUIVO DE PRODUTO"
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
                DELETE PRODUTO RECORD
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
                REWRITE REGPRO
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
                IF W-CONT < 3000
                   GO TO ROT-MENS2
                ELSE
                   DISPLAY (23, 12) LIMPA.
       ROT-MENS-FIM.
                EXIT.
       FIM-DE-PROGRAMA.