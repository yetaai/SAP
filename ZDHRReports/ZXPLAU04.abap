*----------------------------------------------------------------------*
*   INCLUDE ZXPLAU04                                                   *
*----------------------------------------------------------------------*
*CREATION DATE: 11/18/2004
*AUTHOR       : YONGPING
*DESCRIPTION  : WHEN PERSON WAS HIRED ON FIRST DAY OF THE MONTH,
*               THE SYSTEM WILL CALCULATE THE VACATION DAYS BASED ON
*               PREVIOUS DAY OF HIRE DATE. THIS CODE IS USED TO DEDUCT
*               THE ONE EXTRA DAY GENERATED BY STANDARD PROGRAM.
*CHANGE       :

DATA: l_days TYPE i.
DATA: l_year TYPE i.
DATA: l_current_date.
DATA: l_hire_date LIKE pa0000-begda.

*... Begin{ Add by HKYOON 6/21/2012
DATA: dar_xx TYPE datar,
      dat_xx TYPE dardt.

DATA: ls_p0041 TYPE p0041.
*...}End

* CHECK THE QUOTA TYPE
IF xqtype NE '13'.
  xqtnum = xaccac.
  EXIT.
ENDIF.

*... Begin{ Add by HKYOON 6/21/2012
*READING THE PERSON'S HIRE DATE
SELECT SINGLE * INTO CORRESPONDING FIELDS OF ls_p0041
  FROM pa0041
  WHERE pernr = xpernr
   AND begda <= xacend
   AND endda >= xacbeg.

DO 12 TIMES VARYING dar_xx FROM ls_p0041-dar01 NEXT ls_p0041-dar02
            VARYING dat_xx FROM ls_p0041-dat01 NEXT ls_p0041-dat02.
  IF dar_xx EQ 'ZC'.
    l_hire_date = dat_xx.
    EXIT.
  ENDIF.
ENDDO.
*SELECT MIN( dat02 ) INTO l_hire_date
*  FROM pa0041
*   WHERE pernr = xpernr.
*...}End


* CHECK IF THE HIRE DATE IS THE FIRST DAY OF THE MONTH
l_days = l_hire_date+6(2).
*  "EVALUATE FOR THE HIRE YEAR
IF l_days = 1 AND xacbeg(4) EQ l_hire_date(4).
*   CHECK IF THE CURRENT YEAR IS THE HIRE YEAR

  xqtnum = xaccac - 1.

ELSE.
  xqtnum = xaccac.
ENDIF.
