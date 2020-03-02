@echo off
cls
echo Command: %0 %1 %2 %3 %4 %5 %6 %7 %8 %9
echo ÿ
if %1x == x goto err1
if not %2x == x goto err2
if not exist %1.* goto err3
if not exist %1.cob goto err4
echo Compiling . . .
cobol %1.cob,%1.int,%1.lst
type %1.lst
goto end
:err1
echo Command Format: COMPILE filename
echo ÿ
echo The file to be compiled should have a dafault extension name of .COB and
echo the filename given need not contain an extension.
echo ÿ
echo For example, if you have a source program named TEST.COB, simply enter
echo COMPILE TEST at the DOS prompt to compile it.  This will create a
echo compiler listing file named TEST.LST, an object file named TEST.INT
echo and a debugging file named TEST.DBG.  To view the compiler listing file,
echo enter READ TEST.LST.  Enter RUN TEST to run the program. [Computer Lab]
goto end
:err2
echo Command must have only one argument.
goto end
:err3
echo File not found or redundant extension.
goto end
:err4
echo Filename extension must be .COB.
:end
echo ÿ
