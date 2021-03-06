#�$ ��
  t   Pass_Params_Form� ,Examples of Passing Variables to a COBOL DLL �� �@  �   `  $  �   B #�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���                       ����          �������        ��������       ����������     ����  �����    �����������    ����	�������   �����  	����  ���� ��� ����  ������������  ������������� ���������������  ��������  �������������������������������������������������������������  ��  ���������  ��  ����� ����  ��  ����  ����  ��  ����  ����  ��  ����  �����������   ������������    ������������    �����������     ����������       ��������        �������          ����                      �������  �  ?�  �  �  �  �  �  �  �                                  �  �  �  �  �  �  �  �  �  ?�  ������$Form1- �5   Integer_Cmd� Pass Integer to DLL� � o	w  �.   Integer_Text����     @� �w1
 �o   �Integer_Label� AThe COBOL subprogram "COBINT" multiplies this short integer by 2. ��     �� N� �?   Long_Integer_Cmd� Pass Long Integer to DLL� �o	w �.   	Long_Integer_Text���� @�7w1 �o   �Long_Int_Label� @The COBOL subprogram "COBLINT" multiples this long integer by 2. ��     X�?� �A   Integer_Array_Cmd� Pass Integer Array to DLL� �o	l �-   
Int_Array_Text_1���� @�Wl1 �-   Int_Array_Text_2���� ��Wl2 �-   Int_Array_Text_3���� *�Wl3 �q   �Int_Array_Label� FThe COBOL subprogram "COBINTARRAY" multiplies each array element by 2. �� ��2
l �3   
String_Cmd� Pass String to DLL� P
o	l �H   String_Text����� @P
o	lThis is the Visual Basic string �d   �String_Label� <The COBOL subprogram "COBSTRING" returns a different string. �� �P
�
l �9   
SFloat_Cmd� Pass Single Float to DLL� o	| �*   SFloat_Text���� @�|1.0	 �b   �SFloat_Label� :The COBOL subprogram "COBSINGLE" divides this number by 2. �� �\� �9   �
DFloat_Cmd� Pass Double Float to DLL� �o	| �*   �DFloat_Text���� @�o	|1.0 �b   �DFloat_Label� :The COBOL subprogram "COBDOUBLE" divides this number by 2. �� ���� �8   
Struct_Cmd� Pass Struct to DLL��� � �~	l �2   Struct_Text_1���� @�l	Microsoft �/   Struct_Text_2���� x��lVisual �.   Struct_Text_3���� 8��lBasic �z   �Struct_Label� MThe COBOL subprogram "COBSTRUCT" returns different values for this structure. ��     ��m� �&   �C_ISAM_Example�&ISAM Example�#   �C_Reset�&Reset Parameters�   �C_About�&About�   �C_Exit�&Exit�Z!  �   
Qd�
   q a� � z �Z M� ����	R�$�� kl � )  o�� �i
                �
  �  Command1_Click�  X� text1
 Text�  COBINT�  Command2_Click� COBLINTi text2� Y�  
Form_Click� Text1_Change+ Command3_Click� IntArray I= text3V VBCOB text4K text5P COBINTARRAYx Command4_Clickz 
StringType� D] 	StringVar� StingVar& StringField� text6   	COBSTRING� Command5_Click| 	doublevar� text7? intpart� 	fractpart� COBFLOAT� fmt� Text6_Change� Command6_Click1 	PassStrctc 	FirstName text8q PassStr�	 
PassStruct  
SecondName0 text9� ZipCode� text10+ PassStructF� StructFirstName� StructSecondName] StructZipCoden VbType� StructF� Text8_Change	 Command8_Click� Text2_Change Text3_Change�	 Command7_Click� Text7_ChangeA C_FileAccess_Click� C_About_Click   messbox NLe 
MsgBoxText� Respont� Msg� Title< C_Create_Click� CreateCobFile CobFileStatus4 result� 	DirSelect Form1� button1�	 clickU
 renR pressedy False� DirectorySelected   r� visible� True� C_SelectPath_Click` 
