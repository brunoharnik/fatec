
           03 Long                              PIC S9(9) COMP-5.
           03 Bool                              PIC S9(4) COMP-5.
           03 Byte                              PIC X COMP-X.
           03 Word                              PIC 9(4) COMP-5.
           03 Dword                             PIC 9(9) COMP-5.
           03 Pstr                              PIC 9(4) COMP-5.
           03 Npstr                             PIC 9(4) COMP-5.
           03 Lpstr                             POINTER.
           03 Pbyte                             PIC 9(4) COMP-5.
           03 Lpbyte                            POINTER.
           03 Pint                              PIC 9(4) COMP-5.
           03 Lpint                             POINTER.
           03 Pword                             PIC 9(4) COMP-5.
           03 Lpword                            POINTER.
           03 Plong                             PIC 9(4) COMP-5.
           03 Lplong                            POINTER.
           03 Pdword                            PIC 9(4) COMP-5.
           03 Lpdword                           POINTER.
           03 Lpvoid                            POINTER.
           03 Handle                            PIC 9(4) COMP-5.
           03 Hwnd                              PIC 9(4) COMP-5.
           03 Phandle                           PIC 9(4) COMP-5.
           03 Sphandle                          PIC 9(4) COMP-5.
           03 Lphandle                          POINTER.
           03 Globalhandle                      PIC 9(4) COMP-5.
           03 Localhandle                       PIC 9(4) COMP-5.
           03 Farproc                           PROCEDURE-POINTER.
           03 Nearproc                          PROCEDURE-POINTER.
           03 Hstr                              PIC 9(4) COMP-5.
           03 Hicon                             PIC 9(4) COMP-5.
           03 Hdc                               PIC 9(4) COMP-5.
           03 Hmenu                             PIC 9(4) COMP-5.
           03 Hpen                              PIC 9(4) COMP-5.
           03 Hfont                             PIC 9(4) COMP-5.
           03 Hbrush                            PIC 9(4) COMP-5.
           03 Hbitmap                           PIC 9(4) COMP-5.
           03 Hcursor                           PIC 9(4) COMP-5.
           03 Hrgn                              PIC 9(4) COMP-5.
           03 Hpalette                          PIC 9(4) COMP-5.
           03 Colorref                          PIC 9(9) COMP-5.

           03 Rect.
            05 Rect-Left                        PIC S9(4) COMP-5.
            05 Rect-Top                         PIC S9(4) COMP-5.
            05 Rect-Right                       PIC S9(4) COMP-5.
            05 Rect-Bottom                      PIC S9(4) COMP-5.

           03 Prect                             PIC 9(4) COMP-5.
           03 Nprect                            PIC 9(4) COMP-5.
           03 Lprect                            POINTER.

           03 Point.
            05 Point-X                          PIC S9(4) COMP-5.
            05 Point-Y                          PIC S9(4) COMP-5.

           03 Ppoint                            PIC 9(4) COMP-5.
           03 Nppoint                           PIC 9(4) COMP-5.
           03 Lppoint                           POINTER.

           03 Ofstruct.
            05 Ofstruct-Cbytes                  PIC X COMP-X.
            05 Ofstruct-Ffixeddisk              PIC X COMP-X.
            05 Ofstruct-Nerrcode                PIC 9(4) COMP-5.
            05 FILLER OCCURS 4.
             07 Ofstruct-Reserved               PIC X COMP-X.
            05 FILLER OCCURS 128.
             07 Ofstruct-Szpathname             PIC X COMP-X.

           03 Pofstruct                         PIC 9(4) COMP-5.
           03 Npofstruct                        PIC 9(4) COMP-5.
           03 Lpofstruct                        POINTER.
           03 Atom                              PIC 9(4) COMP-5.

           03 FILLER OCCURS 9.
            05 Catchbuf                         PIC S9(4) COMP-5.

           03 Lpcatchbuf                        POINTER.

           03 Bitmap.
            05 Bitmap-Bmtype                    PIC S9(4) COMP-5.
            05 Bitmap-Bmwidth                   PIC S9(4) COMP-5.
            05 Bitmap-Bmheight                  PIC S9(4) COMP-5.
            05 Bitmap-Bmwidthbytes              PIC S9(4) COMP-5.
            05 Bitmap-Bmplanes                  PIC X COMP-X.
            05 Bitmap-Bmbitspixel               PIC X COMP-X.
            05 Bitmap-Bmbits                    POINTER.

           03 Pbitmap                           PIC 9(4) COMP-5.
           03 Npbitmap                          PIC 9(4) COMP-5.
           03 Lpbitmap                          POINTER.

           03 Rgbtriple.
            05 Rgbtriple-Rgbtblue               PIC X COMP-X.
            05 Rgbtriple-Rgbtgreen              PIC X COMP-X.
            05 Rgbtriple-Rgbtred                PIC X COMP-X.

           03 Rgbquad.
            05 Rgbquad-Rgbblue                  PIC X COMP-X.
            05 Rgbquad-Rgbgreen                 PIC X COMP-X.
            05 Rgbquad-Rgbred                   PIC X COMP-X.
            05 Rgbquad-Rgbreserved              PIC X COMP-X.

           03 Bitmapcoreheader.
            05 Bitmapcoreheader-Bcsize          PIC 9(9) COMP-5.
            05 Bitmapcoreheader-Bcwidth         PIC 9(4) COMP-5.
            05 Bitmapcoreheader-Bcheight        PIC 9(4) COMP-5.
            05 Bitmapcoreheader-Bcplanes        PIC 9(4) COMP-5.
            05 Bitmapcoreheader-Bcbitcount      PIC 9(4) COMP-5.

           03 Lpbitmapcoreheader                POINTER.
           03 Pbitmapcoreheader                 PIC 9(4) COMP-5.

           03 Bitmapinfoheader.
            05 Bitmapinfoheader-Bisize          PIC 9(9) COMP-5.
            05 Bitmapinfoheader-Biwidth         PIC 9(9) COMP-5.
            05 Bitmapinfoheader-Biheight        PIC 9(9) COMP-5.
            05 Bitmapinfoheader-Biplanes        PIC 9(4) COMP-5.
            05 Bitmapinfoheader-Bibitcount      PIC 9(4) COMP-5.
            05 Bitmapinfoheader-Bicompression   PIC 9(9) COMP-5.
            05 Bitmapinfoheader-Bisizeimage     PIC 9(9) COMP-5.
            05 Bitmapinfohead-Bixpelspermeter   PIC 9(9) COMP-5.
            05 Bitmapinfohead-Biypelspermeter   PIC 9(9) COMP-5.
            05 Bitmapinfoheader-Biclrused       PIC 9(9) COMP-5.
            05 Bitmapinfoheade-Biclrimportant   PIC 9(9) COMP-5.

           03 Lpbitmapinfoheader                POINTER.
           03 Pbitmapinfoheader                 PIC 9(4) COMP-5.

           03 Bitmapinfo.
            05 Bitmapinfo-Bmiheader.
             07 Bitmapinfo-Bmiheader-Bisize     PIC 9(9) COMP-5.
             07 Bitmapinfo-Bmiheader-Biwidth    PIC 9(9) COMP-5.
             07 Bitmapinfo-Bmiheader-Biheight   PIC 9(9) COMP-5.
             07 Bitmapinfo-Bmiheader-Biplanes   PIC 9(4) COMP-5.
             07 Bitmapinfo-Bmiheade-Bibitcount  PIC 9(4) COMP-5.
             07 Bitmapinfo-Bmihe-Bicompression  PIC 9(9) COMP-5.
             07 Bitmapinfo-Bmihead-Bisizeimage  PIC 9(9) COMP-5.
             07 Bitmapinfo-Bmi-Bixpelspermeter  PIC 9(9) COMP-5.
             07 Bitmapinfo-Bmi-Biypelspermeter  PIC 9(9) COMP-5.
             07 Bitmapinfo-Bmiheader-Biclrused  PIC 9(9) COMP-5.
             07 Bitmapinfo-Bmih-Biclrimportant  PIC 9(9) COMP-5.
            05 FILLER OCCURS 1.
             07 Bitmapinfo-Bmicolors.
              09 Bitmapinfo-Bmicolors-Rgbblue   PIC X COMP-X.
              09 Bitmapinfo-Bmicolors-Rgbgreen  PIC X COMP-X.
              09 Bitmapinfo-Bmicolors-Rgbred    PIC X COMP-X.
              09 Bitmapinfo-Bmicolo-Rgbreserved PIC X COMP-X.

           03 Lpbitmapinfo                      POINTER.
           03 Pbitmapinfo                       PIC 9(4) COMP-5.

           03 Bitmapcoreinfo.
            05 Bitmapcoreinfo-Bmciheader.
             07 Bitmapcoreinfo-Bmcihead-Bcsize  PIC 9(9) COMP-5.
             07 Bitmapcoreinfo-Bmcihea-Bcwidth  PIC 9(4) COMP-5.
             07 Bitmapcoreinfo-Bmcihe-Bcheight  PIC 9(4) COMP-5.
             07 Bitmapcoreinfo-Bmcihe-Bcplanes  PIC 9(4) COMP-5.
             07 Bitmapcoreinfo-Bmci-Bcbitcount  PIC 9(4) COMP-5.
            05 FILLER OCCURS 1.
             07 Bitmapcoreinfo-Bmcicolors.
              09 Bitmapcoreinfo-Bmcico-Rgbtblue PIC X COMP-X.
              09 Bitmapcoreinfo-Bmcic-Rgbtgreen PIC X COMP-X.
              09 Bitmapcoreinfo-Bmcicol-Rgbtred PIC X COMP-X.

           03 Lpbitmapcoreinfo                  POINTER.
           03 Pbitmapcoreinfo                   PIC 9(4) COMP-5.

           03 Bitmapfileheader.
            05 Bitmapfileheader-Bftype          PIC 9(4) COMP-5.
            05 Bitmapfileheader-Bfsize          PIC 9(9) COMP-5.
            05 Bitmapfileheader-Bfreserved1     PIC 9(4) COMP-5.
            05 Bitmapfileheader-Bfreserved2     PIC 9(4) COMP-5.
            05 Bitmapfileheader-Bfoffbits       PIC 9(9) COMP-5.

           03 Lpbitmapfileheader                POINTER.
           03 Pbitmapfileheader                 PIC 9(4) COMP-5.

           03 Handletable.
            05 FILLER OCCURS 1.
             07 Handletable-Objecthandle        PIC 9(4) COMP-5.

           03 Phandletable                      PIC 9(4) COMP-5.
           03 Lphandletable                     POINTER.

           03 Metarecord.
            05 Metarecord-Rdsize                PIC 9(9) COMP-5.
            05 Metarecord-Rdfunction            PIC 9(4) COMP-5.
            05 FILLER OCCURS 1.
             07 Metarecord-Rdparm               PIC 9(4) COMP-5.

           03 Pmetarecord                       PIC 9(4) COMP-5.
           03 Lpmetarecord                      POINTER.

           03 Metafilepict.
            05 Metafilepict-Mm                  PIC S9(4) COMP-5.
            05 Metafilepict-Xext                PIC S9(4) COMP-5.
            05 Metafilepict-Yext                PIC S9(4) COMP-5.
            05 Metafilepict-Hmf                 PIC 9(4) COMP-5.

           03 Lpmetafilepict                    POINTER.

           03 Metaheader.
            05 Metaheader-Mttype                PIC 9(4) COMP-5.
            05 Metaheader-Mtheadersize          PIC 9(4) COMP-5.
            05 Metaheader-Mtversion             PIC 9(4) COMP-5.
            05 Metaheader-Mtsize                PIC 9(9) COMP-5.
            05 Metaheader-Mtnoobjects           PIC 9(4) COMP-5.
            05 Metaheader-Mtmaxrecord           PIC 9(9) COMP-5.
            05 Metaheader-Mtnoparameters        PIC 9(4) COMP-5.

           03 Textmetric.
            05 Textmetric-Tmheight              PIC S9(4) COMP-5.
            05 Textmetric-Tmascent              PIC S9(4) COMP-5.
            05 Textmetric-Tmdescent             PIC S9(4) COMP-5.
            05 Textmetric-Tminternalleading     PIC S9(4) COMP-5.
            05 Textmetric-Tmexternalleading     PIC S9(4) COMP-5.
            05 Textmetric-Tmavecharwidth        PIC S9(4) COMP-5.
            05 Textmetric-Tmmaxcharwidth        PIC S9(4) COMP-5.
            05 Textmetric-Tmweight              PIC S9(4) COMP-5.
            05 Textmetric-Tmitalic              PIC X COMP-X.
            05 Textmetric-Tmunderlined          PIC X COMP-X.
            05 Textmetric-Tmstruckout           PIC X COMP-X.
            05 Textmetric-Tmfirstchar           PIC X COMP-X.
            05 Textmetric-Tmlastchar            PIC X COMP-X.
            05 Textmetric-Tmdefaultchar         PIC X COMP-X.
            05 Textmetric-Tmbreakchar           PIC X COMP-X.
            05 Textmetric-Tmpitchandfamily      PIC X COMP-X.
            05 Textmetric-Tmcharset             PIC X COMP-X.
            05 Textmetric-Tmoverhang            PIC S9(4) COMP-5.
            05 Textmetric-Tmdigitizedaspectx    PIC S9(4) COMP-5.
            05 Textmetric-Tmdigitizedaspecty    PIC S9(4) COMP-5.

           03 Ptextmetric                       PIC 9(4) COMP-5.
           03 Nptextmetric                      PIC 9(4) COMP-5.
           03 Lptextmetric                      POINTER.

           03 Pelarray.
            05 Pelarray-Paxcount                PIC S9(4) COMP-5.
            05 Pelarray-Paycount                PIC S9(4) COMP-5.
            05 Pelarray-Paxext                  PIC S9(4) COMP-5.
            05 Pelarray-Payext                  PIC S9(4) COMP-5.
            05 Pelarray-Pargbs                  PIC X COMP-X.

           03 Ppelarray                         PIC 9(4) COMP-5.
           03 Nppelarray                        PIC 9(4) COMP-5.
           03 Lppelarray                        POINTER.

           03 Logbrush.
            05 Logbrush-Lbstyle                 PIC 9(4) COMP-5.
            05 Logbrush-Lbcolor                 PIC 9(9) COMP-5.
            05 Logbrush-Lbhatch                 PIC S9(4) COMP-5.

           03 Plogbrush                         PIC 9(4) COMP-5.
           03 Nplogbrush                        PIC 9(4) COMP-5.
           03 Lplogbrush                        POINTER.
           03 Pattern.
           03 Ppattern                          PIC 9(4) COMP-5.
           03 Nppattern                         PIC 9(4) COMP-5.
           03 Lppattern                         POINTER.

           03 Logpen.
            05 Logpen-Lopnstyle                 PIC 9(4) COMP-5.
            05 Logpen-Lopnwidth.
             07 Logpen-Lopnwidth-X              PIC S9(4) COMP-5.
             07 Logpen-Lopnwidth-Y              PIC S9(4) COMP-5.
            05 Logpen-Lopncolor                 PIC 9(9) COMP-5.

           03 Plogpen                           PIC 9(4) COMP-5.
           03 Nplogpen                          PIC 9(4) COMP-5.
           03 Lplogpen                          POINTER.

           03 Paletteentry.
            05 Paletteentry-Pered               PIC X COMP-X.
            05 Paletteentry-Pegreen             PIC X COMP-X.
            05 Paletteentry-Peblue              PIC X COMP-X.
            05 Paletteentry-Peflags             PIC X COMP-X.

           03 Lppaletteentry                    POINTER.

           03 Logpalette.
            05 Logpalette-Palversion            PIC 9(4) COMP-5.
            05 Logpalette-Palnumentries         PIC 9(4) COMP-5.
            05 FILLER OCCURS 1.
             07 Logpalette-Palpalentry.
              09 Logpalette-Palpalentry-Pered   PIC X COMP-X.
              09 Logpalette-Palpalentry-Pegreen PIC X COMP-X.
              09 Logpalette-Palpalentry-Peblue  PIC X COMP-X.
              09 Logpalette-Palpalentry-Peflags PIC X COMP-X.

           03 Plogpalette                       PIC 9(4) COMP-5.
           03 Nplogpalette                      PIC 9(4) COMP-5.
           03 Lplogpalette                      POINTER.

           03 Logfont.
            05 Logfont-Lfheight                 PIC S9(4) COMP-5.
            05 Logfont-Lfwidth                  PIC S9(4) COMP-5.
            05 Logfont-Lfescapement             PIC S9(4) COMP-5.
            05 Logfont-Lforientation            PIC S9(4) COMP-5.
            05 Logfont-Lfweight                 PIC S9(4) COMP-5.
            05 Logfont-Lfitalic                 PIC X COMP-X.
            05 Logfont-Lfunderline              PIC X COMP-X.
            05 Logfont-Lfstrikeout              PIC X COMP-X.
            05 Logfont-Lfcharset                PIC X COMP-X.
            05 Logfont-Lfoutprecision           PIC X COMP-X.
            05 Logfont-Lfclipprecision          PIC X COMP-X.
            05 Logfont-Lfquality                PIC X COMP-X.
            05 Logfont-Lfpitchandfamily         PIC X COMP-X.
            05 FILLER OCCURS 32.
             07 Logfont-Lffacename              PIC X COMP-X.

           03 Plogfont                          PIC 9(4) COMP-5.
           03 Nplogfont                         PIC 9(4) COMP-5.
           03 Lplogfont                         POINTER.

           03 Eventmsg.
            05 Eventmsg-Message                 PIC 9(4) COMP-5.
            05 Eventmsg-Paraml                  PIC 9(4) COMP-5.
            05 Eventmsg-Paramh                  PIC 9(4) COMP-5.
            05 Eventmsg-Time                    PIC 9(9) COMP-5.

           03 Peventmsgmsg                      PIC 9(4) COMP-5.
           03 Npeventmsgmsg                     PIC 9(4) COMP-5.
           03 Lpeventmsgmsg                     POINTER.

           03 Wndclass.
            05 Wndclass-Style                   PIC 9(4) COMP-5.
            05 Wndclass-Lpfnwndproc             PROCEDURE-POINTER.
            05 Wndclass-Cbclsextra              PIC S9(4) COMP-5.
            05 Wndclass-Cbwndextra              PIC S9(4) COMP-5.
            05 Wndclass-Hinstance               PIC 9(4) COMP-5.
            05 Wndclass-Hicon                   PIC 9(4) COMP-5.
            05 Wndclass-Hcursor                 PIC 9(4) COMP-5.
            05 Wndclass-Hbrbackground           PIC 9(4) COMP-5.
            05 Wndclass-Lpszmenuname            POINTER.
            05 Wndclass-Lpszclassname           POINTER.

           03 Pwndclass                         PIC 9(4) COMP-5.
           03 Npwndclass                        PIC 9(4) COMP-5.
           03 Lpwndclass                        POINTER.

           03 Msg.
            05 Msg-Hwnd                         PIC 9(4) COMP-5.
            05 Msg-Message                      PIC 9(4) COMP-5.
            05 Msg-Wparam                       PIC 9(4) COMP-5.
            05 Msg-Lparam                       PIC S9(9) COMP-5.
            05 Msg-Time                         PIC 9(9) COMP-5.
            05 Msg-Pt.
             07 Msg-Pt-X                        PIC S9(4) COMP-5.
             07 Msg-Pt-Y                        PIC S9(4) COMP-5.

           03 Pmsg                              PIC 9(4) COMP-5.
           03 Npmsg                             PIC 9(4) COMP-5.
           03 Lpmsg                             POINTER.

           03 Paintstruct.
            05 Paintstruct-Hdc                  PIC 9(4) COMP-5.
            05 Paintstruct-Ferase               PIC S9(4) COMP-5.
            05 Paintstruct-Rcpaint.
             07 Paintstruct-Rcpaint-Left        PIC S9(4) COMP-5.
             07 Paintstruct-Rcpaint-Top         PIC S9(4) COMP-5.
             07 Paintstruct-Rcpaint-Right       PIC S9(4) COMP-5.
             07 Paintstruct-Rcpaint-Bottom      PIC S9(4) COMP-5.
            05 Paintstruct-Frestore             PIC S9(4) COMP-5.
            05 Paintstruct-Fincupdate           PIC S9(4) COMP-5.
            05 FILLER OCCURS 16.
             07 Paintstruct-Rgbreserved         PIC X COMP-X.

           03 Ppaintstruct                      PIC 9(4) COMP-5.
           03 Nppaintstruct                     PIC 9(4) COMP-5.
           03 Lppaintstruct                     POINTER.

           03 Createstruct.
            05 Createstruct-Lpcreateparams      POINTER.
            05 Createstruct-Hinstance           PIC 9(4) COMP-5.
            05 Createstruct-Hmenu               PIC 9(4) COMP-5.
            05 Createstruct-Hwndparent          PIC 9(4) COMP-5.
            05 Createstruct-Cy                  PIC S9(4) COMP-5.
            05 Createstruct-Cx                  PIC S9(4) COMP-5.
            05 Createstruct-Y                   PIC S9(4) COMP-5.
            05 Createstruct-X                   PIC S9(4) COMP-5.
            05 Createstruct-Style               PIC S9(9) COMP-5.
            05 Createstruct-Lpszname            POINTER.
            05 Createstruct-Lpszclass           POINTER.
            05 Createstruct-Dwexstyle           PIC 9(9) COMP-5.

           03 Lpcreatestruct                    POINTER.

           03 Measureitemstruct.
            05 Measureitemstruct-Ctltype        PIC 9(4) COMP-5.
            05 Measureitemstruct-Ctlid          PIC 9(4) COMP-5.
            05 Measureitemstruct-Itemid         PIC 9(4) COMP-5.
            05 Measureitemstruct-Itemwidth      PIC 9(4) COMP-5.
            05 Measureitemstruct-Itemheight     PIC 9(4) COMP-5.
            05 Measureitemstruct-Itemdata       PIC 9(9) COMP-5.

           03 Pmeasureitemstruct                PIC 9(4) COMP-5.
           03 Lpmeasureitemstruct               POINTER.

           03 Drawitemstruct.
            05 Drawitemstruct-Ctltype           PIC 9(4) COMP-5.
            05 Drawitemstruct-Ctlid             PIC 9(4) COMP-5.
            05 Drawitemstruct-Itemid            PIC 9(4) COMP-5.
            05 Drawitemstruct-Itemaction        PIC 9(4) COMP-5.
            05 Drawitemstruct-Itemstate         PIC 9(4) COMP-5.
            05 Drawitemstruct-Hwnditem          PIC 9(4) COMP-5.
            05 Drawitemstruct-Hdc               PIC 9(4) COMP-5.
            05 Drawitemstruct-Rcitem.
             07 Drawitemstruct-Rcitem-Left      PIC S9(4) COMP-5.
             07 Drawitemstruct-Rcitem-Top       PIC S9(4) COMP-5.
             07 Drawitemstruct-Rcitem-Right     PIC S9(4) COMP-5.
             07 Drawitemstruct-Rcitem-Bottom    PIC S9(4) COMP-5.
            05 Drawitemstruct-Itemdata          PIC 9(9) COMP-5.

           03 Pdrawitemstruct                   PIC 9(4) COMP-5.
           03 Lpdrawitemstruct                  POINTER.

           03 Deleteitemstruct.
            05 Deleteitemstruct-Ctltype         PIC 9(4) COMP-5.
            05 Deleteitemstruct-Ctlid           PIC 9(4) COMP-5.
            05 Deleteitemstruct-Itemid          PIC 9(4) COMP-5.
            05 Deleteitemstruct-Hwnditem        PIC 9(4) COMP-5.
            05 Deleteitemstruct-Itemdata        PIC 9(9) COMP-5.

           03 Pdeleteitemstruct                 PIC 9(4) COMP-5.
           03 Lpdeleteitemstruct                POINTER.

           03 Compareitemstruct.
            05 Compareitemstruct-Ctltype        PIC 9(4) COMP-5.
            05 Compareitemstruct-Ctlid          PIC 9(4) COMP-5.
            05 Compareitemstruct-Hwnditem       PIC 9(4) COMP-5.
            05 Compareitemstruct-Itemid1        PIC 9(4) COMP-5.
            05 Compareitemstruct-Itemdata1      PIC 9(9) COMP-5.
            05 Compareitemstruct-Itemid2        PIC 9(4) COMP-5.
            05 Compareitemstruct-Itemdata2      PIC 9(9) COMP-5.

           03 Pcompareitemstruct                PIC 9(4) COMP-5.
           03 Lpcompareitemstruct               POINTER.

           03 Menuitemtemplateheader.
            05 Menuitemtemplate-Versionnumber   PIC 9(4) COMP-5.
            05 Menuitemtemplateheader-Offset    PIC 9(4) COMP-5.

           03 Menuitemtemplate.
            05 Menuitemtemplate-Mtoption        PIC 9(4) COMP-5.
            05 Menuitemtemplate-Mtid            PIC 9(4) COMP-5.
            05 FILLER OCCURS 1.
             07 Menuitemtemplate-Mtstring       PIC X COMP-X.

           03 Kanjistruct.
            05 Kanjistruct-Fnc                  PIC S9(4) COMP-5.
            05 Kanjistruct-Wparam               PIC S9(4) COMP-5.
            05 Kanjistruct-Lpsource             POINTER.
            05 Kanjistruct-Lpdest               POINTER.
            05 Kanjistruct-Wcount               PIC S9(4) COMP-5.
            05 Kanjistruct-Lpreserved1          POINTER.
            05 Kanjistruct-Lpreserved2          POINTER.

           03 Frtsdisable                       PIC X COMP-X.     *>Bit field
           03 Fdsrhold                          PIC X COMP-X.     *>Bit field

           03 Mdicreatestruct.
            05 Mdicreatestruct-Szclass          POINTER.
            05 Mdicreatestruct-Sztitle          POINTER.
            05 Mdicreatestruct-Howner           PIC 9(4) COMP-5.
            05 Mdicreatestruct-X                PIC S9(4) COMP-5.
            05 Mdicreatestruct-Cx               PIC S9(4) COMP-5.
            05 Mdicreatestruct-Style            PIC S9(9) COMP-5.
            05 Mdicreatestruct-Lparam           PIC S9(9) COMP-5.

           03 Lpmdicreatestruct                 POINTER.

           03 Clientcreatestruct.
            05 Clientcreatestruct-Hwindowmenu   PIC 9(4) COMP-5.
            05 Clientcreatestruc-Idfirstchild   PIC 9(4) COMP-5.

           03 Lpclientcreatestruct              POINTER.

           03 Multikeyhelp.
            05 Multikeyhelp-Mksize              PIC 9(4) COMP-5.
            05 Multikeyhelp-Mkkeylist           PIC X COMP-X.
            05 FILLER OCCURS 1.
             07 Multikeyhelp-Szkeyphrase        PIC X COMP-X.
