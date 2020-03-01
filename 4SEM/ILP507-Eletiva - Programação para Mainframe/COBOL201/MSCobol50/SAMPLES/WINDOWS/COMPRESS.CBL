      $ set ans85 noosvs mf defaultbyte"00"
      ****************************************************************
      *                                                              *
      *                                                              *
      *                (C) Micro Focus Ltd. 1991                     *
      *                                                              *
      *                      COMPRESS.CBL                            *
      *                                                              *
      * Example program: Windows 3.0 File Compressor                 *
      *                                                              *
      ****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. compress.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
        special-names.
                call-convention 3 is WINAPI.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT customer-file ASSIGN "customer.dat"
                               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT compact-file ASSIGN "compact.dat"
                               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD   customer-file.
       1    customer-record.
        3   customer-number        PIC 9(4).
        3   customer-name.
         5  initial-1              PIC X.
         5  initial-2              PIC X.
         5  surname                PIC X(15).
        3   customer-address.
         5  street.
          7 house-number           PIC 999.
          7 street-name            PIC X(15).
         5  town                   PIC X(10).
         5  postcode               PIC X(8).
        3   amount-owing           PIC 9(6).
        3   credit-limit           PIC 9(4).

       FD  compact-file.
       1    compact-record.
        3   customer-number        PIC 9(4).
        3   customer-name.
         5  initial-1              PIC X.
         5  initial-2              PIC X.
         5  surname                PIC X(15).
        3   customer-addr-small    PIC X(30).
        3   amount-owing           PIC 9(6).
        3   credit-limit           PIC 9(4).

       WORKING-STORAGE SECTION.
       01 file-error               PIC 9.
           88 file-end             VALUE 1.
           88 not-file-end         VALUE 0.
       01 field-ptr                PIC 99.
       01 un-field-ptr             PIC 99.
       01 street-1                 PIC x(20).
       01 street-2                 PIC x(20).

       01 time-work-area.
           02 time-hours           pic 99.
           02 time-mins            pic 99.
           02 time-secs            pic 99.
           02 time-100s            pic 99.
       01 current-time             pic 9(9) comp-x.
       01 start-time-comp          pic 9(9) comp-x.
       01 time-taken-comp          pic 9(9) comp-x.

       01 x91-res                  pic 99 comp-x.
       01 x91-fun                  pic 99 comp-x value 35.
       01 x91-param.
          03 filler                pic 99 comp-x value 15.
          03 filler                pic x(15) value "WINHELLO.EXE ".

        linkage section.
        01  hInst                   pic xx   comp-5.
        01  hPrevInstance           pic xx   comp-5.
        01  lpszCmdLine             pic x(120).
        01  nCmdShow                pic xx   comp-5.
        procedure division WINAPI using  by value hInst
                                  by value hPrevInstance
                                  by reference lpszCmdLine
                                  by value nCmdShow.

           move 0 to time-taken-comp
           accept time-work-area from time
           perform convert-time
           move current-time to start-time-comp
           perform until time-taken-comp > 6000
             perform process-file
             accept time-work-area from time
             perform calc-time-taken
           end-perform
      *    call x"91" using x91-res x91-fun x91-param
           stop run.

       convert-time section.
           move time-hours to current-time
           multiply 60 by current-time
           add time-mins to current-time
           multiply 60 by current-time
           add time-secs to current-time
           multiply 100 by current-time
           add time-100s to current-time.

       calc-time-taken section.
           perform convert-time
           move current-time to time-taken-comp
           subtract start-time-comp from time-taken-comp.

       process-file section.
           OPEN INPUT customer-file
           OPEN OUTPUT compact-file
           SET not-file-end TO TRUE
           PERFORM WITH TEST AFTER UNTIL file-end
               INITIALIZE compact-record
               READ customer-file
                   AT END
                       SET file-end TO TRUE
                   NOT AT END
                       MOVE 1 TO field-ptr
                       MOVE CORRESPONDING customer-record
                                          TO compact-record
                       MOVE 1 TO un-field-ptr
                       UNSTRING street-name
                           DELIMITED BY " "
                           INTO street-1 street-2
                       STRING
                           house-number DELIMITED BY SIZE
                           "," DELIMITED BY SIZE
                           street-1 DELIMITED BY " "
                           " " DELIMITED BY SIZE
                           street-2 DELIMITED BY " "
                           ";" DELIMITED BY SIZE
                           town DELIMITED BY " "
                           ";" DELIMITED BY SIZE
                           INTO customer-addr-small
                           WITH POINTER field-ptr
                           ON OVERFLOW
                               DISPLAY "error"
                           NOT ON OVERFLOW
                               WRITE compact-record AFTER
                                       ADVANCING 1
                       END-STRING
               END-READ
           END-PERFORM
           CLOSE customer-file
           CLOSE compact-file.
