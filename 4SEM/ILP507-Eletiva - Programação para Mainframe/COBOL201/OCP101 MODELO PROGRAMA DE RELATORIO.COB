       IDENTIFICATION DIVISION.
       PROGRAM-ID. OCP101.
      *************************************
      * RELATORIO DE GRUPO DE CONTAS      *
      *************************************
      *----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
                    DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *
           SELECT OCA001   ASSIGN TO DISK
               ORGANIZATION IS INDEXED
               ACCESS MODE  IS DYNAMIC
               RECORD KEY   IS OCK00101
               FILE STATUS  IS ST-ERRO
               ALTERNATE RECORD KEY IS OCC00102 WITH DUPLICATES.
           SELECT ARQIMP ASSIGN TO PRINTER.
      *
      *-----------------------------------------------------------------
       DATA DIVISION.
       FILE SECTION.
      *
       COPY OCA001.BOK.
      *
       FD ARQIMP
             LABEL RECORD IS OMITTED.
       01 REGIMP        PIC X(80).
      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.
       01 W-SEL        PIC 9(01) VALUE ZEROS.
       01 W-CONT       PIC 9(04) VALUE ZEROS.
       01 W-OPCAO      PIC X(01) VALUE SPACES.
       01 ST-ERRO      PIC X(02) VALUE "00".
       01 W-ACT        PIC 9(02) VALUE ZEROS.
       01 MENS         PIC X(50) VALUE SPACES.
       01 LIMPA        PIC X(50) VALUE SPACES.
       01 W-SOLIC      PIC X(15) VALUE SPACES.
       01 W-OCA001     PIC X(40) VALUE "OCA001.DAT                    ".
       01 CONLIN       PIC 9(03) VALUE ZEROS.
       01 CONPAG       PIC 9(03) VALUE ZEROS.
       01 W-EMPRESA    PIC X(20) VALUE "ACOTECNICA S/A I.C.".
       01 OCW10101     PIC 9(01) VALUE 1.
      *-----------------------------------------------------------------
      *              *** CAMPOS PARA TRATAMENTO DE DATA ***
       01 DATA-EQ.
          03 ANO-EQ    PIC 99.
          03 MES-EQ    PIC 99.
          03 DIA-EQ    PIC 99.
       01 DATA-N.
          03 DIA       PIC 99.
          03 MES       PIC 99.
          03 ANO       PIC 99.
       01 DATA-INV.
          03 ANO-INV   PIC 99.
          03 MES-INV   PIC 99.
          03 DIA-INV   PIC 99.
       01 DATA-FOR.
          03 DIA-FOR   PIC 99.
          03 BR1-FOR   PIC X(01) VALUE "/".
          03 MES-FOR   PIC 99.
          03 BR2-FOR   PIC X(01) VALUE "/".
          03 ANO-FOR   PIC 99.
       01 W-01         PIC 9(04).
       01 FLAG1        PIC 9(01).
      *-----------------------------------------------------------------
      *
      ******************
      * REPORT SECTION *
      ******************
      *
       01 CAB1.
          03 CAB11      PIC X(20) VALUE "ACOTECNICA S/A I.C.".
          03 CAB12      PIC X(02) VALUE SPACES.
          03 CAB13      PIC X(28) VALUE "RELACAO DE CENTRO DE CUSTO ".
          03 CAB14      PIC X(03) VALUE SPACES.
          03 CAB15      PIC X(07) VALUE "DATA : ".
          03 CAB16      PIC X(08).
          03 CAB17      PIC X(09) VALUE "   PAG.: ".
          03 CAB18      PIC ZZ9   VALUE ZEROS.
       01 CAB2.
          03 CAB21      PIC X(14) VALUE "SOLICITANTE : "
          03 CAB22      PIC X(15) VALUE SPACES.
          03 CAB23      PIC X(05) VALUE SPACES.
          03 CAB24      PIC X(40) VALUE "ORDEM DE CODIGO".
          03 CAB29      PIC X(06) VALUE "OCP101".
       01 CAB3.
          03 CAB31     PIC X(06) VALUE "CODIGO".
          03 FILLER    PIC X(02) VALUE SPACES.
          03 CAB32     PIC X(35) VALUE "       DENOMINACAO".
          03 FILLER    PIC X(01) VALUE SPACES.
          03 CAB33     PIC X(13) VALUE "             ".
          03 FILLER    PIC X(02) VALUE SPACES.
          03 CAB34     PIC X(19) VALUE "                   ".
       01 TRSIM         PIC X(80) VALUE ALL "-".
       01 TRDUP         PIC X(80) VALUE ALL "=".
       01 DET2.
          03 FILLER    PIC X(02) VALUE SPACES.
          03 DET21     PIC 9(02) VALUE ZEROS.
          03 FILLER    PIC X(04) VALUE SPACES.
          03 DET22     PIC X(40) VALUE SPACES.
          03 FILLER    PIC X(03) VALUE SPACES.
          03 DET23     PIC X(05) VALUE SPACES.
          03 FILLER    PIC X(02) VALUE SPACES.
          03 DET24     PIC X(19) VALUE SPACES.
      *
      ******************
      * ROTINA DE TELA *
      ******************
      *
       SCREEN SECTION.
       01  OCT101.
           05  BLANK SCREEN.
           05  LINE 01  COLUMN 01
               VALUE  "ษอออออออออออออออออออออออออออออออออออออออ".
           05  LINE 01  COLUMN 41
               VALUE  "อออออออออออออออออออออออออออออออออออออออป".
           05  LINE 02  COLUMN 01
               VALUE  "บ                    *** RELACAO DE CENT".
           05  LINE 02  COLUMN 41
               VALUE  "RO DE CUSTO ***                        บ".
           05  LINE 03  COLUMN 01
               VALUE  "วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ".
           05  LINE 03  COLUMN 41
               VALUE  "ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ".
           05  LINE 04  COLUMN 01
               VALUE  "บ".
           05  LINE 04  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 05  COLUMN 01
               VALUE  "บ".
           05  LINE 05  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 06  COLUMN 01
               VALUE  "บ".
           05  LINE 06  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 07  COLUMN 01
               VALUE  "บ".
           05  LINE 07  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 08  COLUMN 01
               VALUE  "บ          ORDEM DO RELATORIO ( 1-CODIGO".
           05  LINE 08  COLUMN 41
               VALUE  " / 2-DENOMINACAO ) :                   บ".
           05  LINE 09  COLUMN 01
               VALUE  "บ".
           05  LINE 09  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 10  COLUMN 01
               VALUE  "บ".
           05  LINE 10  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 11  COLUMN 01
               VALUE  "บ          SOLICITANTE :".
           05  LINE 11  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 12  COLUMN 01
               VALUE  "บ".
           05  LINE 12  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 13  COLUMN 01
               VALUE  "บ".
           05  LINE 13  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 14  COLUMN 01
               VALUE  "บ".
           05  LINE 14  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 15  COLUMN 01
               VALUE  "บ".
           05  LINE 15  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 16  COLUMN 01
               VALUE  "บ".
           05  LINE 16  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 17  COLUMN 01
               VALUE  "บ".
           05  LINE 17  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 18  COLUMN 01
               VALUE  "บ".
           05  LINE 18  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 19  COLUMN 01
               VALUE  "บ".
           05  LINE 19  COLUMN 41
               VALUE  "CONFIRMA EMISSAO :                     บ".
           05  LINE 20  COLUMN 01
               VALUE  "บ".
           05  LINE 20  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 21  COLUMN 01
               VALUE  "บ".
           05  LINE 21  COLUMN 41
               VALUE  "                                       บ".
           05  LINE 22  COLUMN 01
               VALUE  "วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ".
           05  LINE 22  COLUMN 41
               VALUE  "ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤถ".
           05  LINE 23  COLUMN 01
               VALUE  "บMENSAGEM :".
           05  LINE 23  COLUMN 41
               VALUE  "                              ณ OCP101 บ".
           05  LINE 24  COLUMN 01
               VALUE  "ศอออออออออออออออออออออออออออออออออออออออ".
           05  LINE 24  COLUMN 41
               VALUE  "ออออออออออออออออออออออออออออออฯออออออออผ".
           05  T-EMPRESA
               LINE 02  COLUMN 02  PIC X(20)
               USING  W-EMPRESA
               HIGHLIGHT.
           05  DATELA
               LINE 02  COLUMN 71  PIC XX/XX/XX
               USING  DATA-EQ
               HIGHLIGHT.
       01 OCT101T.
           05  OCT10101
               LINE 08  COLUMN 62  PIC 9(01)
               USING  OCW10101
               HIGHLIGHT.
           05  T-SOLIC
               LINE 11  COLUMN 26  PIC X(15)
               USING  W-SOLIC
               HIGHLIGHT.
           05  T-OPCAO
               LINE 19  COLUMN 60  PIC X(01)
               USING  W-OPCAO
               HIGHLIGHT.
      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
       INICIO.
           ACCEPT DATA-EQ  FROM DATE
           MOVE DATA-EQ TO DATA-INV
           PERFORM INVNOR
           MOVE DATA-N  TO DATA-EQ.
           DISPLAY  OCT101.
       INC-ORD.
           MOVE 1 TO OCW10101
           MOVE ZEROS TO OCC00101
           ACCEPT OCT10101
           ACCEPT W-ACT FROM ESCAPE KEY
           IF W-ACT = 02
                  GO TO ROT-FIM.
           IF OCW10101 NOT = 1 AND 2
                  MOVE "*** ORDEM DE EMISSAO NAO DISPONIVEL ***" TO MENS
                  PERFORM ROT-MENS THRU ROT-MENS-FIM
                  GO TO INC-ORD.
       INC-CAB.
           ACCEPT T-SOLIC
           ACCEPT W-ACT FROM ESCAPE KEY
           IF W-ACT = 02
                      GO TO INC-ORD.
           IF W-SOLIC = SPACES
                  MOVE "*** INFORMAR NOME DO SOLICITANTE ***" TO MENS
                  PERFORM ROT-MENS THRU ROT-MENS-FIM
                  GO TO INC-CAB.
       ROT-SOL.
           DISPLAY (23 13) LIMPA
           ACCEPT  T-OPCAO
           ACCEPT W-ACT FROM ESCAPE KEY
           IF W-ACT = 02
                      GO TO INC-CAB.
           IF W-OPCAO = "N"
                  GO TO NOV-SOL1.
           IF W-OPCAO NOT = "S"
                  MOVE "*** DIGITE S=SIM   N=NAO ***" TO MENS
                  PERFORM ROT-MENS THRU ROT-MENS-FIM
                  GO TO ROT-SOL.
       INC-OP1.
           OPEN I-O   OCA001
           IF ST-ERRO NOT = "00"
              IF ST-ERRO = "30"
                 MOVE "ARQUIVO DE CENTRO DE CUSTO NAO EXISTE" TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO ROT-FIM2
              ELSE
                 MOVE "ERRO NA ABERTURA DO ARQUIVO OCA001" TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO ROT-FIM2
           ELSE
               NEXT SENTENCE.
       INC-OP2.
           OPEN OUTPUT ARQIMP.
      *
       INC-101D.
           IF OCW10101 = 1
               MOVE ZEROS TO OCC00102
               START OCA001 KEY IS NOT LESS OCK00101
                       INVALID KEY
                       MOVE "*** FIM DO ARQUIVO DE CENTRO DE CUSTO ***"
                                                                TO MENS
                       PERFORM ROT-MENS THRU ROT-MENS-FIM
                       GO TO NOV-SOL
           ELSE
               MOVE SPACES TO OCC00102
               START OCA001 KEY IS NOT LESS OCK00102
                       INVALID KEY
                       MOVE "*** FIM DO ARQUIVO DE CENTRO DE CUSTO ***"
                                                                TO MENS
                       PERFORM ROT-MENS THRU ROT-MENS-FIM
                       GO TO NOV-SOL.
           PERFORM ROT-CABEC THRU ROT-CABEC-FIM.
       INC-RD2.
           DISPLAY (23 13)
            "                                                        "
           READ OCA001 NEXT
           IF ST-ERRO NOT = "00"
              IF ST-ERRO = "10"
                 MOVE "*** FIM DE PROCESSAMENTO ***" TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO NOV-SOL
              ELSE
                 MOVE "ERRO NA LEITURA DO ARQUIVO " TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO ROT-FIM
           ELSE
              NEXT SENTENCE.
       ROT-MONTAR.
           MOVE OCC00101 TO DET21
           MOVE OCC00102 TO DET22
           WRITE REGIMP FROM DET2 BEFORE ADVANCING 1 LINE
           ADD 1 TO CONLIN
           IF CONLIN < 50
                  GO TO INC-RD2.
           MOVE SPACES TO REGIMP
           WRITE REGIMP BEFORE ADVANCING PAGE
           PERFORM ROT-CABEC THRU ROT-CABEC-FIM
           GO TO INC-RD2.
      *
       ROT-CABEC.
           MOVE  1 TO   CONLIN
           ADD   1 TO   CONPAG
           MOVE W-SOLIC TO CAB22
           MOVE CONPAG    TO CAB18
           MOVE DATA-FOR   TO CAB16
           IF OCW10101 = 1
                  MOVE "ORDEM DE CODIGO       " TO CAB24
           ELSE
                  MOVE "ORDEM DE DENOMINACAO  " TO CAB24.
           WRITE REGIMP FROM TRDUP BEFORE ADVANCING 1 LINE
           WRITE REGIMP FROM CAB1 BEFORE ADVANCING 2 LINE.
           WRITE REGIMP FROM CAB2 BEFORE ADVANCING 1 LINE.
           WRITE REGIMP FROM TRSIM BEFORE ADVANCING 1 LINE.
           WRITE REGIMP FROM CAB3 BEFORE ADVANCING 2 LINE.
       ROT-CABEC-FIM.
           EXIT.
      *
      *
       NOV-SOL.
           MOVE SPACES TO REGIMP
           WRITE REGIMP BEFORE ADVANCING PAGE.
           CLOSE OCA001 ARQIMP.
       NOV-SOL1.
           DISPLAY (23 23) " *** NOVO RELATORIO : . ***"
           ACCEPT  (23 45) W-OPCAO
           IF W-OPCAO = "S"
                  MOVE 01 TO CONLIN
                  MOVE ZEROS  TO CONPAG
                  GO TO INC-ORD.
           IF W-OPCAO NOT = "N"
                  MOVE "*** DIGITE S=SIM   N=NAO ***" TO MENS
                  PERFORM ROT-MENS THRU ROT-MENS-FIM
                  GO TO NOV-SOL1.
      *
      **********************
      * ROTINA DE FIM      *
      **********************
      *
       ROT-FIM.
           DISPLAY (01 01) ERASE.
       ROT-FIM2.
           EXIT PROGRAM.
       ROT-FIM3.
           STOP RUN.
      *
      **********************
      * ROTINA DE MENSAGEM *
      **********************
      *
       ROT-MENS.
           MOVE ZEROS TO W-CONT.
       ROT-MENS1.
           DISPLAY (23 13) MENS.
       ROT-MENS2.
           ADD 1 TO W-CONT
           IF W-CONT < 3000
              GO TO ROT-MENS2
           ELSE
              DISPLAY (23 12) LIMPA.
       ROT-MENS-FIM.
           EXIT.
       FIM-ROT-MENS.
      *
      ************************************
      *      *** ROTINA DE DATA ***      *
      ************************************
      *
      *
      *
       FORNOR.
           MOVE DIA-FOR TO DIA
           MOVE MES-FOR TO MES
           MOVE ANO-FOR TO ANO.
      *
      * FUNCAO : CONVERTE DATA FORMATADA EM NORMAL
      *
       NORINV.
           MOVE DIA     TO DIA-INV DIA-FOR
           MOVE MES     TO MES-INV MES-FOR
           MOVE ANO     TO ANO-INV ANO-FOR.
      *
      * FUNCAO : CONVERTE DATA NORMAL P/INVERTIDA E FORMATADA
      *
       INVNOR.
           MOVE DIA-INV TO DIA DIA-FOR
           MOVE MES-INV TO MES MES-FOR
           MOVE ANO-INV TO ANO ANO-FOR.
      *
      * FUNCAO : CONVERTE DATA INVERTIDA PARA NORMA
      *
       VALDATA.
           MOVE 0 TO FLAG1.
           GO TO D31 D28 D31 D30 D31 D30 D31 D31 D30 D31 D30 D31
                                          DEPENDING ON MES
           MOVE 1 TO FLAG1
           GO TO VALDATA-FIM.
       D31.
           IF DIA > 31
              MOVE 2 TO FLAG1
              GO TO VALDATA-FIM.
       D30.
           IF DIA > 30
              MOVE 2 TO FLAG1
              GO TO VALDATA-FIM.
       D28.
           COMPUTE W-01 = ANO / 4
           COMPUTE W-01 = W-01 * 4
           COMPUTE W-01 = ANO - W-01
           IF W-01 = ZEROS
                IF DIA > 29
                  MOVE 2 TO FLAG1
                  GO TO VALDATA-FIM
                ELSE
                  IF DIA > 28
                    MOVE 2 TO FLAG1
                    GO TO VALDATA-FIM.
       VALDATA-FIM.
      *
      *---------------------*** FIM DE PROGRAMA ***--------------------*