TargetPassD	 Fs FiName� F_Name� Pass� PassVal� 
TargetPath� Temp� PathVal� 
TargetPahtB Message� PathVar   PassVar� C_Browse_Click� 
BrowseFormJ C_End_Click_ Integer_Cmd_Clickz Integer_Text� Long_Integer_Cmd_Click� Long_Integer_Text� Integer_Array_Cmd_Click� Int_Array_Text8 Int_Array_Text_2' Int_Array_Text_1I Int_Array_Text_3Z String_Cmd_Click� String_TextU Reset_Cmd_Click� Single_Text� Double_Text� Struct_� Struct_Text_1x
 Struct_Text_2� Struct_Text_3h Struct_Cmd_Click' Single_Cmd_Click Single_Text_Change� String_Text_ChangeU	 Struct_Text_1_Change   	COBSTRUCT� SingleFloat2 	COBSINGLE? Single_Floatw Double_Cmd_Click" DoubleFloat)	 Double_Float3	 	COBDOUBLE� Double_Text_Changec 
Pass_Param^ Pass_Params_Form Directory_Select_Form�
 Browse_ISAM_Form	 SFloat� DFloat� Exit_Cmd_Click�	 
About_Form C_ISAM_Example_Click�	 Create�	 Dir_Sep	 C_Exit_ClickO Dir_Select_Form, q�	 Single_Label_Click   	Form_Load� StartString� label1   caption� StructFirstItem� StructSecondItem�	 StructThirdItem   Create_Form
 
PassStringC
 Whole
 IntegerPart   FractionPart� Float	 	FloatPart�
 
Float_Text�	 Float_Cmd_Click   label2�	 OriginalFloat�	 FloatForCOBOL�	 Int_Array_Text_3_Change   C_Reset_Click   inJ
 Max   Min   	Remainder�
 Negative
 Odd�
 ISAMFileStatuso
 tpe   Open   AddRec;
 Add_Form!
 
