@echo off
rem An unmodified version of winmain.cbl is used if explicit loading is 
rem desired.  It follows the description for Explicit Loading of Calls in  
rem Chapter 2, Building Dynamic-Link Libraries, in Programming for Windows.

cobol winmain target(286) deffile deffiletype"windows" nodll;
cobol cobdll target(286) deffile deffiletype"windows" dll;

link/nod/noe winmain cblwina,winmain.exe,,lcobolw+lcobol+libw,winmain.def;
link/nod/noe cobdll cblwinl libinit,cobdll.dll,,lcobolw+lcobol+libw,cobdll.def; 
