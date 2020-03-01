       IDENTIFICATION DIVISION.
       PROGRAM-ID. OCPG83.
      **************************************
      * ATUALIZACAO DOS VALORES SINTETICOS *
      **************************************
      *----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *
           SELECT OCA003 ASSIGN TO DISK
              ORGANIZATION  IS INDEXED
              ACCESS MODE   IS DYNAMIC
              RECORD KEY    IS OCK00301
              FILE STATUS   IS ST-ERRO
              ALTERNATE RECORD KEY IS OCK00302 = OCC00302 OCC00301
                        WITH DUPLICATES.
      *
           SELECT OCA013 ASSIGN TO DISK
              ORGANIZATION  IS INDEXED
              ACCESS MODE   IS DYNAMIC
              RECORD KEY    IS OCK01301
              FILE STATUS   IS ST-ERRO.
      *
      *-----------------------------------------------------------------
       DATA DIVISION.
       FILE SECTION.
      *
       COPY OCA003.BOK.
       COPY OCA013.BOK.
      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.
       01 IND          PIC 9(02) VALUE ZEROS.
       01 W-CONT       PIC 9(04) VALUE ZEROS.
       01 W-OPCAO      PIC X(01) VALUE SPACES.
       01 ST-ERRO      PIC X(02) VALUE "00".
       01 W-ACT        PIC 9(02) VALUE ZEROS.
       01 MENS         PIC X(50) VALUE SPACES.
       01 LIMPA        PIC X(50) VALUE SPACES.
       77 W-OCA003     PIC X(40) VALUE "OCA003.DAT".
       77 W-OCA013     PIC X(40) VALUE "OCA013.DAT".
       01 W-EMPRESA    PIC X(20) VALUE " ACOTECNICA ".
       01 OCW01301     PIC 9(03) VALUE ZEROS.
      *-----------------------------------------------------------------
      *
      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
       INICIO.
      *
       INC-OP1.
           OPEN INPUT OCA003
           IF ST-ERRO NOT = "00"
              IF ST-ERRO = "30"
                 MOVE "ARQUIVO DE RELACIONAMENTO NAO EXISTE" TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO ROT-FIM1
              ELSE
                 MOVE "ERRO NA ABERTURA DO ARQUIVO OCA003" TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO ROT-FIM1
           ELSE
              OPEN OUTPUT OCA013
              CLOSE   OCA013.
           OPEN I-O OCA013
           IF ST-ERRO NOT = "00"
              MOVE "ERRO NA ABERTURA DO ARQUIVO 0CA013" TO ERRO-LAB
              PERFORM ROT-MENS THRU ROT-MENS-FIM
              CLOSE OCA003
              GO TO ROT-FIM1.
      *
       IMP-100.
           MOVE ZEROS TO OCC00301 OCC00302
           START OCA003 KEY IS NOT LESS OCK00301
                        INVALID KEY GO TO ROT-FIM.
      *
       LER-A003.
           READ OCA003 NEXT
           IF ST-ERRO NOT = "00"
              IF ST-ERRO = "10"
                 MOVE "TERMINO DA MONTAGEM DO ARQ. DE SINTETICO"
                                                              TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO ROT-FIM
              ELSE
                 MOVE "ERRO NA LEITURA DO ARQUIVOLER-003"   TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO ROT-FIM
           ELSE
              MOVE OCC00301 TO OCC01301.
      *
       PROCESSA-A013.
           READ OCA013
           IF ST-ERRO NOT = "00"
              IF ST-ERRO = "23"
                 GO TO MOVE-PARA-A013
              ELSE
                 MOVE "ERRO NA LEITURA DO ARQUIVO OCA013"   TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO ROT-FIM.
       PROCESSA-A013A.
           MOVE 1 TO IND.
       PROCESSA-A013B.
           ADD OCC00303(IND) TO OCC01302(IND)
           ADD OCC00304(IND) TO OCC01303(IND)
           IF IND < 12
               ADD 1 TO IND
               GO TO PROCESSA-A013B.
           ADD OCC00305 TO OCC01304
           ADD OCC00306 TO OCC01305
           ADD OCC00307 TO OCC01306
           ADD OCC00308 TO OCC01307
           REWRITE OCR013
           IF ST-ERRO NOT = "00"
              MOVE "ERRO NA GRAVAÇÃO DO ARQUIVO PRC-013 "  TO MENS
              PERFORM ROT-MENS THRU ROT-MENS-FIM
              GO TO ROT-FIM.
           GO TO LER-A003.
       MOVE-PARA-A013.
           MOVE 1 TO IND.
       MOVE-PARA-A013A.
           MOVE OCC00303(IND) TO  OCC01302(IND)
           MOVE OCC00304(IND) TO  OCC01303(IND)
           IF IND < 12
              ADD 1 TO IND
              GO TO MOVE-PARA-A013A.
           MOVE OCC00305 TO OCC01304
           MOVE OCC00306 TO OCC01305
           MOVE OCC00307 TO OCC01306
           MOVE OCC00308 TO OCC01307
           WRITE OCR013
           IF ST-ERRO NOT = "00"
              MOVE "ERRO NA WRITE DO ARQUIVOMOV-013"   TO MENS
              PERFORM ROT-MENS THRU ROT-MENS-FIM
              GO TO ROT-FIM
           ELSE
              GO TO LER-A003.
      *
      *****************
      * ROTINA DE FIM *
      *****************
      *
       ROT-FIM.
           CLOSE OCA003 OCA013.
       ROT-FIM1.
           EXIT PROGRAM.
       ROT-FIM2.
           STOP RUN.
      *
      **********************
      * ROTINA DE MENSAGEM *
      **********************
      *
       ROT-MENS.
           MOVE ZEROS TO W-CONT.
       ROT-MENS1.
           DISPLAY (23, 13) MENS.
       ROT-MENS2.
           ADD 1 TO W-CONT
           IF W-CONT < 3500
              GO TO ROT-MENS2
           ELSE
              DISPLAY (23, 12) LIMPA.
       ROT-MENS-FIM.
           EXIT.
       FIM-ROT-MENS.
       FIM-DE-PROGRAMA.
      *---------------------*** FIM DE PROGRAMA ***--------------------*