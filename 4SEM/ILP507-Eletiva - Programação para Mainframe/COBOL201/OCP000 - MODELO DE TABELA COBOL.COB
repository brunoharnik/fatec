       IDENTIFICATION DIVISION.
       PROGRAM-ID. CEP003.
      * 1322451 - GABRIEL DIAS PEDRO
      *----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
                         DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CADPROD ASSIGN TO DISK
                    ORGANIZATION IS INDEXED
                    ACCESS MODE  IS DYNAMIC
                    RECORD KEY   IS CODPROD
                    FILE STATUS  IS ST-ERRO
                    ALTERNATE RECORD KEY IS DESCPROD
                                              WITH DUPLICATES.
      *   PARCEIRO
           SELECT CADPARCEIRO ASSIGN TO DISK
                    ORGANIZATION IS INDEXED
                    ACCESS MODE  IS DYNAMIC
                    RECORD KEY   IS CODIGO
                    FILE STATUS  IS ST-ERRO
                    ALTERNATE RECORD KEY IS CHAVE3 = NOME APELIDO
                                             WITH DUPLICATES.
      *-----------------------------------------------------------------
       DATA DIVISION.
       FILE SECTION.
       FD CADPROD
               LABEL RECORD IS STANDARD
               VALUE OF FILE-ID IS "CADPROD.DAT".
       01 REGPROD.
                03 CODPROD         PIC 9(08).
                03 DESCPROD        PIC X(33).
                03 UNPROD          PIC X(02).
                03 CODFORN         PIC 9(09).
                03 TIPOPROD        PIC X(01).
                03 TIPODESC        PIC X(25).
                03 QUANTIDADE      PIC 9(08).
                03 PMEDIO          PIC 9(12).
                03 PTOTAL          PIC 9(15).
                03 ULTPRE        PIC 9(15).
                03 DIAULTC         PIC 9(02).
                03 TFMESULTC       PIC 9(02).
                03 ANOULTC         PIC 9(04).
                03 DIADASEMANA     PIC X(15).
      *
       FD CADPARCEIRO
               LABEL RECORD IS STANDARD
               VALUE OF FILE-ID IS "CADPARCEIRO.DAT".
       01 REGPAC.
                03 CODIGO          PIC 9(04).
                03 APELIDO         PIC X(16).
                03 NOME            PIC X(33).
                03 CNPJ            PIC 9(15).
                03 INSC            PIC 9(11).
                03 EMAIL           PIC X(50).
                03 NCEP            PIC 9(08).
                03 NUM             PIC 9(05).
                03 COMPL           PIC X(14).
                03 DDD1            PIC 9(02).
                03 TELEFONE1       PIC 9(11).
                03 DDD2            PIC 9(02).
                03 TELEFONE2       PIC 9(11).
                03 DDD3            PIC 9(02).
                03 TELEFONE3       PIC 9(11).
                03 CONTATO         PIC X(26).
      *
      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.
       77 W-SEL        PIC 9(01) VALUE ZEROS.
       77 W-CONT       PIC 9(06) VALUE ZEROS.
       77 W-OPCAO      PIC X(01) VALUE SPACES.
       77 ST-ERRO      PIC X(02) VALUE "00".
       77 W-ACT        PIC 9(02) VALUE ZEROS.
       77 MENS         PIC X(50) VALUE SPACES.
       77 FLAG1        PIC 9(02) VALUE ZEROS.
       77 W-01         PIC 9(03) VALUE ZEROS.
       77 LIMPA        PIC X(50) VALUE SPACES.
       01 IND          PIC 9(02) VALUE ZEROS.
       77 CONTA        PIC 9(10) VALUE ZEROS.
       77 AUX          PIC 9(10) VALUE ZEROS.
       77 AUX2         PIC 9(10) VALUE ZEROS.
       77 DIASEMANA    PIC X(15) VALUE SPACES.
      *
       01 TABTIPOPROD.
          03 T1 PIC X(36) VALUE
          "HHIGIENE    AALIMENTO   EESCRITORIO ".
          03 T2 PIC X(36) VALUE
          "LLIMPEZA    DDIVERSO                ".
       01 TABAUX REDEFINES TABTIPOPROD.
           03 TTP        PIC X(12) OCCURS 06 TIMES.
       01 ALFATP.
             03 ALFATP1 PIC X(01).
             03 ALFATP2 PIC X(11).
      *
       01 TABUNIDADE.
          03 T3 PIC X(09) VALUE
          "LT MT KG".
       01 TABAUX REDEFINES TABUNIDADE.
           03 TUN        PIC X(03) OCCURS 03 TIMES.
       01 ALFAUN.
             03 ALFAUN1 PIC X(03).
      *
      01 TABSEMANA.
          03 T4 PIC X(56) VALUE
          "SABADO        DOMINGO       SEGUNDA-FEIRA TERCA-FEIRA   ".
          03 T5 PIC X(56) VALUE
          "QUARTA-FEIRA  QUINTA-FEIRA  SEXTA-FEIRA                 ".
       01 TABAUX REDEFINES TABSEMANA.
           03 TDS        PIC X(14) OCCURS 08 TIMES. 
       01 ALFASEM.
             03 ALFASEM1 PIC X(14).
      *
       01 TABDIAMES.
          03 T9 PIC X(36) VALUE
          "000031059090120151181212243273304334365".
       01 TABDIAS REDEFINES TABDIAMES.
           03 TDS        PIC 9(03) OCCURS 12 TIMES. 
      *----------------------------------------------------------
       SCREEN SECTION.
         01  CADPRODUTO.
           05  BLANK SCREEN.
           05  LINE 02  COLUMN 01 
               VALUE  "                          Cadastro de pr".
           05  LINE 02  COLUMN 41 
               VALUE  "odutos".
           05  LINE 04  COLUMN 05 
               VALUE  " CODIGO".
           05  LINE 06  COLUMN 05 
               VALUE  " DESCRICAO".
           05  LINE 08  COLUMN 05 
               VALUE  " UNIDADE".
           05  LINE 10  COLUMN 05 
               VALUE  " COD FORN".
           05  LINE 12  COLUMN 05 
               VALUE  " TIPO PRODUTO".
           05  LINE 14  COLUMN 05 
               VALUE  " QUANTIDADE".
           05  LINE 16  COLUMN 05 
               VALUE  " PRECO MEDIO".
           05  LINE 18  COLUMN 05 
               VALUE  " VALOR TOTAL".
           05  LINE 20  COLUMN 05
               VALUE  " ULTIMO PRECO".
           05  LINE 22  COLUMN 05 
               VALUE  " ULTIMA COMPRA".
           05  LINE 24  COLUMN 05 
               VALUE  " DIA DA SEMANA".
           05  TFCOD
               LINE 04  COLUMN 25  PIC 9(08)
               USING  CODPROD
               HIGHLIGHT.
           05  TFDESC
               LINE 06  COLUMN 25 PIC X(33)
               USING  DESCPROD
               HIGHLIGHT.
           05  TFUN
               LINE 08  COLUMN 25  PIC X(02)
               USING  UNPROD
               HIGHLIGHT.
           05  TFCODFOR
               LINE 10  COLUMN 25  PIC 9(09)
               USING  CODFORN
               HIGHLIGHT.
           05  TFRAZAO
               LINE 10  COLUMN 50  PIC X(40)
               USING  NOME
               HIGHLIGHT.
           05  TFTIPO
               LINE 12  COLUMN 25  PIC X(01)
               USING  TIPOPROD
               HIGHLIGHT.
           05  TFTIPODESC
               LINE 12  COLUMN 40  PIC X(25)
               USING  TIPODESC
               HIGHLIGHT.
           05  TFQNT
               LINE 14  COLUMN 25  PIC 9(08)
               USING  QUANTIDADE
               HIGHLIGHT.
           05  TFPRECOMED
               LINE 16  COLUMN 25  PIC 9(12)
               USING  PMEDIO
               HIGHLIGHT.
           05  TFTOTAL
               LINE 18  COLUMN 25  PIC 9(15)
               USING  PTOTAL
               HIGHLIGHT.
           05  TFULTPRECO
               LINE 20  COLUMN 25  PIC 9(15)
               USING  ULTPRE
               HIGHLIGHT.
           05  TFDIAULTCOM
               LINE 22  COLUMN 25  PIC 9(02)
               USING  DIAULTC
               AUTO          HIGHLIGHT.
           05  T-TFMESULTC
               LINE 22  COLUMN 28  PIC 9(02)
               USING  TFMESULTC
               AUTO          HIGHLIGHT.
           05  TFANOULTC
               LINE 22  COLUMN 31  PIC 9(04)
               USING  ANOULTC
               HIGHLIGHT.
           05  TFDIASEMANA
               LINE 24  COLUMN 25  PIC X(14)
               USING  DIADASEMANA
               HIGHLIGHT.
       PROCEDURE DIVISION.
       INICIO.
      *
       INC-ABRE-PROD.
           OPEN I-O CADPROD
           IF ST-ERRO NOT = "00"
               IF ST-ERRO = "30"
                      OPEN OUTPUT CADPROD
                      CLOSE CADPROD
                      MOVE "*** ARQUIVO SENDO CRIADO **" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-ABRE-PAC
                   ELSE
                      MOVE "ERRO NA ABERTURA DO ARQUIVO" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM
                ELSE
                    NEXT SENTENCE.
       INC-ABRE-PAC.
           OPEN I-O CADPARCEIRO
           IF ST-ERRO NOT = "00"
               IF ST-ERRO = "30"
                      OPEN OUTPUT CADPARCEIRO
                      CLOSE CADPARCEIRO
                      MOVE "*** ARQUIVO SENDO CRIADO **" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-ABRE-PAC
                   ELSE
                      MOVE "ERRO NA ABERTURA DO ARQUIVO" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM
                ELSE
                    NEXT SENTENCE. 
       INC-LIMPA-VAR.
           MOVE ZEROS TO CODPROD CODFORN QUANTIDADE PMEDIO PTOTAL 
           MOVE ZEROS TO DIAULTC TFMESULTC ANOULTC ULTPRE
           MOVE SPACES TO DESCPROD UNPROD NOME
           MOVE SPACES TO TIPOPROD DIADASEMANA TIPODESC
           DISPLAY CADPRODUTO.
       INC-COD1.
           ACCEPT TFCOD
              ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                   CLOSE CADPROD
                   CLOSE CADPARCEIRO
                   GO TO ROT-FIM.
                IF CODIGO = SPACES
                   MOVE "*** CODIGO  INVALIDO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-LIMPA-VAR.
       INC-COD2.
                MOVE 0 TO W-SEL
                READ CADPROD
                IF ST-ERRO NOT = "23"
                   IF ST-ERRO = "00"
                      DISPLAY CADPRODUTO
                      MOVE "*** CODIGO JA CADASTRADO ***" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      MOVE 1 TO W-ACT
                      PERFORM ROT-LER-PROD THRU ROT-LER-PROD-FIM
                      PERFORM ROT-LER-FORN THRU ROT-LER-FORN-FIM
                      GO TO EDI-NOME
                   ELSE
                      MOVE "ERRO NA LEITURA ARQUIVO CODIGO"   TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM
                ELSE
                   NEXT SENTENCE.
       INC-DESC.
            ACCEPT TFDESC
              ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                    GO TO INC-COD1.
       INC-UNI1.
            ACCEPT TFUN
              ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                    GO TO INC-DESC.
            MOVE 1 TO IND.
       INC-UNI2.
            MOVE TUN(IND) TO ALFAUN
            IF UNPROD NOT = ALFAUN
                      IF IND < 03
                          ADD 1 TO IND
                          GO TO INC-UNI2
                      ELSE
                          MOVE SPACES TO UNPROD
                          MOVE "UNIDADE INVALIDA" TO MENS
                          PERFORM ROT-MENS THRU ROT-MENS-FIM
                          MOVE 1 TO IND
                          GO TO INC-UNI1
                ELSE
                      DISPLAY CADPRODUTO.
       INC-FORN.
            ACCEPT TFCODFOR
              ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                    GO TO INC-UNI1.
            PERFORM ROT-LER-FORN THRU ROT-LER-FORN-FIM.
            IF W-SEL NOT = 01
                MOVE "*** FORNECEDOR NAO CADASTRADO ***" TO MENS
                PERFORM ROT-MENS THRU ROT-MENS-FIM
                GO TO INC-FORN.
       INC-TPPROD1.
            ACCEPT TFTIPO
            ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                    GO TO INC-FORN.
            MOVE 1 TO IND.
       INC-TPPROD2.
            MOVE TTP(IND) TO ALFATP
            IF TIPOPROD NOT = ALFATP1
                      IF IND < 06
                          ADD 1 TO IND
                          GO TO INC-TPPROD2
                      ELSE
                          MOVE SPACES TO TIPOPROD
                          MOVE "TIPO INVALIDO!" TO MENS
                          PERFORM ROT-MENS THRU ROT-MENS-FIM
                          MOVE 1 TO IND
                          GO TO INC-TPPROD1
                ELSE
                      MOVE ALFATP2 TO TIPODESC
                      DISPLAY CADPRODUTO.
       INC-QUANTIDADE.
           ACCEPT TFQNT
            ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                    GO TO INC-TPPROD1.
       INC-PRECO-MEDIO.
           ACCEPT TFPRECOMED
            ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                    GO TO INC-QUANTIDADE.
           COMPUTE PTOTAL = PMEDIO * QUANTIDADE
           DISPLAY CADPRODUTO.
       INC-ULTIMOPRECO.
           ACCEPT TFULTPRECO
            ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                    GO TO INC-PRECO-MEDIO.
       INC-DIA-ULTC.
           ACCEPT TFDIAULTCOM
            ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                    GO TO INC-ULTIMOPRECO.
       INC-MES-ULTC.
           ACCEPT T-TFMESULTC
            ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                    GO TO INC-DIA-ULTC.
       INC-ANO-ULTC.
           ACCEPT TFANOULTC
            ACCEPT W-ACT FROM ESCAPE KEY
                 IF W-ACT = 02
                    GO TO INC-MES-ULTC.
           PERFORM VALIDADATA THRU VALIDADATA-FIM
                IF FLAG1 NOT = 0
                    IF FLAG1 = 1
                       MOVE "*** MES INVALIDO ***" TO MENS
                       PERFORM ROT-MENS THRU ROT-MENS-FIM
                       GO TO INC-MES-ULTC.
                    IF FLAG1 = 2
                       MOVE "*** DIA INVALIDO ***" TO MENS
                       PERFORM ROT-MENS THRU ROT-MENS-FIM
                       GO TO INC-DIA-ULTC.
           PERFORM ROTDIADASEMANA THRU ROTDIADASEMANA-FIM
           MOVE DIASEMANA TO DIADASEMANA
           DISPLAY CADPRODUTO
           PERFORM ROT-CAD-PROD THRU ROT-CAD-PROD-FIM
           GO TO INC-LIMPA-VAR.
      *****************************************
      * ROTINA DE CONSULTA/ALTERACAO/EXCLUSAO *
      *****************************************
      *
       EDI-NOME.
                DISPLAY (23, 12)
                     "F1=NOVO REGISTRO   F2=ALTERAR   F3=EXCLUIR"
                ACCEPT (23, 55) W-OPCAO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT NOT = 02 AND W-ACT NOT = 03 AND W-ACT NOT = 04
                   GO TO EDI-NOME.
                MOVE SPACES TO MENS
                DISPLAY (23, 12) MENS
                IF W-ACT = 02
                   MOVE 02 TO W-SEL
                   GO TO INC-LIMPA-VAR.
                IF W-ACT = 03
                   GO TO INC-COD1.
      *
       EXC-OPC.
                DISPLAY (23, 40) "EXCLUIR   (S/N) : ".
                ACCEPT (23, 57) W-OPCAO
                IF W-OPCAO = "N" OR "n"
                   MOVE "*** REGISTRO NAO EXCLUIDO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-LIMPA-VAR.
                IF W-OPCAO NOT = "S" AND "s"
                   MOVE "*** DIGITE APENAS S=SIM  e  N=NAO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO EXC-OPC.
       EXC-DL1.
                DELETE CADPROD RECORD
                IF ST-ERRO = "00"
                   MOVE "*** REGISTRO EXCLUIDO ***           " TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-LIMPA-VAR.
                MOVE "ERRO NA EXCLUSAO DO REGISTRO "   TO MENS
                PERFORM ROT-MENS THRU ROT-MENS-FIM
                GO TO ROT-FIM.

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
                IF W-CONT < 500
                   GO TO ROT-MENS2
                ELSE
                   DISPLAY (23, 12) LIMPA.
       ROT-MENS-FIM.
                EXIT.

      *********************************
      * ROTINA DE LEITURA DE PRODUTO *
      *********************************

       ROT-LER-PROD.
                MOVE 0 TO W-SEL
                READ CADPROD
                IF ST-ERRO NOT = "23"
                   IF ST-ERRO = "00"
                      DISPLAY CADPRODUTO
                      MOVE 1 TO W-SEL
                   ELSE
                      MOVE "ERRO NA LEITURA DO ARQUIVO"   TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-LIMPA-VAR
                ELSE
                   NEXT SENTENCE.
       ROT-LER-PROD-FIM.
            EXIT.

      *********************************
      * ROTINA DE LEITURA DE PARCEIRO *
      *********************************
	  
       ROT-LER-FORN.
                MOVE 0 TO W-SEL
                MOVE CODFORN TO CODIGO
                READ CADPARCEIRO
                IF ST-ERRO NOT = "23"
                   IF ST-ERRO = "00"
                      DISPLAY CADPRODUTO
                      MOVE 1 TO W-SEL
                   ELSE
                      MOVE "ERRO NA LEITURA DO ARQUIVO"   TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-LIMPA-VAR
                ELSE
                   NEXT SENTENCE.
       ROT-LER-FORN-FIM.
            EXIT.
			
      **********************
      * ROTINA DE CADASTRO DE PRODUTO *
      **********************
	  
       ROT-CAD-PROD.
                MOVE "S" TO W-OPCAO
                DISPLAY (23, 40) "DADOS OK (S/N) : ".
                ACCEPT (23, 57) W-OPCAO WITH UPDATE
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-DIA-ULTC.
                IF W-OPCAO = "N" OR "n"
                   MOVE "*** DADOS RECUSADOS PELO USUARIO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-LIMPA-VAR.
                IF W-OPCAO NOT = "S" AND "s"
                   MOVE "*** DIGITE APENAS S=SIM e N=NAO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO ROT-CAD-PROD.
          ROT-CAD-PROD-CONF.
            WRITE REGPROD
                IF ST-ERRO = "00" OR "02" 
                      MOVE "*** DADOS GRAVADOS *** " TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-LIMPA-VAR.
                IF ST-ERRO = "22"
                      MOVE "*** PRODUTO JA EXISTE ***       " TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-LIMPA-VAR
                ELSE
                      MOVE "ERRO NA GRAVACAO DO ARQUIVO DE PRODUTO"
                                                       TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM.
       ROT-CAD-PROD-FIM.
            EXIT.

      *****************************
      *VALIDAÇÃO DE DATA
      *****************************
  
       VALIDADATA.
           MOVE 0 TO FLAG1.
           GO TO D31 D28 D31 D30 D31 D30 D31 D31 D30 D31 D30 D31
                                          DEPENDING ON TFMESULTC
           MOVE 1 TO FLAG1
           GO TO VALIDADATA-FIM.
       D31.
           IF DIAULTC > 31
              MOVE 2 TO FLAG1
              GO TO VALIDADATA-FIM.
       D30.
           IF DIAULTC > 30
              MOVE 2 TO FLAG1
              GO TO VALIDADATA-FIM.
       D28.
           COMPUTE W-01 = ANOULTC / 4
           COMPUTE W-01 = W-01 * 4
           COMPUTE W-01 = ANOULTC - W-01
           IF W-01 = ZEROS
                IF DIAULTC > 29
                  MOVE 2 TO FLAG1
                  GO TO VALIDADATA-FIM
                ELSE
                  IF DIAULTC > 28
                    MOVE 2 TO FLAG1
                    GO TO VALIDADATA-FIM.
       VALIDADATA-FIM.
           EXIT.
		   
      
      *******************************
      *   PEGANDO O DIA DA SEMANA   *
      *******************************
	  
       ROTDIADASEMANA.
           MOVE ZEROS TO AUX AUX2
           COMPUTE AUX = ANOULTC - 1
           COMPUTE AUX = AUX * 365,25
           COMPUTE AUX= AUX + TABDIAMES(MESULTC)  + DIAULTC

           COMPUTE W-01 = ANOULTC / 4
           COMPUTE W-01 = W-01 * 4
           COMPUTE W-01 = ANOULTC - W-01


           IF MES > 2
              IF W-01 = ZEROS
                IF DIAULTC > 29
                  ADD 1 TO AUX.


           COMPUTE AUX2 = AUX / 7
           COMPUTE AUX2 = AUX2 * 7
           COMPUTE AUX = AUX - AUX2
           MOVE TDS(AUX + 1) TO DIASEMANA.
       ROTDIADASEMANA-FIM.
            EXIT.