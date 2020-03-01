      $SET ANS85 NOOSVS MF DEFAULTBYTE"00" REMOVE(IGNORE)
      ****************************************************************
      *
      *                (C) Micro Focus Ltd. 1989,1991
      *
      *                        SYSMETS.CBL
      *
      *   COBOL Version of the SYSMETS program in the book
      *  "Programming Windows" by Charles Petzold.
      *
      ****************************************************************

       SPECIAL-NAMES.
           CALL-CONVENTION 3 IS WinApi
           CALL-CONVENTION 4 IS System-Call.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY "WINDOWS.78".
       COPY "SYSMETS.CPY".

       01 Wndproc-Ptr                  PROCEDURE-POINTER.
       01 Classname                    PIC X(20)
                                       VALUE "Sysmets" & X"00".


       01 Wndclass.
        03 Wnd-Style                   PIC 9(4) COMP-5.
        03 Wnd-Lpfnwndproc             PROCEDURE-POINTER.
        03 Wnd-Cbclsextra              PIC S9(4) COMP-5.
        03 Wnd-Cbwndextra              PIC S9(4) COMP-5.
        03 Wnd-Hinstance               PIC 9(4) COMP-5.
        03 Wnd-Hicon                   PIC 9(4) COMP-5.
        03 Wnd-Hcursor                 PIC 9(4) COMP-5.
        03 Wnd-Hbrbackground           PIC 9(4) COMP-5.
        03 Wnd-Lpszmenuname            POINTER.
        03 Wnd-Lpszclassname           POINTER.

       01 Msg.
        03 Msg-Hwnd                    PIC 9(4) COMP-5.
        03 Msg-Message                 PIC 9(4) COMP-5.
        03 Msg-Wparam                  PIC 9(4) COMP-5.
        03 Msg-Lparam                  PIC S9(9) COMP-5.
        03 Msg-Time                    PIC 9(9) COMP-5.
        03 Msg-Pt.
         05 Msg-Pt-X                   PIC 9(4) COMP-5.
         05 Msg-Pt-Y                   PIC 9(4) COMP-5.

       01 Work-Data.
        03 Bool                        PIC 9(4) COMP-5 VALUE 1.
        03 Window-Type                 PIC X(4) COMP-5.
        03 C-1                         PIC X(2) COMP-5 VALUE 1.

       01 Wndproc-Data.
        03 CxChar                      PIC S9(4) COMP-5.
        03 CxCaps                      PIC S9(4) COMP-5.
        03 CyChar                      PIC S9(4) COMP-5.
        03 CxClient                    PIC S9(4) COMP-5.
        03 CyClient                    PIC S9(4) COMP-5.
        03 MaxWidth                    PIC S9(4) COMP-5.
        03 VscrollPos                  PIC S9(4) COMP-5.
        03 VscrollMax                  PIC S9(4) COMP-5.
        03 HscrollPos                  PIC S9(4) COMP-5.
        03 HscrollMax                  PIC S9(4) COMP-5.

       LOCAL-STORAGE SECTION.

       01 Buffer.
        03 Buffer-Char                 PIC X OCCURS 10.

       01 Hdc                          PIC 9(4) COMP-5.

       01 Work-Local-Data.
        03 Longresult                  PIC X(4) COMP-5.
        03 Hwindow                     PIC X(2) COMP-5.
        03 I                           PIC S9(4) COMP-5.
        03 X                           PIC S9(4) COMP-5.
        03 Y                           PIC S9(4) COMP-5.
        03 PaintBeg                    PIC S9(4) COMP-5.
        03 PaintEnd                    PIC S9(4) COMP-5.
        03 VscrollInc                  PIC S9(4) COMP-5.
        03 HscrollInc                  PIC S9(4) COMP-5.
        03 Temp                        PIC S9(4) COMP-5.
        03 Temp2                       PIC S9(4) COMP-5.
        03 Disp-Item                   PIC -Z(4)9.

       01 Ps.
        03 Ps-Hdc                      PIC 9(4) COMP-5.
        03 Ps-Ferase                   PIC S9(4) COMP-5.
        03 Ps-Rcpaint.
         05 Ps-Rcpaint-Left            PIC S9(4) COMP-5.
         05 Ps-Rcpaint-Top             PIC S9(4) COMP-5.
         05 Ps-Rcpaint-Right           PIC S9(4) COMP-5.
         05 Ps-Rcpaint-Bottom          PIC S9(4) COMP-5.
        03 Ps-Frestore                 PIC S9(4) COMP-5.
        03 Ps-Fincupdate               PIC S9(4) COMP-5.
        03 FILLER OCCURS 16.
         05 Ps-Rgbreserved             PIC X COMP-X.

        03 Tm.
         05 Tm-Tmheight                PIC S9(4) COMP-5.
         05 Tm-Tmascent                PIC S9(4) COMP-5.
         05 Tm-Tmdescent               PIC S9(4) COMP-5.
         05 Tm-Tminternalleading       PIC S9(4) COMP-5.
         05 Tm-Tmexternalleading       PIC S9(4) COMP-5.
         05 Tm-Tmavecharwidth          PIC S9(4) COMP-5.
         05 Tm-Tmmaxcharwidth          PIC S9(4) COMP-5.
         05 Tm-Tmweight                PIC S9(4) COMP-5.
         05 Tm-Tmitalic                PIC X COMP-X.
         05 Tm-Tmunderlined            PIC X COMP-X.
         05 Tm-Tmstruckout             PIC X COMP-X.
         05 Tm-Tmfirstchar             PIC X COMP-X.
         05 Tm-Tmlastchar              PIC X COMP-X.
         05 Tm-Tmdefaultchar           PIC X COMP-X.
         05 Tm-Tmbreakchar             PIC X COMP-X.
         05 Tm-Tmpitchandfamily        PIC X COMP-X.
         05 Tm-Tmcharset               PIC X COMP-X.
         05 Tm-Tmoverhang              PIC S9(4) COMP-5.
         05 Tm-Tmdigitizedaspectx      PIC S9(4) COMP-5.
         05 Tm-Tmdigitizedaspecty      PIC S9(4) COMP-5.

       LINKAGE SECTION.

       01 Hwnd                         PIC X(2) COMP-5.
       01 Imessage                     PIC 9(4) COMP-5.
       01 Wparam                       PIC 9(4) COMP-5.
       01 Lparam                       PIC S9(9) COMP-5.
       01 FILLER REDEFINES Lparam.
        03 Lparam-Loword               PIC S9(4) COMP-5.
        03 Lparam-Hiword               PIC S9(4) COMP-5.
       01 Hinst                        PIC XX COMP-5.
       01 Hprevinstance                PIC XX COMP-5.
       01 Lpszcmdline                  PIC X(120).
       01 Ncmdshow                     PIC XX COMP-5.

      ***************************************************************
      *  Procedure Division
      ***************************************************************

       PROCEDURE DIVISION WinApi USING  BY VALUE Hinst
                                 BY VALUE Hprevinstance
                                 BY REFERENCE Lpszcmdline
                                 BY VALUE Ncmdshow.
       Mywinmain SECTION.
           IF Hprevinstance = 0
             ADD Cs-Hredraw CS-Vredraw GIVING Wnd-Style
             SET Wnd-Lpfnwndproc TO ENTRY "WndProc"
             MOVE 0 TO Wnd-Cbclsextra
             MOVE 0 TO Wnd-Cbwndextra
             MOVE Hinst TO Wnd-Hinstance
             CALL WinApi "__LoadIcon" USING
                 BY VALUE C-Null SIZE 2
                 BY VALUE Idi-Application SIZE 4
               RETURNING Wnd-Hicon
             CALL WinApi "__LoadCursor" USING
                 BY VALUE C-Null SIZE 2
                 BY VALUE Idc-Arrow SIZE 4
               RETURNING Wnd-Hcursor
             CALL WinApi "__GetStockObject" USING
                 BY VALUE White-Brush SIZE 2
               RETURNING Wnd-Hbrbackground
             SET Wnd-Lpszmenuname TO Null
             SET Wnd-Lpszclassname TO ADDRESS OF Classname
             CALL WinApi "__RegisterClass" USING Wndclass
           END-IF

           MOVE Ws-Overlappedwindow TO Window-Type
           ADD Ws-Vscroll TO Window-Type
           ADD Ws-Hscroll TO Window-Type
           CALL WinApi "__CreateWindow"
             USING BY REFERENCE Classname
                   BY REFERENCE "System Metrics" & X"00"
                   BY VALUE Window-Type
                   BY VALUE Cw-Usedefault SIZE 2
                   BY VALUE Cw-Usedefault SIZE 2
                   BY VALUE Cw-Usedefault SIZE 2
                   BY VALUE Cw-Usedefault SIZE 2
                   BY VALUE C-Null SIZE 2
                   BY VALUE C-Null SIZE 2
                   BY VALUE Hinst
                   BY VALUE C-Null SIZE 4
             RETURNING Hwindow
           CALL WinApi "__ShowWindow" USING BY VALUE Hwindow
                                            BY VALUE Ncmdshow
           CALL WinApi "__UpdateWindow" USING BY VALUE Hwindow

           PERFORM UNTIL Bool = 0
             CALL WinApi "__GetMessage" USING BY REFERENCE Msg
                                              BY VALUE C-Null SIZE 2
                                              BY VALUE 0 SIZE 2
                                              BY VALUE 0 SIZE 2
               RETURNING Bool
             IF Bool NOT = 0
               CALL WinApi "__TranslateMessage" USING BY REFERENCE Msg
               CALL WinApi "__DispatchMessage" USING BY REFERENCE Msg
             END-IF
           END-PERFORM
           EXIT PROGRAM RETURNING Msg-Wparam
           STOP RUN.

      ***************************************************************
      *  Window Procedure
      ***************************************************************

       Windowprocedure SECTION.
       ENTRY "WndProc" USING BY VALUE Hwnd
                             BY VALUE Imessage
                             BY VALUE Wparam
                             BY VALUE Lparam.
           MOVE 0 TO Longresult
           EVALUATE Imessage
             WHEN Wm-Create
               CALL WinApi "__GetDc" USING BY VALUE Hwnd
                 RETURNING Hdc
               CALL WinApi "__GetTextMetrics"
                   USING BY VALUE Hdc
                         BY REFERENCE Tm
               MOVE Tm-TmAveCharWidth TO CxChar
               CALL System-Call "CBL_AND"
                   USING BY REFERENCE C-1
                         BY REFERENCE Tm-TmPitchAndFamily
                         BY VALUE 2 SIZE 4
               MOVE CxChar TO CxCaps
               IF Tm-TmPitchAndFamily = 1
                 DIVIDE 2 INTO CxCaps
                 MULTIPLY 3 BY CxCaps
               END-IF
               MOVE Tm-TmHeight TO CyChar
               ADD Tm-TmExternalLeading TO CyChar
               CALL WinApi "__ReleaseDc" USING BY VALUE Hwnd
                                               BY VALUE Hdc
               COMPUTE MaxWidth = 40 * CxChar + 18 * CxCaps

             WHEN Wm-Size
               MOVE Lparam-Hiword TO CyClient
               MOVE Lparam-Loword TO CxClient
               COMPUTE VscrollMax = NumLines + 2 - CyClient / CyChar
               IF VscrollMax < 0
                 MOVE 0 TO VscrollMax
               END-IF
               IF VscrollMax < VscrollPos
                 MOVE VscrollMax TO VscrollPos
               END-IF
               CALL WinApi "__SetScrollRange"
                   USING BY VALUE Hwnd
                         BY VALUE Sb-Vert SIZE 2
                         BY VALUE 0 SIZE 2
                         BY VALUE VscrollMax
                         BY VALUE C-False SIZE 2
               CALL WinApi "__SetScrollPos"
                   USING BY VALUE Hwnd
                         BY VALUE Sb-Vert SIZE 2
                         BY VALUE VscrollPos
                         BY VALUE C-True SIZE 2
               COMPUTE HscrollMax = 2 + (MaxWidth - CxClient) / CxChar
               IF HscrollMax < 0
                 MOVE 0 TO HscrollMax
               END-IF
               IF HscrollMax < HscrollPos
                 MOVE HscrollMax TO HscrollPos
               END-IF
               CALL WinApi "__SetScrollRange"
                   USING BY VALUE Hwnd
                         BY VALUE Sb-Horz SIZE 2
                         BY VALUE 0 SIZE 2
                         BY VALUE HscrollMax
                         BY VALUE C-False SIZE 2
               CALL WinApi "__SetScrollPos"
                   USING BY VALUE Hwnd
                         BY VALUE Sb-Horz SIZE 2
                         BY VALUE HscrollPos
                         BY VALUE C-True SIZE 2

             WHEN Wm-Vscroll
               EVALUATE Wparam
                 WHEN Sb-Top
                   COMPUTE VscrollInc = -VscrollPos

                 WHEN Sb-Bottom
                   COMPUTE VscrollInc = VscrollMax - VscrollPos

                 WHEN Sb-Lineup
                   MOVE -1 TO VscrollInc

                 WHEN Sb-Linedown
                   MOVE 1 TO VscrollInc

                 WHEN Sb-Pageup
                   COMPUTE VscrollInc = -CyClient / cyChar
                   IF -1 < VscrollInc
                     MOVE -1 TO VscrollInc
                   END-IF

                 WHEN Sb-Pagedown
                   COMPUTE VscrollInc = CyClient / CyChar
                   IF 1 > VscrollInc
                     MOVE 1 TO VscrollInc
                   END-IF

                 WHEN Sb-Thumbtrack
                   COMPUTE VscrollInc = Lparam-Loword - VscrollPos

                 WHEN OTHER
                   MOVE 0 TO VscrollInc

               END-EVALUATE
               COMPUTE Temp = VscrollMax - VscrollPos
               IF VscrollInc < Temp
                 MOVE VscrollInc TO Temp
               END-IF
               COMPUTE Temp2 = -VscrollPos
               IF Temp2 > Temp
                 MOVE Temp2 TO VscrollInc
               ELSE
                 MOVE Temp TO VscrollInc
               END-IF
               IF VscrollInc NOT = 0
                 ADD VscrollInc TO VscrollPos
                 COMPUTE Temp = -CyChar * VscrollInc
                 CALL WinApi "__ScrollWindow"
                     USING BY VALUE Hwnd
                           BY VALUE 0 SIZE 2
                           BY VALUE Temp
                           BY VALUE C-Null SIZE 4
                           BY VALUE C-Null SIZE 4
                 CALL WinApi "__SetScrollPos"
                     USING BY VALUE Hwnd
                           BY VALUE Sb-Vert SIZE 2
                           BY VALUE VscrollPos
                           BY VALUE C-True SIZE 2
                 CALL WinApi "__UpdateWindow" USING BY VALUE Hwnd
               END-IF

             WHEN Wm-Hscroll
               EVALUATE Wparam
                 WHEN Sb-Lineup
                   MOVE -1 TO HscrollInc

                 WHEN Sb-Linedown
                   MOVE 1 TO HscrollInc

                 WHEN Sb-Pageup
                   MOVE -8 TO HscrollInc

                 WHEN Sb-Pagedown
                   MOVE 8 TO HscrollInc

                 WHEN Sb-ThumbPosition
                   COMPUTE HscrollInc = Lparam-Loword - HscrollPos

                 WHEN OTHER
                   MOVE 0 TO HscrollInc

               END-EVALUATE
               COMPUTE Temp = HScrollMax - HscrollPos
               IF HscrollInc < Temp
                 MOVE HscrollInc TO Temp
               END-IF
               COMPUTE Temp2 = -HscrollPos
               IF Temp2 > Temp
                 MOVE Temp2 TO HscrollInc
               ELSE
                 MOVE Temp TO HscrollInc
               END-IF
               IF HscrollInc NOT = 0
                 ADD HscrollInc TO HscrollPos
                 COMPUTE Temp = -CxChar * HscrollInc
                 CALL WinApi "__ScrollWindow"
                     USING BY VALUE Hwnd
                           BY VALUE Temp
                           BY VALUE 0 SIZE 2
                           BY VALUE C-Null SIZE 4
                           BY VALUE C-Null SIZE 4
                 CALL WinApi "__SetScrollPos"
                     USING BY VALUE Hwnd
                           BY VALUE Sb-Horz SIZE 2
                           BY VALUE HscrollPos
                           BY VALUE C-True SIZE 2
               END-IF

             WHEN Wm-Keydown
               EVALUATE Wparam
                 WHEN Vk-Home
                   CALL WinApi "__SendMessage"
                       USING BY VALUE Hwnd
                             BY VALUE Wm-Vscroll SIZE 2
                             BY VALUE Sb-Top SIZE 2
                             BY VALUE 0 SIZE 4

                 WHEN Vk-End
                   CALL WinApi "__SendMessage"
                       USING BY VALUE Hwnd
                             BY VALUE Wm-Vscroll SIZE 2
                             BY VALUE Sb-Bottom SIZE 2
                             BY VALUE 0 SIZE 4

                 WHEN Vk-Prior
                   CALL WinApi "__SendMessage"
                       USING BY VALUE Hwnd
                             BY VALUE Wm-Vscroll SIZE 2
                             BY VALUE Sb-Pageup SIZE 2
                             BY VALUE 0 SIZE 4

                 WHEN Vk-Next
                   CALL WinApi "__SendMessage"
                       USING BY VALUE Hwnd
                             BY VALUE Wm-Vscroll SIZE 2
                             BY VALUE Sb-Pagedown SIZE 2
                             BY VALUE 0 SIZE 4

                 WHEN Vk-Up
                   CALL WinApi "__SendMessage"
                       USING BY VALUE Hwnd
                             BY VALUE Wm-Vscroll SIZE 2
                             BY VALUE Sb-Lineup SIZE 2
                             BY VALUE 0 SIZE 4

                 WHEN Vk-Down
                   CALL WinApi "__SendMessage"
                       USING BY VALUE Hwnd
                             BY VALUE Wm-Vscroll SIZE 2
                             BY VALUE Sb-Linedown SIZE 2
                             BY VALUE 0 SIZE 4

                 WHEN Vk-Left
                   CALL WinApi "__SendMessage"
                       USING BY VALUE Hwnd
                             BY VALUE Wm-Hscroll SIZE 2
                             BY VALUE Sb-Pageup SIZE 2
                             BY VALUE 0 SIZE 4

                 WHEN Vk-Right
                   CALL WinApi "__SendMessage"
                       USING BY VALUE Hwnd
                             BY VALUE Wm-Hscroll SIZE 2
                             BY VALUE Sb-Pagedown SIZE 2
                             BY VALUE 0 SIZE 4

               END-EVALUATE

             WHEN Wm-Paint
               CALL WinApi "__BeginPaint" USING BY VALUE Hwnd
                                                BY REFERENCE Ps
                 RETURNING Hdc
               COMPUTE PaintBeg = VscrollPos +
                                  Ps-RcPaint-Top / CyChar - 1
               IF PaintBeg < 0
                 MOVE 0 TO PaintBeg
               END-IF
               COMPUTE PaintEnd = VscrollPos +
                                  Ps-RcPaint-Bottom / CyChar
               IF NumLines < PaintEnd
                 MOVE NumLines TO PaintEnd
               END-IF
               MOVE PaintBeg TO I
               PERFORM UNTIL i NOT < PaintEnd
                 COMPUTE X = CxChar * (1 - HscrollPos)
                 COMPUTE Y = CyChar * (1 - VscrollPos + I)
                 CALL WinApi "__TextOut"
                     USING BY VALUE Hdc
                           BY VALUE X
                           BY VALUE Y
                           BY REFERENCE Sysmetrics-Label(I + 1)
                           BY VALUE Sysmetrics-Lablen(I + 1)
                 COMPUTE Temp = X + 18 * CxCaps
                 CALL WinApi "__TextOut"
                     USING BY VALUE Hdc
                           BY VALUE Temp
                           BY VALUE Y
                           BY REFERENCE Sysmetrics-Desc(I + 1)
                           BY VALUE Sysmetrics-DescLen(I + 1)
                 MOVE Ta-Right TO Temp
                 ADD Ta-Top TO Temp
                 CALL WinApi "__SetTextAlign"
                     USING BY VALUE Hdc
                           BY VALUE Temp
                 CALL WinApi "__GetSystemMetrics"
                     USING BY VALUE Sysmetrics-Index(I + 1)
                   RETURNING Temp
                 MOVE Temp TO Disp-Item
                 COMPUTE Temp = X + 18 * CxCaps + 40 * CxChar
                 CALL WinApi "__TextOut"
                     USING BY VALUE Hdc
                           BY VALUE Temp
                           BY VALUE Y
                           BY REFERENCE Disp-Item
                           BY VALUE 6 SIZE 2
                 MOVE Ta-Left TO Temp
                 ADD Ta-Top TO Temp
                 CALL WinApi "__SetTextAlign"
                     USING BY VALUE Hdc
                           BY VALUE Temp
                 ADD 1 TO I
               END-PERFORM
               CALL WinApi "__EndPaint" USING BY VALUE Hwnd
                                              BY REFERENCE Ps

             WHEN Wm-Destroy
               CALL WinApi "__PostQuitMessage" USING BY VALUE 0 SIZE 2

             WHEN OTHER
               CALL WinApi "__DefWindowProc"
                       USING BY VALUE Hwnd
                             BY VALUE Imessage
                             BY VALUE Wparam
                             BY VALUE Lparam
                       RETURNING Longresult
           END-EVALUATE
           EXIT PROGRAM RETURNING Longresult.
