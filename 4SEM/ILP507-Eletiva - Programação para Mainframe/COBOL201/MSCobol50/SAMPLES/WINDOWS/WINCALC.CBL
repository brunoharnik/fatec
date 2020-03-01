      $set ans85 mf noosvs nobound
      ****************************************************************
      *
      *                (C) Micro Focus Ltd. 1989,1991
      *
      *                       WINCALC.CBL
      *
      * Example program: Windows 'RPN Calculator'
      *
      * A number of extensions to the COBOL language are used in
      * this program - see the comments in WINHELLO.CBL for details
      *
      * Application files:
      *     WINCALC.CBL      -   COBOL source file
      *     WINCALC.RES      -   Resources, created from :
      *       WINCALC.CUR   -   Hand icon for Area Sensitive Pointer
      *       WINCALC.ICO   -   Minimize Icon
      *       WINCALC.RC    -   Menu and Accelerate Table definition
      *       WINCALC.DLG   -   Dialog definition
      *
      * Tools used:
      *     COBOL           -   COBOL compiler      .CBL
      *     LINK            -
      *     RC              -   Resource compiler   .RC .DLG
      *     SDKPAINT        -   Icon editor creates .ICO and .CUR
      *
      * To compile:
      *
      *    cobol wincalc target(286) deffile deffiletype (windows) nodll;
      *    link wincalc cblwina,,, lcobolw lcobol libw, wincalc.def/nod/noe;
      *    rc wincalc.res
      *
      * where wincalc.def contains the lines:
      *
      *    NAME            WinCalc
      *    DESCRIPTION     'Windows RPN Calculator.'
      *    EXETYPE         WINDOWS 3.0
      *    STUB            'WINSTUB.EXE'
      *    CODE            PRELOAD FIXED
      *    DATA            PRELOAD FIXED MULTIPLE
      *    STACKSIZE       16384
      *    HEAPSIZE        1024
      *    EXPORTS         MWndProc
      *                    BWndProc
      *                    DlgProc
      *
      * This example program uses Windows to implement:
      *     A Standard Window with a Client Window Procedure
      *     Action Bar and pull downs (CUA conforming)
      *     Accelerator Keys
      *     Sending and Receiving messages
      *     Child Windows
      *     WindowWords
      *     An Area Sensitive Pointer (The pointer changes shape
      *                                when located over a
      *                                'pressable' button)
      *     Dialog Boxes
      *     Message Boxes
      *     Automatic window repositioning/resizing
      *
      * The Windows calls used are:
      *
      *     LoadIcon            :   loads an icon
      *     LoadCursor          :   loads a pointer
      *     GetStockObject      :   gets a system value
      *     GetModuleFileName   :   Get name of this module
      *     RegisterClass       :   Register window class
      *     GetClassInfo        :   Get details of a window class
      *     LoadMenu            :   loads a menu resource
      *     LoadAccelerators    :   loads an accelerator table
      *     CreateWindow        :   Create child window
      *     ShowWindow          :   makes a window visible
      *     UpdateWindow        :   sends paint message to the winproc
      *     DestroyWindow       :   Destroy window
      *     GetMessage          :   Get message from message queue
      *     TranslateAccelerator:   Tests for an accelerator key
      *     TranslateMessage    :   Translate message information
      *     DispatchMessage     :   Despatch message to WinProc
      *     SendMessage         :   Synchronous message
      *     PostMessage         :   Asynchronous message
      *     BeginPaint          :
      *     GetClientRect       :   Get client area dimensions
      *     FillRect            :   Fill a rectangle with a color
      *     EndPaint            :
      *     MessageBox          :   Initiate Message Box
      *     DialogBox           :   Initiate Dialog Box
      *     EndDialog           :   Terminate dialog box
      *     DefWindowProc       :   Default window proc
      *     CallWindowProc      :   Call a window procedure
      *     GetWindowWord       :   Retrieve window word
      *     SetWindowText       :   Assign text to child window
      *     SetCursor           :   Set the mouse pointer shape
      *     SendDlgItemMessage  :   Send message to dialog box item
      *     SetDlgItemInt       :   Send number to dialog box item
      *     GetDlgItemInt       :   Get number from dialog box item
      *     GetDlgItem          :   Get the handle of a dilaog box item
      *     SetFocus            :   Set input focus to an item
      *     MoveWindow          :   Size and Position window
      *     MessageBeep         :   Sound the bell
      *
      ****************************************************************

      ****************************************************************
      *
      *     Enable the PASCAL calling convention (number 3)
      *     and call it WINAPI because it is used for WINAPI
      *     functions.  (We will use it for COBOL to COBOL calls
      *     as well.
      *
      ****************************************************************
        special-names.
            call-convention 3 is WINAPI.

        working-storage section.

      ****************************************************************
      *
      * The following been taken from the Windows SDK Header files.
      *
      ****************************************************************
        78  WM-CREATE           value   h"01".
        78  WM-SIZE             value   h"05".
        78  WM-COMMAND          value   h"0111".
        78  WM-PAINT            value   h"0f".
        78  WM-CLOSE            value   h"10".
        78  WM-QUIT             value   h"12".
        78  WM-INITDLG          value   h"0110".
        78  WM-ERASEBACKGROUND  value   h"0014".
        78  WM-MOUSEMOVE        value   h"0200".
        78  EM-LIMITTEXT        value   h"0415".

        78  WC-BUTTON               value "button" & x"00".
        78  WC-STATIC               value "static" & x"00".
        78  GWW-ID                  value -12.
        78  DID-OK                  value 1.
        78  DID-CANCEL              value 2.

        01  work-data.
            03  hab                 pointer.
            03  hmq                 pointer.
            03  hwndClient          pic 9(4) comp-5.
            03  hwndFrame           pic 9(4) comp-5.
            03  hwndTemp            pic 9(4) comp-5.
            03  hwndMenu            pic 9(4) comp-5.
            03  hwndAccel           pic 9(4) comp-5.
            03  qmsg.
                05  qmsghwnd        pic 9(4) comp-5.
                05  qmsgmsg         pic 9(4) comp-5.
                05  qmsgmp1         pic 9(4) comp-5.
                05  qmsgmp2         pic s9(9) comp-5.
                05  qmsgtime        pic 9(9) comp-5.
                05  qmsgptl.
                    07  qmsgptlx    pic 9(4) comp-5.
                    07  qmsgptly    pic 9(4) comp-5.

            03  ptrH                pic 9(4) comp-5.
            03  pidInfo.
                05  pid             pic xx comp-5.
                05  tid             pic xx comp-5.
                05  ppid            pic xx comp-5.

            03  loop-flag           pic x value 'C'.
                88  loop-end            value 'E'.
            03  bool                pic 9(4) comp-5.
                88  boolTRUE            value 1.
                88  boolFALSE           value 0.


      ****************************************************************
      *
      * hwndTable contains details of each of the windows used in
      *         this application.
      *         The fields are:
      *
      *     SquareX:    number of buttons horizontally
      *     SquareY:    number of buttons vertically
      *
      *     id*     The offset into the array of this item,
      *             this is used to calculate the ID and WM for
      *             each button.
      *     hwnd*   Storage for the window handle.  This is only
      *             used for windows with variable contents
      *             (Display and Base in this example.)
      *     text*   The text to put on the button
      *     winXL   The left horizontal position  (in button co-ords)
      *     winYB   The bottom vertical position  (in button co-ords)
      *     winXR   The right horizontal position (in button co-ords)
      *     winYT   The top vertical position     (in button co-ords)
      *
      *               [base][   number display  ]
      *               [Hex] [+/-] [D] [E] [F] [/]
      *               [Dec] [Clx] [A] [B] [C] [*]
      *               [Oct] [x-y] [7] [8] [9] [-]
      *               [Bin]  [^]  [4] [5] [6] [+]
      *               [1/x]  [V]  [1] [2] [3] [Ent]
      *               [y^x] [Clr] [  0  ] [.] [er]
      *
      ****************************************************************
            03  hwndTable-x.
        78  hwndTS          value next.

        78  RelativeButton  value 3.
        78  RelativeGap     value 1.
        78  ButtonGap       value RelativeButton + RelativeGap.
        78  SquareX         value 6.
        78  SquareY         value 7.

        78  idDisplay       value 1.
                05  hwndDisplay     pic 9(4) comp-5.
                05  textDisplay     pic x(5).
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 6.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 6.
        78  id0             value 2.
                05  hwnd0           pic 9(4) comp-5.
                05  text0           pic x(5) value '0'.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 0.
        78  id1             value 3.
                05  hwnd1           pic 9(4) comp-5.
                05  text1           pic x(5) value '1'.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 1.
        78  id2             value 4.
                05  hwnd2           pic 9(4) comp-5.
                05  text2           pic x(5) value '2'.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 1.
        78  id3             value 5.
                05  hwnd3           pic 9(4) comp-5.
                05  text3           pic x(5) value '3'.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 1.
        78  id4             value 6.
                05  hwnd4           pic 9(4) comp-5.
                05  text4           pic x(5) value '4'.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 2.
        78  id5             value 7.
                05  hwnd5           pic 9(4) comp-5.
                05  text5           pic x(5) value '5'.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 2.
        78  id6             value 8.
                05  hwnd6           pic 9(4) comp-5.
                05  text6           pic x(5) value '6'.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 2.
        78  id7             value 9.
                05  hwnd7           pic 9(4) comp-5.
                05  text7           pic x(5) value '7'.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 3.
        78  id8             value 10.
                05  hwnd8           pic 9(4) comp-5.
                05  text8           pic x(5) value '8'.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 3.
        78  id9             value 11.
                05  hwnd9           pic 9(4) comp-5.
                05  text9           pic x(5) value '9'.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 3.
        78  idA             value 12.
                05  hwndA           pic 9(4) comp-5.
                05  textA           pic x(5) value 'A'.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 4.
        78  idB             value 13.
                05  hwndB           pic 9(4) comp-5.
                05  textB           pic x(5) value 'B'.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 4.
        78  idC             value 14.
                05  hwndC           pic 9(4) comp-5.
                05  textC           pic x(5) value 'C'.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 4.
        78  idD             value 15.
                05  hwndD           pic 9(4) comp-5.
                05  textD           pic x(5) value 'D'.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 5.
        78  idE             value 16.
                05  hwndE           pic 9(4) comp-5.
                05  textE           pic x(5) value 'E'.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 5.
        78  idF             value 17.
                05  hwndF           pic 9(4) comp-5.
                05  textF           pic x(5) value 'F'.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 5.
        78  idDP            value 18.
                05  hwndDP          pic 9(4) comp-5.
                05  textDP          pic x(5) value '.'.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 0.
        78  idChs           value 19.
                05  hwndChs         pic 9(4) comp-5.
                05  textChs         pic x(5) value '+/-'.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 5.
        78  idPlus          value 20.
                05  hwndPlus        pic 9(4) comp-5.
                05  textPlus        pic x(5) value '+'.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 2.
        78  idMinus         value 21.
                05  hwndMinus       pic 9(4) comp-5.
                05  textMinus       pic x(5) value '-'.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 3.
        78  idMultiply      value 22.
                05  hwndMultiply    pic 9(4) comp-5.
                05  textMultiply    pic x(5) value 'x'.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 4.
        78  idDivide        value 23.
                05  hwndDivide      pic 9(4) comp-5.
                05  textDivide      pic x(5) value '/'.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 5.
        78  idEnter         value 24.
                05  hwndEnter       pic 9(4) comp-5.
                05  textEnter       pic x(5) value 'Enter'.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 1.
        78  idRollDown      value 25.
                05  hwndRollDown    pic 9(4) comp-5.
                05  textRollDown    pic x(5) value x'5264'.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 0.
        78  idRollUp        value 26.
                05  hwndRollUp      pic 9(4) comp-5.
                05  textRollUp      pic x(5) value x'5275'.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 1.
        78  idClear         value 27.
                05  hwndClear       pic 9(4) comp-5.
                05  textClear       pic x(5) value 'Clear'.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 4.
        78  idClx           value 28.
                05  hwndClx         pic 9(4) comp-5.
                05  textClx         pic x(5) value 'Clr-X'.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 3.
        78  idHex           value 29.
                05  hwndHex         pic 9(4) comp-5.
                05  textHex         pic x(5) value x'486578'.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 5.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 5.
        78  idDec           value 30.
                05  hwndDec         pic 9(4) comp-5.
                05  textDec         pic x(5) value x'446563'.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 4.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 4.
        78  idOct           value 31.
                05  hwndOct         pic 9(4) comp-5.
                05  textOct         pic x(5) value x'4f6374'.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 3.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 3.
        78  idBin           value 32.
                05  hwndBin         pic 9(4) comp-5.
                05  textBin         pic x(5) value x'42696e'.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 2.
        78  idPower         value 33.
                05  hwndPower       pic 9(4) comp-5.
                05  textPower       pic x(5) value 'y^x'.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 0.
        78  idRecip         value 34.
                05  hwndRecip       pic 9(4) comp-5.
                05  textRecip       pic x(5) value '1/x'.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 1.
        78  idXchg          value 35.
                05  hwndXchg        pic 9(4) comp-5.
                05  textXchg        pic x(5) value x'783c3e79'.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 2.
                05  filler          pic xx   comp-5 value 1.
                05  filler          pic xx   comp-5 value 2.
        78  idBase          value 36.
                05  hwndBase        pic 9(4) comp-5.
                05  textBase        pic x(5).
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 6.
                05  filler          pic xx   comp-5 value 0.
                05  filler          pic xx   comp-5 value 6.

        78  hwndTableEnd    value next.
        78  hwndTableSize   value hwndTableEnd
                                        - hwndTS.
        78  hwndTableCount  value hwndTableSize / 15.
        78  hwndButtonLast  value hwndTableCount - 1.

            03  hwndTable redefines hwndTable-x.
              04  winItem         occurs hwndTableCount.
                05  hwndItem        pic 9(4) comp-5.
                05  hwndText        pic x(5).
                05  winXL           pic xx comp-5.
                05  winYB           pic xx comp-5.
                05  winXR           pic xx comp-5.
                05  winYT           pic xx comp-5.

        78  WM-USER                 value   h"4000".
        78  WM-UPDATEDISPLAY        value   h"4001".
        78  WM-NUMBER               value   h"4002".
        78  WM-ABOUT                value   h"400d".
        78  WM-CUSTOM               value   h"400e".
        78  WM-EXIT                 value   h"400f".
        78  WM-BUTTONS              value   h"4010".
        78  WM-0                    value   WM-BUTTONS + id0.
        78  WM-1                    value   WM-BUTTONS + id1.
        78  WM-2                    value   WM-BUTTONS + id2.
        78  WM-3                    value   WM-BUTTONS + id3.
        78  WM-4                    value   WM-BUTTONS + id4.
        78  WM-5                    value   WM-BUTTONS + id5.
        78  WM-6                    value   WM-BUTTONS + id6.
        78  WM-7                    value   WM-BUTTONS + id7.
        78  WM-8                    value   WM-BUTTONS + id8.
        78  WM-9                    value   WM-BUTTONS + id9.
        78  WM-A                    value   WM-BUTTONS + idA.
        78  WM-B                    value   WM-BUTTONS + idB.
        78  WM-C                    value   WM-BUTTONS + idC.
        78  WM-D                    value   WM-BUTTONS + idD.
        78  WM-E                    value   WM-BUTTONS + idE.
        78  WM-F                    value   WM-BUTTONS + idF.
        78  WM-DP                   value   WM-BUTTONS + idDP.
        78  WM-CHS                  value   WM-BUTTONS + idCHS.
        78  WM-PLUS                 value   WM-BUTTONS + idPlus.
        78  WM-MINUS                value   WM-BUTTONS + idMinus.
        78  WM-MULTIPLY             value   WM-BUTTONS + idMultiply.
        78  WM-DIVIDE               value   WM-BUTTONS + idDivide.
        78  WM-ENTER                value   WM-BUTTONS + idEnter.
        78  WM-ROLLDOWN             value   WM-BUTTONS + idRollDown.
        78  WM-ROLLUP               value   WM-BUTTONS + idRollUp.
        78  WM-CLEAR                value   WM-BUTTONS + idClear.
        78  WM-CLX                  value   WM-BUTTONS + idClx.
        78  WM-HEX                  value   WM-BUTTONS + idHex.
        78  WM-DEC                  value   WM-BUTTONS + idDec.
        78  WM-OCT                  value   WM-BUTTONS + idOct.
        78  WM-BIN                  value   WM-BUTTONS + idBin.
        78  WM-YPOWERX              value   WM-BUTTONS + idPower.
        78  WM-RECIP                value   WM-BUTTONS + idRecip.
        78  WM-XCHG                 value   WM-BUTTONS + idXchg.

        78  DI-BASEENTRY            value   "BaseEntry" & x"00".
        78  DI-BASE                 value   4.


      ****************************************************************
      *
      * Class styles are defined in the header files, so we have
      * to enquire of the C header files to get the appropriate
      * numbers.  CSClass     =     h"0003"   is CS_VREDRAW
      *                                     with CS_HREDRAW
      *           DisplayStyle= h"50000002"   is SS_RIGHT
      *                                     with WS_VISIBLE
      *                                     with WS_CHILD
      *           BaseStyle   = h"50000001"   is SS_CENTER
      *                                     with WS_VISIBLE
      *                                     with WS_CHILD
      *           ButtonStyle = h"50000000"   is WS_VISIBLE
      *                                     with WS_CHILD
      *           ctldata     = h"10cf0000"   is WS_OVERLAPPED
      *                                     with WS_CAPTION
      *                                      and WS_SYSMENU
      *                                      and WS_SIZEBOX
      *                                      and WS_MINIMIZEBOX
      *                                      and WS_MAXIMIZEBOX
      *
      ****************************************************************
            03  CSClass             pic 9(4) comp-5 value h"0003".
            03  DisplayStyle        pic 9(9) comp-5 value h"50000002".
            03  BaseStyle           pic 9(9) comp-5 value h"50000001".
            03  ButtonStyle         pic 9(9) comp-5 value h"50000000".
            03  ctldata             pic 9(9) comp-5 value h"00cf0000".

      ****************************************************************
      *
      * ASCIIZ strings to pass to Windows.
      *
      ****************************************************************
            03  MyClass             pic x(8) value 'RPNCalc' & x"00".
            03  AboutText           pic x(137) value
                    'This application is written in COBOL.'
                &   ' For more information on writing for Windows in CO'
                &   'BOL, see the WINHELLO.CBL example program source.'
                &   x"00".
            03  AboutTitle          pic x(15) value
                   'RPN Calculator' & x"00".
            03 MyButtonClass        pic x(11) value
                                    'ButtonCalc' & x"00".

      ****************************************************************
      *
      * Internal registers - we use COMP-3 for efficiency with
      *     very awkward numbers (18 9s in this case)
      *
      *     CalcRegisters is the set of registers
      *     CalcRegister  is a table of the individual registers
      *     Reg           is the value area
      *     RegDP         is the Fraction pointer for entering
      *                             non-integers
      *     modeFlag      indicates what last happened:
      *                             ENTER key
      *                             Number key (or DP)
      *                             Function key
      *
      *     RegInt      )
      *     RegFrac     ) are work areas
      *     RegWork     )
      *     Digit9/X      are used for creating ASCII digits
      *
      *     gBase         is the current (global) base
      *     gBaseD        is the maximum sensible digits in fraction
      *     gBase9        is used for displaying the base
      *
      *     RegSE         is the Size Error indicator
      *
      *     CalcRegisterDisplay is used for displaying a register.
      *
      ****************************************************************
            03  CalcRegisters.
              04  CalcRegister occurs 7.
                05  Reg                 pic s9(9)v9(9) comp-3.
        78  RegX                value 1.
        78  RegY                value 2.
        78  RegZ                value 3.
        78  RegT                value 4.
        78  RegLX               value 5.
            03  RegDP                   pic xx comp-5.
            03  modeFlag                pic x.
                88  modeEnter           value 'E'.
                88  modeFunction        value 'F'.
                88  modeNumber          value 'N'.
            03  RegInt                  pic 9(9) comp-3.
            03  RegFrac                 pic v9(9) comp-3.
            03  RegWork                 pic s9(9)v9(9) comp-3.
            03  Digit9                  pic x  comp-5.
            03  DigitX redefines Digit9 pic x.
            03  gBase                   pic xx comp-5.
            03  gBaseSav                pic xx comp-5.
            03  gBaseD                  pic xx comp-5.
        78  HexgBaseD           value 8.
        78  DecgBaseD           value 9.
        78  OctgBaseD           value 10.
        78  BingBaseD           value 30.
            03  gBase9bra               pic x value '('.
            03  gBase9                  pic z9.
            03  gBase9ket               pic x value ')'.
            03  gBase9Null              pic x value x'00'.
            03  RegSE                   pic x.
                88  SizeError           value 'E'.
                88  NoSizeError         value ' '.

            03  CalcRegisterDisplay.
                05  CalcRegX        pic x(50).
                05                  pic xxxx    value x'20202000'.
                05  CalcRegBase     pic x(70).
                05  CalcReg9 redefines CalcRegBase
                                    pic -(9)9.9(9).

            03  ModSize                 pic xx comp-5 value 255.
            03  ModName.
                05 ModName-Char         pic x occurs 255.

            03  WndClass.
                05  cstyle              pic 9(4) comp-5.
                05  lpfnWndProc         procedure-pointer.
                05  cbClsExtra          pic s9(4) comp-5.
                05  cbWndExtra          pic s9(4) comp-5.
                05  hInstance           pic 9(4) comp-5.
                05  hIcon               pic 9(4) comp-5.
                05  hCursor             pic 9(4) comp-5.
                05  hbrBackground       pic 9(4) comp-5.
                05  lpszMenuName        pointer.
                05  lpszClassName       pointer.

            03 BtnClass.
                05                      pic 9(4) comp-5.
                05  lpfnBtnProc         procedure-pointer.
                05                      pic s9(4) comp-5.
                05                      pic s9(4) comp-5.
                05  hbInstance          pic 9(4) comp-5.
                05                      pic 9(4) comp-5.
                05  hbCursor            pic 9(4) comp-5.
                05                      pic 9(4) comp-5.
                05  lpszbMenuName       pointer.
                05  lpszbClassName      pointer.
            03 DefBtnProc               procedure-pointer.

        local-storage section.
        01  hps                 pointer.
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
        01  rcs.
            03  sxLeft          pic x(2) comp-5.
            03  syBottom        pic x(2) comp-5.
            03  sxRight         pic x(2) comp-5.
            03  syTop           pic x(2) comp-5.

        01  ppl.
            03  x               pic x(2) comp-5.
            03  y               pic x(2) comp-5.
        01  mresult             pic x(4) comp-5.

        01  workarea.
            03  i               pic xx   comp-5.
            03  j               pic xx   comp-5.
            03  cx              pic xx   comp-5.
            03  cy              pic xx   comp-5.
            03  hwndWork        pic xx   comp-5.
            03  str             pic x(8).
            03  WndProc         procedure-pointer.

        linkage section.
        01  hwnd                pic xx   comp-5.
        01  msg                 pic xx   comp-5.
        01  mp1                 pic xx   comp-5.
        01  mp2                 pic xxxx comp-5.
        01  redefines mp2.
            03  mp2w1           pic xx   comp-5.
            03  mp2w2           pic xx   comp-5.
        01  Style redefines mp2 pic xxxx comp-5.
        01  Basex               pic xx   comp-5.
        01  Basey               pic xx   comp-5.
        01  Sizex               pic xx   comp-5.
        01  Sizey               pic xx   comp-5.
        01  PointSize.
            03  psx             pic xx   comp-5.
            03  psy             pic xx   comp-5.
        01  Text1               pic x(20).

        01  hInst                   pic xx   comp-5.
        01  hPrevInstance           pic xx   comp-5.
        01  lpszCmdLine             pic x(120).
        01  nCmdShow                pic xx   comp-5.

        procedure division WINAPI using  by value hInst
                                  by value hPrevInstance
                                  by reference lpszCmdLine
                                  by value nCmdShow.
        MyWinMain section.
            if hPrevInstance = 0
                move CSClass to cstyle
                set lpfnWndProc to entry "MWndProc"
                move 0 to cbClsExtra
                move 0 to cbWndExtra
                move hInst to hInstance
                call WINAPI "__LoadIcon" using
                                         by value hInstance
                                         by reference "CalcIcon" & x"00"
                        returning hIcon
                call WINAPI "__LoadCursor" using by value 0 size 2
                                by value h"00007f00" size 4
                        returning hCursor
                call WINAPI "__GetStockObject" using by value 0 size 2
                        returning hbrBackground
                set lpszMenuName to NULL
                set lpszClassName to address of MyClass
                call WINAPI '__RegisterClass' using WndClass
                        returning bool
                if boolFALSE
                        exit program returning 0
                end-if

      * Get the details about the button class, and create a new
      * button class from it to allow pointer control, as subclassing
      * of Windows controls is not permitted

                call WINAPI '__GetClassInfo' using
                                             by value 0 size 2
                                             by reference WC-BUTTON
                                             by reference BtnClass
                set DefBtnProc to lpfnBtnProc
                set lpfnBtnProc to entry "BWndProc"
                move hInst to hbInstance
                move 0 to hbCursor
                set lpszbMenuName to NULL
                set lpszbClassName to address of MyButtonClass
                call WINAPI '__RegisterClass' using BtnClass
                        returning bool
                if boolFALSE
                        exit program returning 0
                end-if
            end-if

      * get the name of the application
            call WINAPI '__GetModuleFileName'
                        using           by value hInstance
                                        by reference ModName
                                        by value ModSize
                        returning ModSize
      * strip the pathname from the module name
            perform until ModName = 0 or
                          ModName-Char (Modsize) = "\"
                subtract 1 from Modsize
            end-perform
            add 1 to Modsize

      * load the area sensitive pointer from the resource file
            call WINAPI '__LoadCursor'
                        using by value hInstance
                              by reference "CalcCursor" & x"00"
                        returning ptrH

      * load the menu from the resource file
            call WINAPI '__LoadMenu'
                        using by value hInstance
                              by reference "CalcMenuMenu" & x"00"
                        returning hwndMenu

      * load the accelerators from the resource file
            call WINAPI '__LoadAccelerators'
                        using by value hInstance
                              by reference "CalcAccel" & x"00"
                        returning hwndAccel

      * create the main window
            call WINAPI "__CreateWindow" using
                              by reference MyClass
                              by reference Modname-Char (Modsize)
                              by value     ctldata
                              by value     h"8000"     size 2
                              by value     0           size 2
                              by value     h"8000"     size 2
                              by value     0           size 2
                              by value     0           size 2
                              by value     hwndMenu
                              by value     hInstance
                              by value     0           size 4
                        returning hwndFrame
            call WINAPI "__ShowWindow" using
                              by value hwndFrame
                              by value nCmdShow
            call WINAPI "__UpdateWindow" using by value hwndFrame

            if hwndFrame not = 0

      ****************************************************************
      *
      * This in-line PERFORM implements the message loop.
      *
      ****************************************************************
                perform until loop-end
                    call WINAPI '__GetMessage'
                                using by reference qmsg
                                      by value 0        size 2
                                      by value 0        size 2
                                      by value 0        size 2
                                returning bool

                    if boolFALSE
                        set loop-end to true
                    else
                        call WINAPI '__TranslateAccelerator'
                                    using by value hwndFrame
                                          by value hwndAccel
                                          by reference qmsg
                                    returning bool
                        if boolFALSE
                           call WINAPI '__TranslateMessage'
                                           using by reference qmsg
                           call WINAPI '__DispatchMessage'
                                           using by reference qmsg
                        end-if

                end-perform

                call WINAPI '__DestroyWindow'
                            using by value hwndFrame

            end-if

            stop run.


      ****************************************************************
      *
      * Calculator's Window Procedure
      *
      ****************************************************************
        MyWndProc-S section.
        entry 'MWndProc' using by value hwnd
                              by value msg
                              by value mp1
                              by value mp2.

            move 0 to mresult
            evaluate msg

      ****************************************************************
      *
      * We process the CREATE message
      *     We create User Buttons for each of the screen areas.
      *
      ****************************************************************
                when WM-CREATE
                    call WINAPI '__CreateDisplay'
                                using by value hwnd
                                      by value DisplayStyle
                                      by value idDisplay    size 2
                                returning hwndDisplay
                    call WINAPI '__CreateDisplay'
                                using by value hwnd
                                      by value BaseStyle
                                      by value idBase       size 2
                                returning hwndBase

                    move id0 to i
                    perform until i > hwndButtonLast
                        call WINAPI '__CreateButton'
                                    using by value hwnd
                                          by value i
                                    returning hwndTemp
                        move hwndTemp to hwndItem(i)
                        add 1 to i
                    end-perform

                    move 10 to gBase
                    move 0 to gBaseSav
                    set NoSizeError to true
                    call WINAPI '__PostMessage'
                                using by value hwnd
                                      by value WM-CLEAR size 2
                                      by value 0        size 2
                                      by value 0        size 4

      ****************************************************************
      *
      * Button Presses come to the Window through the WM-COMMAND
      *             message, with mp1 as the Button Id.
      *         This Button Id is set the same as the message
      *             number which processes it.
      *         So we simply generate a message...
      *         Size Error condition is removed by any button,
      *             which then has no effect.
      *
      ****************************************************************
                when    WM-COMMAND
                    if mp1 > WM-USER
                        if SizeError
                            set NoSizeError to true
                            perform UpdateD
                        else
                            call WINAPI '__SendMessage'
                                        using by value hwnd
                                              by value mp1
                                              by value 0 size 2
                                              by value mp2
                        end-if
                    end-if

      ****************************************************************
      *
      * We process the SIZE message
      *     This involves positioning the individual buttons
      *     in the correct place.
      *
      *     mp2 contains the current size (w1 = x dimensions, w2 = y)
      *
      *     We partition the available space into SquareX by SquareY
      *         boxes, and pass these size chunks to PositionWindow
      *
      ****************************************************************
                when    WM-SIZE
                    move mp2w1 to x
                    move mp2w2 to y
                    move SquareX to i
                    multiply ButtonGap by i
                    add RelativeGap to i
                    divide i into x
                    move SquareY to i
                    multiply ButtonGap by i
                    add RelativeGap to i
                    divide i into y

                    perform varying i from 1 by 1
                            until i > hwndTableCount

                        call WINAPI '__PositionWindow'
                                    using by value hwndItem(i)
                                          by value winXL(i)
                                          by value winYB(i)
                                          by value winXR(i)
                                          by value winYT(i)
                                          by reference ppl

                    end-perform

      ****************************************************************
      *
      * We have to process the PAINT message
      * The sequence of actions is:
      *
      *     Get Handle-To-Presentation-Space (HPS) for painting
      *                         in the client window
      *     (Any drawing required could be put here...)
      *     Release the HPS.
      *
      *
      * WM-ERASEBACKGROUND is processed to enable the Frame to erase
      *     the backdrop of the ClientArea.
      *
      ****************************************************************
                when    WM-PAINT
                    call WINAPI '__BeginPaint'
                                using by value hwnd
                                      by reference ppaint
                                returning hps

                    call WINAPI '__GetClientRect'
                                using by value hwnd
                                      by reference rcl
                    call WINAPI '__FillRect'
                                using by value hps
                                      by reference rcl
                                      by value hbrBackground

                    call WINAPI '__EndPaint'
                                using by value hwnd
                                      by reference ppaint

                when    WM-ERASEBACKGROUND
                    move 1 to mresult
                    exit program returning mresult


      ****************************************************************
      *
      * We process our User defined messages
      *
      ****************************************************************
      *
      * WM-UPDATEDISPLAY updates the display window with the
      *                  current RegX value in the correct base
      *
      *         We have to watch out for the Error condition
      *         We use COBOL number conversion for Base 10
      *                 and do it by hand for other bases.
      *                 Fractional parts are limited by space
      *                 or sensible significance (gBaseD)
      *         We only update the BASE window if required
      *
      ****************************************************************
                when    WM-UPDATEDISPLAY
                    if SizeError
                        move length of CalcRegX to j
                        subtract 5 from j
                        move 'Error' to CalcRegX(j:5)
                    else
                        move all '0' to CalcRegBase
                        if gBase = 10
      *     COBOL Edited fields are useful for Decimal...
                            move Reg(RegX) to CalcReg9
                            move length of CalcReg9 to i
                        else
      *     Except for Base 10, we have to do it the hard way.
                            move length of CalcRegBase to j
      *     Initialize the DP
                            divide 2 into j
                            move '.' to CalcRegBase(j:1)
                            subtract 1 from j giving i
                            add 1 to j
      *     Fill in the Integral part
                            move Reg(RegX) to RegInt
                            perform until RegInt = 0
                                divide gBase into RegInt
                                        giving RegInt
                                        remainder Digit9
                                perform EnterDigit
                                subtract 1 from i
                            end-perform
      *     If Integer is zero, we show the zero
                            if j = i + 2
                                subtract 1 from i
                            end-if
      *     Fill in the sign
                            if Reg(RegX) < 0
                                move '-' to CalcRegBase(i:1)
                                subtract 1 from i
                            end-if
      *     SPACE fill the unused part
                            move spaces to CalcRegBase(1:i)
      *     Prepare for the fraction part
                            move j to i
                            move length of CalcRegBase to j
      *     Calculate how many digits are sensible
                            if j > gBaseD
                                move gBaseD to j
                                add i to j
                                add 1 to j
                            end-if
      *     Fill in the fraction part
                            move Reg(RegX) to RegFrac
                            perform until RegFrac = 0 or i = j
                                multiply RegFrac by gBase
                                            giving RegFrac
                                                   Digit9
                                perform EnterDigit
                                add 1 to i
                            end-perform
                            move length of CalcRegBase to i
                        end-if

      *     Now transfer to the display area
                        move spaces to CalcRegX
                        move length of CalcRegX to j
                        move 0 to cx
                        move 0 to cy
                        perform until i = 0 or CalcRegBase(i:1) = space
                            if CalcRegBase(i:1) not = '0'
                               or j < (length of CalcRegX)
                                move CalcRegBase(i:1) to CalcRegX(j:1)
                                if cy = 0
                                    add 1 to cx
                                end-if
                                if CalcRegBase(i:1) = '.'
                                    move 1 to cy
                                end-if
                                subtract 1 from j
                            end-if
                            subtract 1 from i
                        end-perform

      *     Special handling for trailing zeros on entered fraction
                        if modeNumber and RegDP > cx
                            subtract cx from RegDP giving cx
                            move j to i
                            subtract cx from j
                            move CalcRegX(i:) to CalcRegX(j:)
                            move length of CalcRegX to i
                            subtract cx from i
                            add 1 to i
                            move all '0' to CalcRegX(i:)
                        end-if
                    end-if

      *     And display...

                    call WINAPI '__SetWindowText'
                                using by value hwndDisplay
                                      by reference CalcRegX(j:1)
                    if gBase not = gBaseSav
                        move gBase to gBase9
                        move gBase to gBaseSav
                        call WINAPI '__SetWindowText'
                                    using by value hwndBase
                                          by reference gBase9Bra
                    end-if

      ****************************************************************
      *
      * WM-n messages are dispatched to WM-NUMBER with mp1 as the
      *             number entered
      *
      ****************************************************************
                when    WM-0 thru WM-F
                    subtract WM-0 from msg
                    call WINAPI '__SendMessage'
                                using by value hwnd
                                      by value WM-NUMBER size 2
                                      by value msg
                                      by value 0        size 4

      ****************************************************************
      *
      * WM-NUMBER must check the validity of the entered digit:
      *                 it must less than the current base
      *                 it must result in a valid number
      *                 fractional digits have to be handled
      *                     in a different way.
      * WM-DP           - Begin entry of fractional part
      * WM-CHS          - X -> -X
      *
      ****************************************************************
                when    WM-NUMBER
                    if mp1 >= gBase
                        perform SoundBeep
                    else
                        perform CheckMode
                        if RegDP = 0
                            multiply gBase by Reg(RegX)
                            on size error
                                perform SoundBeep
                            not on size error
                                add mp1 to Reg(RegX)
                                on size error
                                    perform SoundBeep
                                    divide gBase into Reg(RegX)
                                end-add
                            end-multiply
                        else
                            move 1 to RegWork
                            perform varying i from 1 by 1
                                    until i > RegDP
                                divide gBase into RegWork
                            end-perform
                            if RegWork not = 0
                                multiply mp1 by RegWork
                                add RegWork to Reg(RegX)
                                on size error
                                    perform SoundBeep
                                not on size error
                                    add 1 to RegDP
                                end-add
                            end-if
                        end-if
                        perform UpdateDRaw
                    end-if

                when    WM-DP
                    perform CheckMode
                    if RegDP = 0
                        move 1 to RegDP
                    end-if
                    perform UpdateDRaw

                when    WM-CHS
                    compute Reg(RegX) = - Reg(RegX)
                    perform UpdateDRaw

      ****************************************************************
      * General Functions:
      *     UpdateDRaw  - Update the display
      *     UpdateD     - Update the display after a function
      *     ZeroReg     - Zero a register
      *
      *
      * WM-ENTER        - End input of the current number
      * WM-ROLLUP       - X -> Y -> Z -> T -> X
      * WM-ROLLDOWN     - X -> T -> Z -> Y -> X
      * WM-CLEAR        - 0 -> X, Y, Z, T
      * WM-CLX          - 0 -> X
      * WM-XCHG         - X -> Y -> X
      * WM-PLUS         - Y+X -> X, T -> Z -> Y
      * WM-MINUS        - Y-X -> X, T -> Z -> Y
      * WM-MULTIPLY     - Y*X -> X, T -> Z -> Y
      * WM-DIVIDE       - Y/X -> X, T -> Z -> Y
      * WM-YPOWERX      - Y^X -> X, T -> Z -> Y
      * WM-RECIP        - 1/X -> X
      * WM-HEX          - Set base as 16
      * WM-DEC          - Set base as 10
      * WM-OCT          - Set base as  8
      * WM-BIN          - Set base as  2
      * WM-CUSTOM       - Set base using Dialog Box
      * WM-EXIT         - Exits Calculator
      * WM-ABOUT        - Basic Help
      *
      ****************************************************************
                when    WM-ENTER
                    set modeEnter to true
                    perform RollEnter

                when    WM-ROLLUP
                    perform RollUp
                    perform UpdateD

                when    WM-ROLLDOWN
                    perform RollDown
                    perform UpdateD

                when    WM-CLEAR
                    perform varying i from RegX by 1
                            until i > RegLX
                        call '__ZeroReg' using by value i
                    end-perform
                    perform UpdateD

                when    WM-CLX
                    call '__ZeroReg' using by value RegX size 2
                    perform UpdateD

                when    WM-XCHG
                    move Reg(RegX) to Reg(RegLX)
                    move Reg(RegY) to Reg(RegX)
                    move Reg(RegLX) to Reg(RegY)
                    perform UpdateDRaw

                when    WM-PLUS
                    perform RollAction
                    add Reg(RegLX) to Reg(RegX)
                        on size error set SizeError to true
                    end-add
                    perform UpdateD

                when    WM-MINUS
                    perform RollAction
                    subtract Reg(RegLX) from Reg(RegX)
                        on size error set SizeError to true
                    end-subtract
                    perform UpdateD

                when    WM-MULTIPLY
                    perform RollAction
                    multiply Reg(RegLX) by Reg(RegX)
                        on size error set SizeError to true
                    end-multiply
                    perform UpdateD

                when    WM-DIVIDE
                    perform RollAction
                    divide Reg(RegLX) into Reg(RegX)
                        on size error set SizeError to true
                    end-divide
                    perform UpdateD

                when    WM-YPOWERX
                    perform RollAction
                    compute Reg(RegX) = Reg(RegX) ** Reg(RegLX)
                        on size error set SizeError to true
                    end-compute
                    perform UpdateD

                when    WM-RECIP
                    move Reg(RegX) to Reg(RegLX)
                    compute Reg(RegX) = 1 / Reg(RegX)
                        on size error set SizeError to true
                    end-compute
                    perform UpdateD

                when    WM-HEX
                    move 16 to gBase
                    move HexgBaseD to gBaseD
                    perform UpdateD

                when    WM-DEC
                    move 10 to gBase
                    move DecgBaseD to gBaseD
                    perform UpdateD

                when    WM-OCT
                    move  8 to gBase
                    move OctgBaseD to gBaseD
                    perform UpdateD

                when    WM-BIN
                    move  2 to gBase
                    move BingBaseD to gBaseD
                    perform UpdateD

                when    WM-CUSTOM
                    set WndProc to ENTRY 'DlgProc'
                    call WINAPI '__DialogBox'
                                using by value hInstance
                                      by reference DI-BASEENTRY
                                      by value hwnd
                                      by value WndProc

                    move 1 to RegWork
                    move 0 to gBaseD
                    perform until RegWork = 0
                        divide gBase into RegWork
                        add 1 to gBaseD
                    end-perform
                    perform UpdateD

                when    WM-CLOSE
                when    WM-EXIT
                    call WINAPI '__PostMessage'
                                using by value hwnd
                                      by value WM-QUIT size 2
                                      by value 0 size 2
                                      by value 0 size 4

                when    WM-ABOUT
                    call WINAPI '__MessageBox'
                                using by value hwnd
                                      by reference AboutText
                                      by reference AboutTitle
                                      by value 0 size 2

      ****************************************************************
      *
      *  All other messages are despatched to the default
      *  window procedure according to the Windows rules.
      *
      ****************************************************************

                when other
                    call WINAPI '__DefWindowProc'
                                using by value hwnd
                                      by value msg
                                      by value mp1
                                      by value mp2
                                returning mresult

            end-evaluate

            exit program returning mresult.

      ****************************************************************
      *
      * Button Window Procedure
      *
      *  This simply changes the pointer when over a button
      *
      ****************************************************************
        ButtonWndProc-S section.
        entry 'BWndProc' using by value hwnd
                              by value msg
                              by value mp1
                              by value mp2.

            move 0 to mresult
            evaluate msg
                when WM-MOUSEMOVE
                    call WINAPI '__GetWindowWord'
                                using by value hwnd
                                      by value GWW-ID size 2
                                returning i
                    evaluate i
                        when WM-0 thru WM-F
                            subtract WM-BUTTONS from i
                            subtract id0 from i
                            if i < gBase
                                move 1 to i
                            else
                                move 0 to i
                            end-if
                        when other
                            move 1 to i
                    end-evaluate
                    if i = 1
                        call WINAPI '__SetCursor'
                                    using by value ptrH
                    else
                        call WINAPI '__SetCursor'
                                    using by value hCursor
                    end-if
                    move 1 to mresult

                when other

                    call WINAPI '__CallWindowProc'
                                using by value DefBtnProc
                                      by value hwnd
                                      by value msg
                                      by value mp1
                                      by value mp2
                                returning mresult

            end-evaluate

            exit program returning mresult.

      ****************************************************************
      *
      * Dialog Box procedure
      *
      ****************************************************************
        DialogWndProc-S section.
        entry 'DlgProc' using by value hwnd
                              by value msg
                              by value mp1
                              by value mp2.

            move 0 to mresult
            evaluate msg
                when    WM-INITDLG
                    call WINAPI '__SendDlgItemMessage'
                                using by value hwnd
                                      by value DI-BASE         size 2
                                      by value EM-LIMITTEXT    size 2
                                      by value 3               size 2
                                      by value 0               size 4
                    call WINAPI '__SetDlgItemInt'
                                using by value hwnd
                                      by value DI-BASE size 2
                                      by value gBase
                                      by value 0       size 2

      * set input focus onto the Base entry field
                    call WINAPI '__GetDlgItem'
                                using by value hwnd
                                      by value DI-BASE size 2
                                returning hwndWork
                    call WINAPI '__SetFocus'
                                using by value hwndWork

                when    WM-COMMAND
                    evaluate mp1
                        when DID-OK
                            call WINAPI '__GetDlgItemInt'
                                        using by value hwnd
                                              by value DI-BASE size 2
                                              by reference i
                                              by value 0       size 2
                                        returning j
                            if j < 2 or j > 36
                                perform SoundBeep
                            else
                                move j to gBase
                            end-if

                            call WINAPI '__EndDialog'
                                        using by value hwnd
                                              by value 1 size 2

                        when DID-CANCEL
                            call WINAPI '__EndDialog'
                                        using by value hwnd
                                              by value 1 size 2

                    end-evaluate

            end-evaluate

            exit program returning mresult.


      ****************************************************************
      *
      * Position Window: We use the input parameters to calculate
      *                  the actual position and size of a window
      *                  And then issue a WinSetWindowPos to
      *                  place the window correctly.
      *
      ****************************************************************
        PositionWindow-S Section.
        entry 'PositionWindow' using by value hwnd
                                     by value BaseX
                                     by value BaseY
                                     by value SizeX
                                     by value SizeY
                                     by reference PointSize.

            move     BaseX       to sxLeft
            multiply ButtonGap   by sxLeft
            add      RelativeGap to sxLeft
            multiply psx         by sxLeft

            move     SizeX       to sxRight
            add      RelativeGap to sxRight
            multiply ButtonGap   by sxRight
            multiply psx         by sxRight
            subtract sxLeft    from sxRight

            move     6           to syTop
            subtract SizeY       from syTop
            multiply ButtonGap   by syTop
            add      RelativeGap to syTop
            multiply psy         by syTop

            move     6           to syBottom
            subtract BaseY       from syBottom
            add      RelativeGap to syBottom
            multiply ButtonGap   by syBottom
            multiply psy         by syBottom
            subtract syTop       from syBottom

      * The following is more descriptive but less efficient.
      *
      * compute sxLeft   =
      *         psx * ( ButtonGapRatio * BaseX + RelativeGap )
      * compute sxRight  =
      *         psx * ButtonGapRatio * ( SizeX + RelativeGap )
      *               - sxLeft
      * compute syBottom =
      *         psy *  ButtonGapRatio * (BaseY + RelativeGap )
      *               - syTop
      * compute syTop    =
      *         psy * ( ButtonGapRatio * SizeY + RelativeGap )

            call WINAPI '__MoveWindow'
                        using by value hwnd
                              by value sxLeft
                              by value syTop
                              by value sxRight
                              by value syBottom
                              by value 1           size 2

            exit program.


      ****************************************************************
      *
      * CreateDisplay: Create windows to be used for outputing
      *                numbers to the screen
      *                This is used for the X Register and the BASE
      *
      ****************************************************************
        CreateDisplay-S Section.
        entry 'CreateDisplay' using by value hwnd
                                    by value Style
                                    by value msg.

            call WINAPI '__CreateWindow'
                        using by reference WC-STATIC
                              by value      0           size 4
                              by value      Style
                              by value      0            size 2
                              by value      0            size 2
                              by value      0            size 2
                              by value      0            size 2
                              by value      hwnd
                              by value      msg
                              by value      hInstance
                              by value      0           size 4

                        returning hwnd

            exit program returning hwnd.


      ****************************************************************
      *
      * CreateButton: Each BUTTON on the screen needs to be
      *               created as a separate window.
      *               We give it a ID (which it sends to its owner
      *               when it is pressed) identical to the
      *               message id of its processing routine.
      *               We also initialize the text.
      *               We use our own class for the buttons for
      *               pointer control
      *
      ****************************************************************
        CreateButton-S Section.
        entry 'CreateButton' using by value hwnd
                                   by value msg.

            move msg to i
            add WM-BUTTONS to i

      * The string to WinSetWindowText should be NULL terminated
            move hwndText(msg) to str
            inspect str replacing first space by x'00'

            call WINAPI '__CreateWindow'
                        using by reference  MyButtonClass
                              by reference  str
                              by value      ButtonStyle
                              by value      0           size 2
                              by value      0           size 2
                              by value      0           size 2
                              by value      0           size 2
                              by value      hwnd
                              by value      i
                              by value      hInstance
                              by value      0           size 4

                        returning hwnd

            exit program returning hwnd.

      ****************************************************************
      *
      * ZeroReg - a function which sets register 'msg' to zero.
      *           This has been localised to minimise the impact
      *           of a change in the internal definition of the
      *           registers.
      *
      ****************************************************************
        ZeroReg-S Section.
        entry 'ZeroReg' using by value msg.

            move 0 to Reg(msg)
            move 0 to RegDP
            exit program.

      ****************************************************************
      *
      * SoundBeep - Sound the bell.
      *
      ****************************************************************
        SoundBeep Section.
            call WINAPI '__MessageBeep'
                        using by value 0 size 2.

      ****************************************************************
      *
      * Miscellaneous Subroutines:
      *
      * UpdateDRaw  -   Generate a message to force update of RegX
      * UpdateD     -   Also sets mode to Function
      * RollEnter   -   Register Rolling for ENTER
      * RollUp      -   Register Rolling for ROLLUP
      * RollDown    -   Register Rolling for ROLLDOWN
      * RollAction  -   Register Rolling for PLUS/MINUS etc.
      * EnterDigit  -   Turn Digit9 to ASCII (DigitX) and store
      * CheckMode   -   Handles the mode checking for entry of
      *                     a digit or a DP char.
      *
      ****************************************************************
        UpdateD Section.
            set modeFunction to true
            perform UpdateDRaw.

        UpdateDRaw Section.
            call WINAPI '__SendMessage'
                        using by value hwnd
                              by value WM-UPDATEDISPLAY size 2
                              by value 0                size 2
                              by value 0                size 4.

        RollEnter Section.
            move Reg(RegZ) to Reg(RegT)
            move Reg(RegY) to Reg(RegZ)
            move Reg(RegX) to Reg(RegY).

        RollUp Section.
            move Reg(RegT) to RegWork
            perform RollEnter
            move RegWork to Reg(RegX).

        RollDown Section.
            perform RollAction
            move Reg(RegLX) to Reg(RegT).

        RollAction Section.
            move Reg(RegX) to Reg(RegLX)
            move Reg(RegY) to Reg(RegX)
            move Reg(RegZ) to Reg(RegY)
            move Reg(RegT) to Reg(RegZ).

        EnterDigit Section.
            if Digit9 > 9
                add 7 to Digit9
            end-if
            add h"30" to Digit9
            move DigitX to CalcRegBase(i:1).

        CheckMode Section.
            if modeFunction
                perform RollEnter
                set modeEnter to true
            end-if
            if modeEnter
                call '__ZeroReg' using by value RegX size 2
            end-if
            set modeNumber to true.
