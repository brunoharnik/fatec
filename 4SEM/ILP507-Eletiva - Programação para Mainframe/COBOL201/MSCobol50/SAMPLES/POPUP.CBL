      $set ans85 noosvs mf
      ************************************************************
      * 							 *
      * 	     (C) Micro Focus Ltd. 1989			 *
      * 							 *
      * 		    POPUP.CBL				 *
      * 							 *
      * 							 *
      *   This program illustrates how to simulate POPUP MENUS	 *
      * 							 *
      *   Internal calls used by this program:			 *
      * 							 *
      * 	      x"af"  -	Used to detect the use of cursor *
      * 			keys.				 *
      * 							 *
      * 	      x"e5"  -	Used to sound the audible alarm. *
      * 							 *
      * CBL_READ_SCR_CHATTRS -	Used to read the characters and  *
      * 			attributes on the screen.	 *
      * 							 *
      * CBL_WRITE_SCR_CHATTRS-	Used to write the characters and *
      * 			attributes on the screen.	 *
      * 							 *
      * CBL_WRITE_SCR_ATTRS  -	Used to set the characters	 *
      * 			on the screen.			 *
      * 							 *
      *     CBL_SET_CSR_POS  -	Used to turn the cursor off.	 *
      * 							 *
      * 							 *
      ************************************************************

       working-storage section.
       01 screen-position.
	   05 screen-row       pic 9(2) comp-x value 05.
	   05 screen-col       pic 9(2) comp-x value 15.
       01 string-length        pic 9(4) comp-x value 15.

       01 top-row	       pic 9(2) comp-x value 05.
       01 bottom-row	       pic 9(2) comp-x value 14.

       01 reverse-vid	       pic x(15) value all x"70".
       01 black-and-white      pic x(15) value all x"07".

       01 screen-origin        pic 9(4) comp-x value 0.
       01 screen-buffer        pic x(2000).
       01 screen-attrs	       pic x(2000).
       01 screen-string-length pic 9(4) comp-x value 2000.

       01 get-single-char      pic 9(2) comp-x value 26.
       01 key-status.
	   05 key-type	       pic x.
	   05 key-code-1       pic 9(2) comp-x.
	   05 key-code-2       pic 9(2) comp-x.

       01 set-bit-pairs        pic 9(2) comp-x value 1.
       01 user-key-control.
	   05 user-key-setting pic 9(2) comp-x value 1.
	   05 filler	       pic x value "1".
	   05 first-user-key   pic 9(2) comp-x value 1.
	   05 number-of-keys   pic 9(2) comp-x value 4.

       78 user-fn-key	       value "1".
       78 adis-fn-key	       value "2".

       78 f1-key	       value 1.
       78 f2-key	       value 2.
       78 f3-key	       value 3.
       78 f4-key	       value 4.

       78 carriage-return      value 0.
       78 up-arrow	       value 5.
       78 down-arrow	       value 6.

       01 cursor-off-screen.
	   05 row-number       pic 99 comp-x value 255.
	   05 col-number       pic 99 comp-x value 255.


       screen section.
       01 g-picscrn.
	   05 blank screen.
	   05 line  6 col 16 value  "Option one".
	   05 line  9 col 16 value  "Option two".
	   05 line 12 col 16 value "Option three".
	   05 line 15 col 16 value "Option four".
	   05 line 21 col 10 value "F1=Help    F2=Window1    F3=Window2
      -"  F4=Clear windows".
	   05 line 22 col 10 value "Use   or   to point to an item, and
      -"<Enter> to Terminate.".

       01   hilite3-00 highlight.
	   05 line 06  col 37 value "旼컴컴컴컴컴컴컴컴컴컴컴커".
	   05 line 07  col 37 value "� this is pop-up menu #1 �".
	   05 line 08  col 37 value "�			      �".
	   05 line 09  col 37 value "� this menu could be     �".
	   05 line 10  col 37 value "� your help menus	      �".
	   05 line 11  col 37 value "�			      �".
	   05 line 12  col 37 value "� It was brought up with �".
	   05 line 13  col 37 value "� F1.		      �".
	   05 line 14  col 37 value "�			      �".
	   05 line 15  col 37 value "읕컴컴컴컴컴컴컴컴컴컴컴켸".

       01   hilite4-00 reverse-video.
	   05 col 1.
	   05 line 04 value "旼컴컴컴컴컴컴컴컴컴컴컴커".
	   05 line 05 value "� this is pop-up menu #2 �".
	   05 line 06 value "�			      �".
	   05 line 07 value "� notice that the menus  �".
	   05 line 08 value "� can overlay one another�".
	   05 line 09 value "�			      �".
	   05 line 10 value "� the attribute you use  �".
	   05 line 11 value "� is determined in the   �".
	   05 line 12 value "� screen section	      �".
	   05 line 13 value "�			      �".
	   05 line 14 value "� this screen is turned  �".
	   05 line 15 value "� on by F2 	      �".
	   05 line 16 value "읕컴컴컴컴컴컴컴컴컴컴컴켸".

       01   hilite5-00	 .
	   05 line 13 value "旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커".
	   05 line 14 value "�	  This screen is pop-up menu #2     �".
	   05 line 15 value "�					    �".
	   05 line 16 value "쿟ake turns in pressing F1, F2, F3     �".
	   05 line 17 value "쿑4 in any order you wish.  Notice that�".
	   05 line 18 value "퀉ou can overlay any and all menus and �".
	   05 line 19 value "쿑4 will clear off back to the original�".
	   05 line 20 value "쿺enu.				    �".
	   05 line 21 value "�					    �".
	   05 line 22 value "쿑unction key # 3 pops-up this screen. �".
	   05 line 23 value "읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸".

       procedure division.
       main-line.
	   perform start-up
	   perform which-key-loop
	       until key-type = adis-fn-key
		 and key-code-1 = carriage-return
	   stop run.

       start-up.
      * Display user screen
	   display g-picscrn

      * Move cursor off screen
	   call "CBL_SET_CSR_POS" using cursor-off-screen

      * Read the current screen for later re-display
	   call "CBL_READ_SCR_CHATTRS" using screen-origin
					      screen-buffer
					      screen-attrs
					      screen-string-length

      * Display first block
	   perform mark-block

      * Enable function keys
	   call x"af" using set-bit-pairs
			    user-key-control
	   .


       which-key-loop.
	   call x"af" using get-single-char
			    key-status
	   evaluate key-type
	     when user-fn-key
	       evaluate key-code-1
		 when f1-key	   display hilite3-00
		 when f2-key	   display hilite4-00
		 when f3-key	   display hilite5-00
		 when f4-key	   perform clear-pop-up
		 when other	   call x"e5"
	       end-evaluate
	     when adis-fn-key
	       evaluate key-code-1
		 when up-arrow	   perform move-block-up
		 when down-arrow   perform move-block-down
		 when other	   call x"e5"
	       end-evaluate
	   end-evaluate.

       pop-up-help.

       pop-up-story1.

       pop-up-story2.

       clear-pop-up.
      * recover the original screen *
	   call "CBL_WRITE_SCR_CHATTRS" using screen-origin
					      screen-buffer
					      screen-attrs
					      screen-string-length
	   perform mark-block.

       move-block-up.
	   perform clear-block
	   if screen-row > top-row
	       subtract 3 from screen-row
	   else
	       move bottom-row to screen-row
	   end-if
	   perform mark-block.

       move-block-down.
	   perform clear-block
	   if screen-row < bottom-row
	       add 3 to screen-row
	   else
	       move top-row to screen-row
	   end-if
	   perform mark-block.

       clear-block.
	   call "CBL_WRITE_SCR_ATTRS" using screen-position
					    black-and-white
					    string-length.

       mark-block.
	   call "CBL_WRITE_SCR_ATTRS" using screen-position
					    reverse-vid
					    string-length.
