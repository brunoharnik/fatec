       IDENTIFICATION DIVISION.
       PROGRAM-ID. FP16203.
      **************************************
      * MANUTENCAO DO CADASTRO DE CARGOS   *
      **************************************
      *----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
                         DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT CADCAR ASSIGN TO DISK
                    ORGANIZATION IS INDEXED
                    ACCESS MODE  IS DYNAMIC
                    RECORD KEY   IS CODCAR
                    FILE STATUS  IS ST-ERRO
                    ALTERNATE RECORD KEY IS CHAVE2 = DENOMINACAOCAR
                                                      WITH DUPLICATES.
            SELECT CADDEP ASSIGN TO DISK
                    ORGANIZATION IS INDEXED
                    ACCESS MODE  IS DYNAMIC
                    RECORD KEY   IS CODDEP
                    FILE STATUS  IS ST-ERRO
                    ALTERNATE RECORD KEY IS CHAVE2A = DENOMINACAO
                                                      WITH DUPLICATES.
      *
      *-----------------------------------------------------------------
       DATA DIVISION.
       FILE SECTION.
       FD CADCAR
               LABEL RECORD IS STANDARD
               VALUE OF FILE-ID IS "CADCAR.DAT".
       01 REGCAR.
            03 CODCAR          PIC 9(04).
            03 DENOMINACAOCAR  PIC X(20).
            03 TIPOSALARIO     PIC X(01).
            03 SALARIOBASE     PIC 9(06)V99.   
            03 CODDEPC         PIC 9(04).
      *         
       FD CADDEP
               LABEL RECORD IS STANDARD
               VALUE OF FILE-ID IS "CADDEP.DAT".
       01 REGDEP.
            03 CODDEP          PIC 9(04).
            03 DENOMINACAO     PIC X(20).
            03 NIVHIERARQUICO  PIC 9(01).
            03 NUMFUNCIONARIOS PIC 9(03).
      *
      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.
       77 W-SEL            PIC 9(01) VALUE ZEROS.
       77 W-CONT           PIC 9(06) VALUE ZEROS.
       77 W-OPCAO          PIC X(01) VALUE SPACES.
       77 ST-ERRO          PIC X(02) VALUE "00".
       77 ST-ERROA         PIC X(02) VALUE "00".
       77 W-ACT            PIC 9(02) VALUE ZEROS.
       77 MENS             PIC X(50) VALUE SPACES.
       77 LIMPA            PIC X(50) VALUE SPACES.
       77 TEXTOSAL         PIC X(10) VALUE SPACES.
       77 TEXTONV          PIC X(25) VALUE SPACES.
      *  
       01 TABSAL.
           03 TABSAL1 PIC X(10) VALUE "HORISTA".
           03 TABSAL2 PIC X(10) VALUE "DIARISTA".
           03 TABSAL3 PIC X(10) VALUE "MENSALISTA".
       01  TBSAL REDEFINES TABSAL.
           03 TBSALV  PIC X(10) OCCURS 3 TIMES.
      *
       01 TABTS.
           03 TABTS1       PIC X(3) VALUE "HDM".
       01 TBTS REDEFINES TABTS.
           03 TBTSV        PIC X(01) OCCURS 3 TIMES.
       01 IND              PIC 9(02) VALUE ZEROS.
      *   
       01 TABNV.
           03 TABNV1 PIC X(25) VALUE "PRESIDENCIA".
           03 TABNV2 PIC X(25) VALUE "DIRETORIA ADMINISTRATIVA".
           03 TABNV3 PIC X(25) VALUE "DIRETORIA INDUSTRIAL".
           03 TABNV4 PIC X(25) VALUE "DIRETORIA FINANCEIRA".
           03 TABNV5 PIC X(25) VALUE "DIRETORIA COMERCIAL".
           03 TABNV6 PIC X(25) VALUE "DIRETORIA MARKETING".
           03 TABNV7 PIC X(25) VALUE "RELACOES INSTITUCIONAIS".
           03 TABNV8 PIC X(25) VALUE "TECNOLOGIA INFORMAÇÃO".
           03 TABNV9 PIC X(25) VALUE "PROJETOS ESPECIAIS".
       01 TBNV REDEFINES TABNV.
           03 TBNVV  PIC X(25) OCCURS 9 TIMES.
      *
       SCREEN SECTION.
       01  TFP16203.
           05  BLANK SCREEN.
           05  LINE 03  COLUMN 01 
               VALUE  "                               CADASTRO".
           05  LINE 03  COLUMN 41 
               VALUE  "DE CARGOS".
           05  LINE 05  COLUMN 01 
               VALUE  "            [ CODIGO ]".
           05  LINE 05  COLUMN 41 
               VALUE  "      [ DENOMINACAO ]".
           05  LINE 08  COLUMN 01 
               VALUE  "        [ COD. DEPARTAMENTO ]".
           05  LINE 08  COLUMN 41 
               VALUE  "    [ NIVEL HIERARQUICO ]".
           05  LINE 11  COLUMN 01 
               VALUE  "         [ TIPO DE SALARIO ]".
           05  LINE 11  COLUMN 41 
               VALUE  "      [ SALARIO BASE ]".
           05  TCODCAR
               LINE 06  COLUMN 16  PIC 9(04)
               USING  CODCAR
               HIGHLIGHT.
           05  TDENOMINACAOCAR
               LINE 06  COLUMN 44  PIC X(20)
               USING  DENOMINACAOCAR
               HIGHLIGHT.
           05  TCODDEPC
               LINE 09  COLUMN 14  PIC 9(04)
               USING  CODDEPC
               HIGHLIGHT.
           05  TDENOMINACAO
               LINE 09  COLUMN 19  PIC X(20)
               USING  DENOMINACAO
               HIGHLIGHT.
           05  TNIVHIERARQUICO
               LINE 09  COLUMN 42  PIC 9(01)
               USING  NIVHIERARQUICO
               HIGHLIGHT.
           05  TTEXTONV
               LINE 09  COLUMN 44  PIC X(25)
               USING  TEXTONV
               HIGHLIGHT.
           05  TTIPOSALARIO
               LINE 12  COLUMN 14  PIC X(01)
               USING  TIPOSALARIO
               HIGHLIGHT.
           05  TTEXTOSAL
               LINE 12  COLUMN 16  PIC X(10)
               USING  TEXTOSAL
               HIGHLIGHT.
           05  TSALARIOBASE
               LINE 12  COLUMN 50  PIC ZZZZZ9,99
               USING  SALARIOBASE
               HIGHLIGHT.

      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
       INICIO.
      *
       INC-OP0.
           OPEN I-O CADCAR
           IF ST-ERRO NOT = "00"
               IF ST-ERRO = "30"
                   OPEN OUTPUT CADCAR
                   CLOSE CADCAR
                   MOVE "*** ARQUIVO CADCAR SENDO CRIADO **" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-OP0
               ELSE
                   MOVE "ERRO NA ABERTURA DO ARQUIVO CODCAR" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO ROT-FIM
           ELSE
               NEXT SENTENCE.
           OPEN INPUT CADDEP
           IF ST-ERRO NOT = "00"
                   MOVE "ERRO NA ABERTURA DO ARQUIVO CADDEP" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO ROT-FIM
           ELSE
               NEXT SENTENCE.
       INC-001.
                MOVE ZEROS  TO CODCAR SALARIOBASE CODDEPC IND
                MOVE ZEROS  TO NUMFUNCIONARIOS NIVHIERARQUICO
                MOVE SPACES TO DENOMINACAOCAR TEXTOSAL TIPOSALARIO 
                MOVE SPACES TO TEXTONV DENOMINACAO
                DISPLAY TFP16203.
       INC-002.
                ACCEPT  TCODCAR
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02
                   CLOSE CADCAR
                   GO TO ROT-FIM.
                IF CODCAR = 0
                    MOVE "CODIGO INVALIDO" TO MENS
                    PERFORM ROT-MENS THRU ROT-MENS-FIM
                    GO TO INC-002.
       LER-CODCAR01.
                MOVE 0 TO W-SEL
                READ CADCAR
                IF ST-ERRO NOT = "23"
                   IF ST-ERRO = "00"
                      PERFORM INC-005A
                      PERFORM INC-007 THRU INC-008
                      DISPLAY TFP16203
                      MOVE "*** CODCAR JA CADASTRAD0 ***" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      MOVE 1 TO W-SEL
                      GO TO ACE-001
                   ELSE
                      MOVE "ERRO NA LEITURA ARQUIVO CODCAR"   TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM
                ELSE
                   NEXT SENTENCE.
       INC-004.
                ACCEPT TDENOMINACAOCAR
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-002.
                IF DENOMINACAOCAR = SPACES
                 MOVE "*** DENOMINACAO INVALIDA ***" TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO INC-004.
       INC-005.
                ACCEPT TCODDEPC
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-004.
                PERFORM INC-005A.
                IF ST-ERRO = "23"
                     MOVE "COD. DEPARTAMENTO INVALIDO" TO TEXTONV
                     PERFORM ROT-MENS THRU ROT-MENS-FIM
                     GO TO INC-005.

                
       INC-006.
                ACCEPT TTIPOSALARIO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-005.
       INC-007.
                IF TIPOSALARIO NOT = TBTSV(IND)
                 IF IND = 3
                  MOVE "*** TIPO DE SALARIO INVALIDO ***" TO MENS
                  PERFORM ROT-MENS THRU ROT-MENS-FIM
				  MOVE ZERO TO IND
                  GO TO INC-006
                 ELSE
                   ADD 1 TO IND
                   GO TO INC-007.
       INC-008.     
                MOVE TBSALV(IND) TO TEXTOSAL
				MOVE ZERO TO IND
                DISPLAY TFP16203.
       INC-009.
                ACCEPT TSALARIOBASE
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-006.
                IF SALARIOBASE = 0
                 MOVE "*** VALOR INVALIDO ***" TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO INC-009.
      * CONDICIONAL PARA VERIFICACAO DE ALTERACAO
               IF W-SEL = 1 GO TO ALT-OPC.
       
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
                WRITE REGCAR
                IF ST-ERRO = "00" OR "02"
                      MOVE "*** DADOS GRAVADOS *** " TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-001.
                IF ST-ERRO = "22"
                      MOVE "*** CODCAR JA EXISTE ***       " TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-001
                ELSE
                      MOVE "ERRO NA GRAVACAO DO ARQUIVO DE CODCAR"
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
                   GO TO INC-004.
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
                DELETE CADCAR RECORD
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
                REWRITE REGCAR
                IF ST-ERRO = "00" OR "02"
                   MOVE "*** REGISTRO ALTERADO ***         " TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-001.
                MOVE "ERRO NA EXCLUSAO DO REGISTRO CODCAR"   TO MENS
                PERFORM ROT-MENS THRU ROT-MENS-FIM
                GO TO ROT-FIM.
      *
       INC-005A.
                MOVE CODDEPC TO CODDEP.
                READ CADDEP
                IF ST-ERRO = "00"
                  MOVE TBNVV(NIVHIERARQUICO) TO TEXTONV
                  DISPLAY TFP16203
                ELSE 
                  IF ST-ERRO = "23"
                     MOVE "COD. DEPARTAMENTO INVALIDO" TO TEXTONV
                  ELSE
                    MOVE "*** ERRO GRAVE NA LEITURA ARQUIVO CADDEP" TO MENS
                    PERFORM ROT-MENS THRU ROT-MENS-FIM
                    GO TO ROT-FIM.                  
       INC-005-FIM.
      *
      **********************
      * ROTINA DE FIM      *
      **********************
      *
       ROT-FIM. 
                CLOSE CADCAR CADDEP
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
       FIM-ROT-TEMPO.
    