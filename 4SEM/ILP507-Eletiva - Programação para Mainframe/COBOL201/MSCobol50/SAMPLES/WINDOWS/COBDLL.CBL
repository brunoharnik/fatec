       linkage section.
       01  greeting        pic x(7).
       01  to-who          pic x(10).
       procedure division using greeting.
           move "Goodbye" to greeting

           exit program
           stop run.


       ENTRY "COBENTRY" using to-who.
           move "Everyone" to to-who

           exit program
           stop run.
