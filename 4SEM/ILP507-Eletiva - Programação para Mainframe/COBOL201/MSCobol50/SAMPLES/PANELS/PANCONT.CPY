      ******************************************************************
      *  Example Panel Contents.
      *
      *  Copyright (c) Micro Focus 1987.
      ******************************************************************

       01 Menu-Panel-Text.
	03 FILLER      PIC X(14) VALUE "Panels Example".
	03 FILLER      PIC X(66) VALUE ALL "�".
	03 FILLER      PIC X(09) VALUE "F1=Help  ".
	03 FILLER      PIC X(17) VALUE "F2=Bring to Top  ".
	03 FILLER      PIC X(17) VALUE "F3=Make Invisible".
	03 FILLER      PIC X(21) VALUE SPACES.
	03 FILLER      PIC X(16) VALUE "   =Shift Panel".
	03 FILLER      PIC X(15) VALUE "F4=Next Panel  ".
	03 FILLER      PIC X(17) VALUE "F5=Select Panel  ".
	03 FILLER      PIC X(25) VALUE "F6=Back to Start Position".
	03 FILLER      PIC X(17) VALUE SPACES.
	03 FILLER      PIC X(06) VALUE "Escape".

       01 Menu-Panel-Attributes.
	03 FILLER      PIC X(80) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0E".
	03 FILLER      PIC X(07) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0E".
	03 FILLER      PIC X(15) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0E".
	03 FILLER      PIC X(36) VALUE ALL X"06".
	03 FILLER      PIC X(04) VALUE ALL X"0E".
	03 FILLER      PIC X(12) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0E".
	03 FILLER      PIC X(13) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0E".
	03 FILLER      PIC X(15) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0E".
	03 FILLER      PIC X(40) VALUE ALL X"06".
	03 FILLER      PIC X(03) VALUE ALL X"0E".
	03 FILLER      PIC X(03) VALUE ALL X"06".

       01 Current-Panel-Indicator.
	03 FILLER      PIC X(14) VALUE "Current�Panel=".
	03 Status-ID   PIC X(4).

       01 Panel-A-Text.
	03 FILLER      PIC X(21) VALUE "�������������������Ŀ".
	03 FILLER      PIC X(21) VALUE "�	  �	    �".
	03 FILLER      PIC X(21) VALUE "�	 ���	    �".
	03 FILLER      PIC X(21) VALUE "�	�� ��	    �".
	03 FILLER      PIC X(21) VALUE "�      ��   ��	    �".
	03 FILLER      PIC X(21) VALUE "�     ��     ��     �".
	03 FILLER      PIC X(21) VALUE "�    ��       ��    �".
	03 FILLER      PIC X(21) VALUE "�   �������������   �".
	03 FILLER      PIC X(21) VALUE "�  ��		��  �".
	03 FILLER      PIC X(21) VALUE "� ��		 �� �".
	03 FILLER      PIC X(21) VALUE "���������������������".

       01 Panel-A-Attributes.
	03 FILLER      PIC X(21) VALUE ALL X"0D".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(09) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0B".
	03 FILLER      PIC X(09) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(08) VALUE ALL X"06".
	03 FILLER      PIC X(03) VALUE ALL X"0B".
	03 FILLER      PIC X(08) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(07) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(01) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(07) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(06) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(03) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(06) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(05) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(05) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(05) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(04) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(07) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(04) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(03) VALUE ALL X"06".
	03 FILLER      PIC X(13) VALUE ALL X"0B".
	03 FILLER      PIC X(03) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(02) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(11) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(02) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(01) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(13) VALUE ALL X"06".
	03 FILLER      PIC X(02) VALUE ALL X"0B".
	03 FILLER      PIC X(01) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0D".
	03 FILLER      PIC X(21) VALUE ALL X"0D".

       01 Panel-B-Text.
	03 FILLER      PIC X(09) VALUE "�������Ŀ".
	03 FILLER      PIC X(09) VALUE "������� �".
	03 FILLER      PIC X(09) VALUE "��     ��".
	03 FILLER      PIC X(09) VALUE "��     ��".
	03 FILLER      PIC X(09) VALUE "������� �".
	03 FILLER      PIC X(09) VALUE "��     ��".
	03 FILLER      PIC X(09) VALUE "��     ��".
	03 FILLER      PIC X(09) VALUE "������� �".
	03 FILLER      PIC X(09) VALUE "���������".

       01 Panel-B-Attributes.
	03 FILLER      PIC X(09) VALUE ALL X"02".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(06) VALUE ALL X"04".
	03 FILLER      PIC X(01) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(01) VALUE ALL X"04".
	03 FILLER      PIC X(05) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"04".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(01) VALUE ALL X"04".
	03 FILLER      PIC X(05) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"04".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(06) VALUE ALL X"04".
	03 FILLER      PIC X(01) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(01) VALUE ALL X"04".
	03 FILLER      PIC X(05) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"04".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(01) VALUE ALL X"04".
	03 FILLER      PIC X(05) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"04".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(06) VALUE ALL X"04".
	03 FILLER      PIC X(01) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"02".
	03 FILLER      PIC X(09) VALUE ALL X"02".

      *    The selection panel is created with a width of 12. The text
      *    to be written to it, however, is organised in lines of 80
      *    characters. Therefore, there is 68 characters between the
      *    end of the text for one line and the start of the text for
      *    the next line. (The text and attributes for this panel were
      *    created by using the FORMS utility).
      *
      *    This situation is handled when writing text and/or attributes
      *    to a panel by setting the PPB-Vertical-Stride field in the
      *    Panels-Parameter-Block to the distance between the start of
      *    one line in the text to be wriiten and the start of the next
      *    line, in this case, PPB-Vertical-Stride should be set to 80.

       01 Selection-Panel-Text.
	03 FILLER      PIC X(12) VALUE "����������ͻ".
	03 FILLER      PIC X(68).
	03 FILLER      PIC X(12) VALUE "�Panel A   �".
	03 FILLER      PIC X(68).
	03 FILLER      PIC X(12) VALUE "�Panel B   �".
	03 FILLER      PIC X(68).
	03 FILLER      PIC X(12) VALUE "�Menu Panel�".
	03 FILLER      PIC X(68).
	03 FILLER      PIC X(12) VALUE "�Help Panel�".
	03 FILLER      PIC X(68).
	03 FILLER      PIC X(12) VALUE "����������ͼ".
	03 FILLER      PIC X(68).

       01 Selection-Panel-Attributes.
	03 FILLER      PIC X(12) VALUE ALL X"0E".
	03 FILLER      PIC X(68) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0E".
	03 FILLER      PIC X(10) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0E".
	03 FILLER      PIC X(68) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0E".
	03 FILLER      PIC X(10) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0E".
	03 FILLER      PIC X(68) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0E".
	03 FILLER      PIC X(10) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0E".
	03 FILLER      PIC X(68) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0E".
	03 FILLER      PIC X(10) VALUE ALL X"06".
	03 FILLER      PIC X(01) VALUE ALL X"0E".
	03 FILLER      PIC X(68) VALUE ALL X"06".
	03 FILLER      PIC X(12) VALUE ALL X"0E".
	03 FILLER      PIC X(68) VALUE ALL X"06".

       01 Help-Background-Text.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE ALL "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE SPACES.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE SPACES.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE SPACES.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE SPACES.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE SPACES.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE SPACES.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE SPACES.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE SPACES.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE SPACES.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE SPACES.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE SPACES.
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE ALL "�".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(50) VALUE "� Use shifted     to scroll the
      -    " help text.      �".
	03 FILLER      PIC X(01) VALUE "�".
	03 FILLER      PIC X(48) VALUE ALL "�".
	03 FILLER      PIC X(01) VALUE "�".

       01 Help-Background-Attributes.
	03 FILLER      PIC X(0600) VALUE ALL X"07".
	03 FILLER      PIC X(0052) VALUE ALL X"07".
	03 FILLER      PIC X(0046) VALUE ALL X"0F".
	03 FILLER      PIC X(0052) VALUE ALL X"07".

       01 Help-Screen-Text.
	03 FILLER      PIC X(0009) VALUE SPACES.
	03 FILLER      PIC X(0029) VALUE
	   "PANELS Example Program - Help".
	03 FILLER      PIC X(0122) VALUE SPACES.
	03 FILLER      PIC X(0045) VALUE "This program demonstrates the
      -    "facilities made".
	03 FILLER      PIC X(0035) VALUE SPACES.
	03 FILLER      PIC X(0041) VALUE "available to the programmer by
      -    " the PANELS".
	03 FILLER      PIC X(0039) VALUE SPACES.
	03 FILLER      PIC X(0037) VALUE "module. The following keys are
      -    " used :".
	03 FILLER      PIC X(0123) VALUE SPACES.
	03 FILLER      PIC X(0046) VALUE "F1	Help. Brings this panel
      -    "back to the top.".
	03 FILLER      PIC X(0040) VALUE SPACES.
	03 FILLER      PIC X(0037) VALUE "The Shifted     keys will scr
      -    "oll the".
	03 FILLER      PIC X(0043) VALUE SPACES.
	03 FILLER      PIC X(0034) VALUE "help text even if another pane
      -    "l is".
	03 FILLER      PIC X(0046) VALUE SPACES.
	03 FILLER      PIC X(0021) VALUE "currently being used.".
	03 FILLER      PIC X(0133) VALUE SPACES.
	03 FILLER      PIC X(0080) VALUE "F2	Bring panel to the top.
      -    "The currently selected panel is enabled and will  ".
	03 FILLER      PIC X(0047) VALUE
	   "	  overlay any panel previously covering it.".
	03 FILLER      PIC X(0113) VALUE SPACES.
	03 FILLER      PIC X(0078) VALUE "F3	Make panel invisible. Th
      -    "e currently selected panel is disabled, that is,".
	03 FILLER      PIC X(0008) VALUE SPACES.
	03 FILLER      PIC X(0025) VALUE "removed from the display.".
	03 FILLER      PIC X(0129) VALUE SPACES.
	03 FILLER      PIC X(0041) VALUE "F4	Select the next panel to
      -    " work with.".
	03 FILLER      PIC X(0045) VALUE SPACES.
	03 FILLER      PIC X(0040) VALUE "The panels are selected in the
      -    " following".
	03 FILLER      PIC X(0040) VALUE SPACES.
	03 FILLER      PIC X(0053) VALUE "order : Panel A - Panel B - Me
      -    "nu - Help - Panel A ...".
	03 FILLER      PIC X(0101) VALUE SPACES.
	03 FILLER      PIC X(0044) VALUE "F5	Select a panel to work w
      -    "ith. A list of".
	03 FILLER      PIC X(0042) VALUE SPACES.
	03 FILLER      PIC X(0037) VALUE "possible panels is displayed.
      -    "Use the".
	03 FILLER      PIC X(0043) VALUE SPACES.
	03 FILLER      PIC X(0034) VALUE "following keys to select a pan
      -    "el :".
	03 FILLER      PIC X(0128) VALUE SPACES.
	03 FILLER      PIC X(0030) VALUE
	   "     Move up and down the list".
	03 FILLER      PIC X(0050) VALUE SPACES.
	03 FILLER      PIC X(0019) VALUE " ��  Select a panel".
	03 FILLER      PIC X(0061) VALUE SPACES.
	03 FILLER      PIC X(0046) VALUE "Esc  Remove list without selec
      -    "ting a new panel".
	03 FILLER      PIC X(0106) VALUE SPACES.
	03 FILLER      PIC X(0069) VALUE "F6	Move the currently selec
      -    "ted panel back to its initial position.".
	03 FILLER      PIC X(0091) VALUE SPACES.
	03 FILLER      PIC X(0046) VALUE "   	Shift the currently sele
      -    "cted panel down,".
	03 FILLER      PIC X(0040) VALUE SPACES.
	03 FILLER      PIC X(0040) VALUE "left, up or right. As a panel
      -    "encounters".
	03 FILLER      PIC X(0040) VALUE SPACES.
	03 FILLER      PIC X(0038) VALUE "another panel, it will pass ov
      -    "er it or".
	03 FILLER      PIC X(0042) VALUE SPACES.
	03 FILLER      PIC X(0040) VALUE "under it depending on the orde
      -    "r in which".
	03 FILLER      PIC X(0040) VALUE SPACES.
	03 FILLER      PIC X(0033) VALUE "the panels were enabled. The m
      -    "ost".
	03 FILLER      PIC X(0047) VALUE SPACES.
	03 FILLER      PIC X(0041) VALUE "recently enabled panel will al
      -    "ways be the".
	03 FILLER      PIC X(0039) VALUE SPACES.
	03 FILLER      PIC X(0010) VALUE "top panel.".
	03 FILLER      PIC X(0150) VALUE SPACES.
	03 FILLER      PIC X(0039) VALUE "The panels are initially enabl
      -    "ed in the".
	03 FILLER      PIC X(0041) VALUE SPACES.
	03 FILLER      PIC X(0040) VALUE "order : Menu - Panel A - Panel
      -    " B - Help.".
	03 FILLER      PIC X(0114) VALUE SPACES.
	03 FILLER      PIC X(0028) VALUE "Esc	Exit from the program.".
	03 FILLER      PIC X(0052) VALUE SPACES.

       01 Help-Screen-Attributes.
	03 FILLER      PIC X(0009) VALUE ALL X"07".
	03 FILLER      PIC X(0029) VALUE ALL X"0F".
	03 FILLER      PIC X(0442) VALUE ALL X"07".
	03 FILLER      PIC X(0002) VALUE ALL X"0F".
	03 FILLER      PIC X(0088) VALUE ALL X"07".
	03 FILLER      PIC X(0012) VALUE ALL X"0F".
	03 FILLER      PIC X(0298) VALUE ALL X"07".
	03 FILLER      PIC X(0002) VALUE ALL X"0F".
	03 FILLER      PIC X(0238) VALUE ALL X"07".
	03 FILLER      PIC X(0002) VALUE ALL X"0F".
	03 FILLER      PIC X(0238) VALUE ALL X"07".
	03 FILLER      PIC X(0002) VALUE ALL X"0F".
	03 FILLER      PIC X(0318) VALUE ALL X"07".
	03 FILLER      PIC X(0002) VALUE ALL X"0F".
	03 FILLER      PIC X(0238) VALUE ALL X"07".
	03 FILLER      PIC X(0088) VALUE ALL X"07".
	03 FILLER      PIC X(0003) VALUE ALL X"0F".
	03 FILLER      PIC X(0077) VALUE ALL X"07".
	03 FILLER      PIC X(0003) VALUE ALL X"0F".
	03 FILLER      PIC X(0077) VALUE ALL X"07".
	03 FILLER      PIC X(0003) VALUE ALL X"0F".
	03 FILLER      PIC X(0149) VALUE ALL X"07".
	03 FILLER      PIC X(0002) VALUE ALL X"0F".
	03 FILLER      PIC X(0158) VALUE ALL X"07".
	03 FILLER      PIC X(0004) VALUE ALL X"0F".
	03 FILLER      PIC X(0876) VALUE ALL X"07".
	03 FILLER      PIC X(0003) VALUE ALL X"0F".
	03 FILLER      PIC X(0717) VALUE ALL X"07".

