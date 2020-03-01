' Global declarations

' StringType is a parameter type for "COBSTRING"

Type StringType
   StringField As String * 35
End Type


' StructType is a parameter type for "COBSTRUCT"

Type StructType
     StructFirstItem As String * 10
     StructSecondItem As String * 10
     StructThirdItem As String * 10
End Type


' ISAMFileStatus is a parameter for "CREATE" and
' is used by VB forms to keep track of whether the
' ISAM file has been opened yet.

Type FileStatusType
    Message As String * 50
    Open As Integer
End Type
Global ISAMFileStatus As FileStatusType


' PathType is a parameter type for "CREATE"

Type PathType
    PathString As String * 50
End Type
Global TargetPath As PathType


' RecordNumber is used by VB forms to keep track
' of the number of records in the ISAM file.

Global RecordNumber As Integer


' RecordType is a parameter type for "ADD_RECORD"
' and "BROWSE"

Type RecordType
     PassNumber As Integer
     PassName As String * 15
     PassCity As String * 15
End Type


' The following are declarations for subprograms found in vbcob.dll

Declare Sub COBINT Lib "vbcob.dll" (X As Integer)
Declare Sub COBLINT Lib "vbcob.dll" (Y As Long)
Declare Sub COBINTARRAY Lib "vbcob.dll" (IntArray As Integer)
Declare Sub COBSTRING Lib "vbcob.dll" (PassString As StringType)
Declare Sub COBSINGLE Lib "vbcob.dll" (SFloat As Single)
Declare Sub COBDOUBLE Lib "vbcob.dll" (DFloat As Double)
Declare Sub COBSTRUCT Lib "vbcob.dll" (PassStruct As StructType)
Declare Sub CREATE Lib "vbcob.dll" (ISAMFileStatus As FileStatusType, TargetPath As PathType)
Declare Sub BROWSE Lib "vbcob.dll" (PassRecord As RecordType)
Declare Sub ADD_RECORD Lib "vbcob.dll" (PassRecord As RecordType)




