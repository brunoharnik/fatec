
sysmets.exe: sysmets.obj sysmets.def
    link /NOD/NOE sysmets cblwina,,,lcobolw lcobol cobw,sysmets.def;
    rc sysmets.exe

sysmets.obj: sysmets.cbl sysmets.cpy
    cobol sysmets;
