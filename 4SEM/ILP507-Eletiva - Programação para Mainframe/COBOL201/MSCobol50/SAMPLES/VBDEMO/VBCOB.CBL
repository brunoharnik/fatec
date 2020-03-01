      $set target(286)
       identification division.
       program-id. vbcob.

       environment division.

       configuration section.
       special-names.
       call-convention 3 is winapi.
      *winapi is required for Windows DLLs.

       input-output section.
       File-Control.
	   Select IsamFile assign to Disk
		  organization indexed
		  access dynamic
		  record key IsamNumber
		  lock mode is manual
		  file status is FileStatus.

       data division.
       File Section.
       FD IsamFile
	  value of File-ID is FileName.
       01 IsamFile-Rec.
	  05 IsamNumber  pic 9(4) comp-5.
	  05 IsamName	 pic x(15).
	  05 IsamCity	 pic x(15).
      *IsamFile-Rec is equivalent to the parameter PassRecord, which
      *Visual Basic passes in "ADD_RECORD" and "BROWSE" calls.

       working-storage section.

       01 Filename	pic X(80).
      *Filename is equivalent to the parameter TargetPath, which Visual
      *Basic passes in "CREATE" calls.

       01 FileStatus	pic xx.
      *A variable required by file handling procedures.

       01 S		pic 9 value 1.
      *A temporary variable used in "COBINTARRAY"


       linkage section.

       01 Int		pic 9(4) comp-5.
      *The parameter passed by VB for "COBINT"

       01 LongInt	pic 9(8) comp-5.
      *The parameter passed by VB for "COBLINT"

       01 IntArray	pic 9(4) comp-5 occurs 5 times.
      *The parameter passed by VB for "COBINTARRAY"

       01 CblString	pic X(35).
      *The parameter passed by VB for "COBSTRING"

       01 SFloat	comp-1.
      *The parameter passed by VB for "COBSINGLE"

       01 DFloat	comp-2.
      *The parameter passed by VB for "COBDOUBLE"

       01 PassStruct.
	  05 FirstItem	pic X(10).
	  05 SecondItem pic X(10).
	  05 ThirdItem	pic X(10).
      *The parameter passed by VB for "COBSTRUCT"

       01 PassFileStatus.
	  05 PassStatus pic x(50).
	  05 PassOpen	pic 9(4) comp-5.
      *A parameter passed by VB for "CREATE"
      *PassStatus is a message returned to VB with results of "CREATE"
      *PassOpen is an integer returned to VB, reporting success/failure.

       01 TargetPath	pic X(80).
      *A parameter passed by VB for "CREATE"
      *TargetPath contains the path and filename for the ISAM file.

       01 PassRecord.
	  05 PassNumber	pic 9(4) comp-5.
	  05 PassName	pic X(15).
	  05 PassCity	pic X(15).
      *The parameter passed by VB for "ADD_RECORD" and "BROWSE"

       procedure division winapi.
      *winapi is required for Windows DLLs.

      ***************************************************************
      *COBINT is called from the Visual Basic form "Pass_Params_Form"
      ***************************************************************
       entry "COBINT" using by reference Int.

	  compute Int = Int * 2.

       exit program.

      ****************************************************************
      *COBLINT is called from the Visual Basic form "Pass_Params_Form"
      ****************************************************************
       entry "COBLINT" using by reference LongInt.

	  compute LongInt = LongInt * 2.

       exit program.

      ********************************************************************
      *COBINTARRAY is called from the Visual Basic form "Pass_Params_Form"
      ********************************************************************
       entry "COBINTARRAY" using by reference IntArray.

	  move 1 to S.
	  perform 3 times
	     compute IntArray(S) = IntArray(S) * 2
	     add 1 to S
	  end-perform

       exit program.

      ******************************************************************
      *COBSTRING is called from the Visual Basic form "Pass_Params_Form"
      ******************************************************************
       entry "COBSTRING" using by reference CblSTRING.

	  move "Here is the Microsoft COBOL string" to CblSTRING.

      *The string sent by Visual Basic is "This is the Microsoft Visual
      *Basic string."

       exit program.

      *****************************************************************
      *COBSINGLE is called from the Visual Basic form "Pass_Params_Form"
      *****************************************************************
       entry "COBSINGLE" using by reference SFloat.

	  compute SFloat = SFloat / 2.

       exit program.

      *****************************************************************
      *COBDOUBLE is called from the Visual Basic form "Pass_Params_Form"
      *****************************************************************
       entry "COBDOUBLE" using by reference DFloat.

	  compute DFloat = DFloat / 2.

       exit program.

      ******************************************************************
      *COBSTRUCT is called from the Visual Basic form "Pass_Params_Form"
      ******************************************************************
       entry "COBSTRUCT" using PassStruct.

	  move "Microsoft" to FirstItem
	  move "COBOL" to SecondItem
	  move " " to ThirdItem

      *The structure sent by Visual Basic is "Microsoft" "Visual" "Basic"

       exit program.

      **********************************************************
      *CREATE is called from the Visual Basic form "Create_Form"
      **********************************************************
       Entry "CREATE" using by reference PassFileStatus
					 TargetPath.

	  move TargetPath to Filename

	  open i-o IsamFile

	  if FileStatus(1:1) = "0"
	     if FileStatus(2:1) = "0"
		move "File already exists." to PassStatus
		move 2 to PassOpen
	     else
		if FileStatus(2:1) = "5"
                   move "File created." to PassStatus
                   move 1 to PassOpen
		else
                   move "Cannot create file." to PassStatus
                   move 3 to PassOpen
               end-if
	     end-if
	  else
	     move "Cannot create file." to PassStatus
	     move 4 to PassOpen
	  end-if
      *This if..end-if checks FileStatus, which is the output of the
      *"open" command.	If the first number in FileStatus is 0, then "open"
      *failed.	Based on the second number in FileStatus, the if..end-if
      *determines whether "open" succeeded.  The second number of FileStatus
      *is taken by PassStatus back to VB.  If PassStatus is not 1, then VB
      *will not allow the user to proceed.

	  close IsamFile.

      *The ISAM file is opened and closed by each subprogram that
      *accesses it to prevent hanging in Windows.

       exit program.

      ***********************************************************
      *ADD_RECORD is called from the Visual Basic form "Add_Form"
      ***********************************************************
       Entry "ADD_RECORD" using by reference PassRecord.

	  open i-o IsamFile.

             move PassNumber to IsamNumber
	     move PassName to IsamName.
	     move PassCity to IsamCity
	     write IsamFile-Rec from PassRecord

      *The passed number, name and city are added to the end of the
      *ISAM file.

	  close IsamFile.

      *The ISAM file is opened and closed by each subprogram that
      *accesses it to prevent hanging in Windows.

       exit program.

      **********************************************************
      *BROWSE is called from the Visual Basic form "Browse_Form"
      **********************************************************
       Entry "BROWSE" using by reference PassRecord.

	  open i-o IsamFile.

	  initialize IsamFile-Rec.

      *IsamFile-Rec will be filled with the items associated with
      *the record number passed in PassRecord.

	  move PassNumber to IsamNumber

	  read IsamFile key is IsamNumber

	  move IsamName to PassName
	  move IsamCity to PassCity
	  move IsamNumber to PassNumber

      *The ISAM file is read, and the items associated with PassNumber
      *are moved to the PassRecord items.

	  close IsamFile.

      *The ISAM file is opened and closed by each subprogram that
      *accesses it to prevent hanging in Windows.

       exit program.
