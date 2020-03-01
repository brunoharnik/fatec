      $	set ans85 noosvs mf defaultbyte"00"
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WinHello.

      ****************************************************************
      *                                                              *
      *                                                              *
      *                (C) Micro Focus Ltd. 1991                     *
      *                                                              *
      *                      WINHELLO.CBL                            *
      *                                                              *
      * Example program: Windows 3.0 'Hello World'                   *
      *                                                              *
      ****************************************************************
      * The following DEF file should be used when this program is   *
      * linked:                                                      *
      *                                                              *
      *    NAME            WinCbl                                    *
      *    DESCRIPTION     'Welcome to COBOL and Windows.'           *
      *    EXETYPE         WINDOWS 3.0                               *
      *    STUB            'WINSTUB.EXE'                             *
      *    CODE            PRELOAD FIXED                             *
      *    DATA            PRELOAD FIXED MULTIPLE                    *
      *    STACKSIZE       16384                                     *
      *    HEAPSIZE        1024                                      *
      *    EXPORTS         MYWNDPROC                                 *
      *                                                              *
      ****************************************************************
      *                                                              *
      * Windows Programming                                          *
      *                                                              *
      * Please refer to printed and on-line documentation for more   *
      * information on Windows programming with COBOL.               *
      *                                                              *
      ****************************************************************
      *                                                              *
      * About WINHELLO                                               *
      *                                                              *
      * A number of extensions to the COBOL language are used in     *
      * this program, and are noted in comments where they occur.    *
      * See the documentation and release notes for full description *
      * etc.                                                         *
      *                                                              *
      * To write your own Windows programs in COBOL, we recommend    *
      * that you use this program as a base.                         *
      *                                                              *
      ****************************************************************

      ****************************************************************
      *                                                              *
      * COBOL Extension: Special-names.                              *
      *                                                              *
      *     call-conventions are supported as below.                 *
      *                                                              *
      *     The meaning of the numbers is derived from decomposing   *
      *     the number into binary components, with bits having      *
      *     the following meanings:                                  *
      *                                                              *
      *     0   -   no bits specified means that the standard        *
      *             COBOL Calling conventions are                    *
      *             employed.  This means parameters are passed      *
      *             on a stack, last named is first pushed on the    *
      *             stack.  The parameters are removed from the      *
      *             stack by the CALLer.                             *
      *             Use this for compatibility with existing COBOL   *
      *             programs.                                        *
      *     1   -   parameters are passed on a stack, first named    *
      *             is first pushed.  So you could call this         *
      *             convention 'REVERSED'                            *
      *     2   -   The parameters are removed from the stack        *
      *             by the called routine                            *
      *                                                              *
      *                                                              *
      *     So, we get the 'WINAPI' convention used by Windows as    *
      *     convention 3. This convention is alternatively known as  *
      *     the PASCAL calling convention.                           *
      *                                                              *
      ****************************************************************
	special-names.
                call-convention 3 is WINAPI.
	data division.
        working-storage section.

      ****************************************************************
      *                                                              *
      * Microsoft Windows SDK supplies an include file WINDOWS.H     *
      * containing data types and constants for Windows programming. *
      * In COBOL we have to scan the C header files and create our   *
      * own constants with the appropriate values.                   *
      * This can be done automatically if required using the program *
      * H2CPY.EXE provided with this COBOL system.                   *
      *                                                              *
      * In this program, we are using the WM-PAINT and WM-DESTROY    *
      * messages.                                                    *
      * To translate values from C constants to COBOL constants,     *
      * use the following rules:                                     *
      *                                                              *
      *                     C           COBOL                        *
      *     Hexadecimal   0xnn          h"nn"                        *
      *     Decimal         nn            nn                         *
      *                                                              *
      ****************************************************************

        78  WM-PAINT            value h"000F".
        78  WM-DESTROY          value h"0002".

      ****************************************************************
      *                                                              *
      * The supplied C header file defines data types for all the    *
      * Windows data items.  In COBOL, we have to use the COBOL data *
      * types.                                                       *
      *                                                              *
      * As a general conversion rule:                                *
      *                                                              *
      *     'C'         COBOL                                        *
      *     SHORT       PIC S9(4) COMP-5                             *
      *     USHORT      PIC 9(4)  COMP-5                             *
      *     LONG        PIC S9(9) COMP-5                             *
      *     ULONG       PIC 9(9)  COMP-5                             *
      *     PVOID       POINTER             (similarly for other     *
      *                                     pointer types)           *
      *     LHANDLE     PIC 9(9)  COMP-5 )  (These are equivalent    *
      *     LHANDLE     PPOINTER         )  for Windows working      *
      *                         LHANDLE is used for any 32bit        *
      *                         handle, eg HAB, HMQ, HPS etc.        *
      *                                                              *
      *     NB  PIC 9(4) COMP-5 is identical to PIC X(2) COMP-5      *
      *     NB  PIC 9(9) COMP-5 is identical to PIC X(4) COMP-5      *
      *                                                              *
      ****************************************************************

      ****************************************************************
      *                                                              *
      * COBOL Extension: Procedure-pointers                          *
      *                                                              *
      *     Data pointers are now complemented by procedure pointers *
      *                                                              *
      ****************************************************************

        01  MyWndProc    	procedure-pointer.

      ****************************************************************
      *                                                              *
      * An ASCIIZ string is a zero-terminated string. That is, the   *
      * last character in the string must have the ASCII value of 0  *
      * (ASCII null). Many of the calls to the Windows API require   *
      * ASCIIZ strings.                                              *
      *                                                              *
      * However they are not natural with COBOL, and in particular   *
      * are not suitable for use as literals.                        *
      *                                                              *
      * Where ASCIIZ strings are used, they must be declared in      *
      * Working-Storage and followed by a x"00" NULL terminator.     *
      *                                                              *
      ****************************************************************

	01  MyClassName		pic x(20) value "Welcome1" & x"00".

	01  MyData.
	    03	loop-flag	    pic x value 'C'.
		88  loop-end		value 'E'.
	    03	bool		    pic 9(4) comp-5.
		88  boolTRUE		value 1.
                88  boolFALSE           value 0.

	01  WndClass.
	    03  style			pic 9(4) comp-5.
	    03  lpfnWndProc		procedure-pointer.
	    03  cbClsExtra		pic s9(4) comp-5.
	    03  cbWndExtra		pic s9(4) comp-5.
	    03  hInstance		pic 9(4) comp-5.
	    03  hIcon			pic 9(4) comp-5.
	    03  hCursor			pic 9(4) comp-5.
	    03  hbrBackground		pic 9(4) comp-5.
	    03  lpszMenuName		pointer.
	    03  lpszClassName		pointer.

      ****************************************************************
      *                                                              *
      * Structures are supplied in C header files, and must be       *
      * converted to COBOL format to be used.                        *
      * Below is a MSG structure, and in LOCAL-STORAGE section       *
      * is an example of an LPPAINTSTRUCT structure (ppaint)         *
      *                                                              *
      ****************************************************************
	01  msg.
	    03  msg-hwnd		pic 9(4) comp-5.
	    03  msg-message		pic 9(4) comp-5.
	    03  msg-wParam		pic 9(4) comp-5.
	    03  msg-lParam		pic s9(9) comp-5.
	    03  msg-time		pic 9(9) comp-5.
	    03  msg-pt.
		05  msg-pt-x		pic 9(4) comp-5.
		05  msg-pt-y		pic 9(4) comp-5.

      ****************************************************************
      *                                                              *
      * COBOL Extension: Local-Storage Section.                      *
      * COBOL Extension: Recursion                                   *
      *                                                              *
      *     Any data declared in the LOCAL-STORAGE SECTION is        *
      *     created freshly for each instance of the program.        *
      *     This data cannot currently be initialised.               *
      *                                                              *
      ****************************************************************
        local-storage SECTION.
	01  MyData.
            03  mResult                 pic 9(9) comp-5.
	    03  tmpFlag			pic 9(4) comp-5.
	    03  hWindow 		pic 9(4) comp-5.

        01  hps                         pic x(4) comp-5.
        01  ppaint.
            03  hdc                     pic x(4) comp-5.
            03 fErase                   pic s9(4) comp-5.
            03  rcl.
                05  xLeft               pic s9(4) comp-5.
                05  yTop                pic s9(4) comp-5.
                05  xRight              pic s9(4) comp-5.
                05  yBottom             pic s9(4) comp-5.
            03 fRestore                 pic s9(4) comp-5.
            03 fUpdate                  pic s9(4) comp-5.
            03 rgbdata                  pic x occurs 16.

        linkage section.
        01  hWnd   		    pic x(2) comp-5.
        01  iMessage                pic 9(4) comp-5.
        01  wParam                  pic 9(4) comp-5.
        01  lParam                  pic s9(9) comp-5.
        01  hInst                   pic xx   comp-5.
        01  hPrevInstance           pic xx   comp-5.
        01  lpszCmdLine             pic x(120).
        01  nCmdShow                pic xx   comp-5.

      ****************************************************************
      *                                                              *
      * COBOL Extension: Call-conventions                            *
      *                                                              *
      *     This use of the call-convention WINAPI (declared above   *
      *     in special-names) means that all the entry points in     *
      *     this program follow the OS2API calling convention.       *
      *                                                              *
      ****************************************************************
        procedure division WINAPI using  by value hInst
                                  by value hPrevInstance
                                  by reference lpszCmdLine
                                  by value nCmdShow.
        MyWinMain section.
	    if hPrevInstance = 0
		move 3 to style
		set lpfnWndProc to entry "MyWndProc"
		move 0 to cbClsExtra
		move 0 to cbWndExtra
		move hInst to hInstance
                call WINAPI "__LoadIcon" using by value 0 size 2
                                by value h"00007f00" size 4
			returning hIcon
                call WINAPI "__LoadCursor" using by value 0 size 2
				by value h"00007f00" size 4
			returning hCursor
                call WINAPI "__GetStockObject" using by value 0 size 2
			returning hbrBackground
		set lpszMenuName to NULL
		set lpszClassName to address of MyClassName
                call WINAPI '__RegisterClass' using WndClass
			returning tmpFlag
		if tmpFlag = 0
			exit program returning 0
		end-if
	    end-if
            call WINAPI "__CreateWindow" using by reference MyClassName
			by reference "COBOL & Windows" & x"00"
			by value h"00CF0000" size 4
			by value h"8000" size 2
                        by value 0 size 2
			by value h"8000" size 2
                        by value 0 size 2
			by value 0 size 2
			by value 0 size 2
			by value hInst
			by value 0 size 4
			returning hWindow
            call WINAPI "__ShowWindow" using by value hWindow
                        by value nCmdShow
            call WINAPI "__UpdateWindow" using by value hWindow

      ****************************************************************
      *                                                              *
      * This in-line PERFORM implements the message loop.            *
      *                                                              *
      ****************************************************************
	    perform until loop-end
                call WINAPI '__GetMessage' using
			by reference msg
			by value 0 size 2
			by value 0 size 2
			by value 0 size 2
		  	returning bool
		if boolFALSE
			set loop-end to true
		else
                        call WINAPI '__TranslateMessage'
					using by reference msg
                        call WINAPI '__DispatchMessage'
					using by reference msg
		end-if
	    end-perform

            exit program returning msg-wParam
            stop run.

      ****************************************************************
      *                                                              *
      * The first ever Windows COBOL window procedure!               *
      *                                                              *
      ****************************************************************

  	MyWindowProcedure SECTION.
      ****************************************************************
      *                                                              *
      * COBOL Extension: ENTRY USING BY VALUE                        *
      * COBOL Extension: Recursion                                   *
      *                                                              *
      *     To complement the CALL USING BY VALUE, we now allow      *
      *     ENTRY USING BY VALUE.                                    *
      *                                                              *
      *     COBOL being recursive means that the call to             *
      *     CreateWindow (above) can lead to control being           *
      *     passed to this entry point.                              *
      *     In fact, any of the calls in this section could lead     *
      *     to control being passed to a new instance of this        *
      *     entry point (hence the need for LOCAL-STORAGE SECTION.)  *
      *                                                              *
      ****************************************************************
        entry "MyWndProc" using by value hWnd
                                by value iMessage
                                by value wParam
                                by value lParam.
            move 0 to mResult
	    evaluate iMessage

      ****************************************************************
      *                                                              *
      * The only message we are interested in is the PAINT message   *
      * The sequence of actions is:                                  *
      *                                                              *
      *     Get Handle-To-Presentation-Space (HPS) for painting      *
      *                         in the client window                 *
      *     Fill the window with the System Background colour        *
      *     Write the words 'Hello COBOL World' at position (70,70)  *
      *     Release the HPS.                                         *
      *                                                              *
      ****************************************************************

              when WM-PAINT
                call WINAPI '__BeginPaint'
                            using by value hwnd
                                  by reference ppaint
                            returning hps

                call WINAPI '__FillRect'
                            using by value hps
                                  by reference rcl
                                  by value hbrBackground

                call WINAPI '__GetClientRect'
                            using by value hwnd
                                  by reference rcl
                call WINAPI '__DrawText'
                            using by value hps
                                  by reference 'Hello COBOL World'
                                  by value 17 size 2
                                  by reference rcl
                                  by value h"25" size 2

                call WINAPI '__EndPaint'
                            using by value hwnd
                                  by reference ppaint

	      when WM-DESTROY
                call WINAPI '__PostQuitMessage' using by value 0 size 2

      ****************************************************************
      *                                                              *
      *     All other messages are despatched to the default         *
      *     window procedure according to the Windows rules          *
      *                                                              *
      ****************************************************************

	      when other
                call WINAPI "__DefWindowProc"
  			using by value hWnd
		    	      by value iMessage
			      by value wParam
 			      by value lParam
                        returning mResult
	    end-evaluate

      ****************************************************************
      *                                                              *
      * COBOL Extension: RETURNING phrase                            *
      *                                                              *
      *     To complement the RETURNING phrase on the CALL, you      *
      *     can also use the RETURNING phrase on the EXIT.           *
      *                                                              *
      ****************************************************************
            exit program returning mResult.
