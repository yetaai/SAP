*&-------------------------------------------------------------*
*& Report ZTPP_WOSUM2_BK_L
*&-------------------------------------------------------------*
*System name         : HMI SYSTEM
*Sub system name     : ARCHIVE
*Program name        : Archiving : ZTPP_WOSUM2_BK (Reload)
*Program descrition  : Generated automatically by the ZHACR00800
*Created on   : 20130521          Created by   : T00302
*Changed on :                           Changed by    :
*Changed descrition :
*"-------------------------------------------------------------*
REPORT ZTPP_WOSUM2_BK_L .

***** Include TOP
INCLUDE ZTPP_WOSUM2_BK_T .

***** Selection screen.
PARAMETERS: TESTRUN               AS CHECKBOX,
            OBJECT    LIKE         ARCH_IDX-OBJECT
                      DEFAULT 'ZTPP_WOSUM' NO-DISPLAY .

***** Main login - common routine of include
PERFORM RELOADING_PROCESS.

***** Common routine
INCLUDE ZITARCL.

***** History for each object,
***** processing required for each part defined,
FORM INSERT_FROM_TABLE.
  INSERT (ARC_TABLE) FROM TABLE T_ITAB.
  COMMIT WORK.
  CLEAR : T_ITAB, T_ITAB[].
ENDFORM.
