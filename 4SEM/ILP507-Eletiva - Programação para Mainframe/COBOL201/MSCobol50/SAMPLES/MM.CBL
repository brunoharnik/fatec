       01  VAR-1             PIC 9(018) COMP.
       DISPLAY SPACES AT 0101
       MOVE ZEROS   TO VAR-1
       PERFORM UNTIL 1 NOT = 1
            ADD 1 TO VAR-1
            DISPLAY VAR-1 AT 0210 WITH REVERSE-VIDEO
       END-PERFORM
