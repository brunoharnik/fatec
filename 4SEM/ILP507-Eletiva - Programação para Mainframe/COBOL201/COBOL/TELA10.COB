
       01  TELAAMIGO.
           05  BLANK SCREEN.
           05  LINE 03  COLUMN 01 
               VALUE  "                           CADASTRO DE A".
           05  LINE 03  COLUMN 41 
               VALUE  "MIGOS".
           05  LINE 04  COLUMN 01 
               VALUE  "дддддддддддддддддддддддддддддддддддддддд".
           05  LINE 04  COLUMN 41 
               VALUE  "дддддддддддддддддддддддддддддддддддддддд".
           05  LINE 05  COLUMN 01 
               VALUE  "    здддддддддддддддддддддддд©".
           05  LINE 06  COLUMN 01 
               VALUE  "    Ё  APELIDO               Ё".
           05  LINE 07  COLUMN 01 
               VALUE  "    юдддддддддддддддддддддддды".
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
               VALUE  "       UNIDADE DA FEDERA─AO".
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
