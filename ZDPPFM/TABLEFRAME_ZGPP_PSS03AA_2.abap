*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZGPP_PSS03AA_2
*   generation date: 09/30/2008 at 15:15:38 by user 101457
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZGPP_PSS03AA_2     .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