StructType   	variables�
 are   returneda
 non.
 	inclusive   	supported   here   has   already   executed   oded   �
 added   after   SFloat_Text   DFloat_   DFloat_Text   SFloat_Cmd_Click   SingleSFloat   DFloat_Cmd_Click    	  ��������      C_About_Click 0D     X  A       v (    This is an information box for VBCOB.    
 � ��    Message$ = "An example program which demonstrates" + Chr$(10) + "calling a COBOL DLL from Visual Basic." + Chr$(10) + Chr$(10) + "Microsoft COBOL 5.0" + Chr$(10) + "Microsoft Visual Basic" �    About VBCOB"� �� � �$    9 	  ������H 	      Integer_Cmd_Click 0
     X         v ,    This is an example of passing an integer.   � V     l     z �  l  v %   X takes the value in the text box.     l ��  � �� � � �  l ��  � � � � � � I �   l #  �   l �    z  2 " �  �  Out of range."  x  8  v -   If X is within Integer range, X is sent to  v 0   the COBOL Dll.  The returned value is entered v    in the text box.T v '   If X is out of range, an informations v )   box is shown, and the COBOL DLL is notr v 
   called.      9 	  ��������      Long_Integer_Cmd_Click 0�     X  0      � "   
  �   J z �  �  v %   Y takes the value in the text box.o    � ��  � �� � � �  � ��  � � � � � � I �    � #  �    � �  J z  2 �   �    Out of range."  x  8  v .   If Y is within Long range, Y is sent to the v ,   COBOL Dll.  The returned value is entered v    in the text box.  v /   If Y is out of range, and information box iso v *   shown, and the COBOL DLL is not called.    9 	  ��������      Integer_Array_Cmd_Click 0�     X  _       v 3    This is an example of passing an array to COBOL.    ^ �� �   � z � � �   � z � � �   � z � � �  v +   The values of the text boxes are enteredt v    into the array.   ��  � � � �	 ��  � �� �	 v .   These are the limits on the Long data type.    l ��> ���   l   � �	� I � 0 l   � �	  8    l   � �	� I � 0 l   � �	  8  M ��  v %   The array elements are checked fore v    acceptable ranget   �	��  � �� � � � �	��  � � � � � � I �  �  � #    �  � �  � z   �  � �  � z   �  � �  � z  2 �  �    Out of range."  x  8  v /   If all element values are within Long range,a v *   the address of the array is sent to the v .   COBOL DLL.  The returned values are entered v    in the text boxes.t v 0   If an element is out of range, an information v )   box is shown, and the COBOL DLL is nots v 
   called.    9 	  ��������+      String_Cmd_Click 0l     X  �       v 3    This is an example of passing a string to COBOL.s   � ^  =  � v '   StringType is declared in Global.Basn    � z ��� �  �  Here� I �   � / F + Reset the parameter to repeat this command."  x  8  v .   This subprogram works only once, then needs v .   to be reset.  This loop checks to see if it v    has already executed.    � z  � i v *   The parameter takes on the value of the v    text box.    �#  �  � i � z  v )   The COBOL DLL is called, and the valuev v ,   returned for PassString is entered in the v    text box.    9 	  ��������      Struct_Cmd_Click 0�     X  Z       v /    This is an example of passing a user-definedd  v     type to COBOL.m   � r  �	  1 v '   StructType is declared in Global.Bas-    8 z ��� � 	 �  COBOL"� I   � / H + Reset the parameter to repeat this command."  x  8  v .   This subprogram works only once, then needs v .   to be reset.  This loop checks to see if it v    has already executed.    ' z  1 s  8 z  1 �  I z  1 � v -   PassStruct takes on the values of the text  v 	   boxes.r    1#  �  1 s ' z   1 � 8 z   1 � I z  v -   The subprogram is called, and the returnedu v /   struct values are entered in the text boxes.     9 	  ��������      C_Exit_Click 0B      X         v     This ends the program.    7     9 	  ��������     	 Form_Load 0�      X  B       v 3    Variables are initialized as the form is loaded.    � # V  This is the Visual Basic string"O O � z    �	 �	    9 	  ��������	      C_ISAM_Example_Click 0     X  �       v 1    If the ISAM file has not already been created,   v .    clicking on ISAM Example shows Create_Form.  v      Otherwise, Add_Form is shown.    �	 �	 � I �    �e �   x  2 �    �	e �   x  8     ce    x     9 	  ��������      C_Reset_Click 0�     X  p	       v 2    When Reset Parameters is clicked, the parameter  v 3    variables are returned to their starting values.    �  �  1"   z  �  �  1" J z  �  �  1" � z  �  �  2" � z  �  �  3" � z  � # �  This is the Visual Basic string" � z  �  0 1.0" �
 z  �  H 1.0" �
 z  �  `	 Microsoft" ' z  � 
 ~ Visual 8 z  � 	 � Basic" I z     9 	  ��������      SFloat_Cmd_Click 0�     X  �
      � "     �  �
 z �  � v )   SFloat takes the value in the text boxt    �� � 4�s�k@�(� - � � � � � � �  �� � ��� � � I �    �#  �   ��  �
 z  2 �   �  �  Out of range."  x  8  v /   If SFloat is within Single range, SFloat is t v 1   sent to the COBOL DLL.  The returned value is   v    entered in the text box.  v 4   If SFloat is out of range, and information box is v *   shown, and the COBOL DLL is not called.    9   	  ��������      DFloat_Cmd_Click 0�      X  �
      � "     �  �
 z �  � v )   DFloat takes the value in the text box.    �#  2  ��  �
 z  v +   DFloat is sent to the COBOL DLL, and thed v -   returned value is entered in the text box.     9 	  ��������    