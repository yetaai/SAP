FUNCTION Z_FCO_READ_ZVCO_MLXXV_BY_MVTGR.
*"----------------------------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     VALUE(IM_BDATJ) TYPE  MLCR-BDATJ
*"     VALUE(IM_POPER) TYPE  MLCR-POPER
*"     VALUE(IM_CURTP) TYPE  MLCR-CURTP
*"  TABLES
*"      IT_UNI_ZTCO_MATLEDGER STRUCTURE  ZTCO_MATLEDGER
*"      IT_PAR_BEWARTGRP STRUCTURE  CKMLMV010
*"----------------------------------------------------------------------

  TABLES *MLIT.

  DATA : BEGIN OF IT_L_TMP_MATLEDGER OCCURS 0,
          BELNR LIKE MLIT-BELNR,
          KJAHR LIKE MLIT-KJAHR.
          INCLUDE STRUCTURE  ZTCO_MATLEDGER.
  DATA : END OF  IT_L_TMP_MATLEDGER.
  DATA :  WA_L_TMP_MATLEDGER LIKE   ZTCO_MATLEDGER.
  RANGES : R_BEWARTGRP FOR CKMLMV010-MLBWG.

  CLEAR : R_BEWARTGRP, R_BEWARTGRP[].
  LOOP AT IT_PAR_BEWARTGRP.
    R_BEWARTGRP-LOW    = IT_PAR_BEWARTGRP-MLBWG.
    R_BEWARTGRP-SIGN   = 'I'.
    R_BEWARTGRP-OPTION = 'EQ'.
    APPEND R_BEWARTGRP.
    CLEAR  R_BEWARTGRP.
  ENDLOOP.

* Index MLPP MLCR - ZD1
  SELECT * INTO CORRESPONDING FIELDS OF TABLE IT_L_TMP_MATLEDGER
           FROM ZVCO_MLXXV
          WHERE BDATJ     = IM_BDATJ
            AND POPER     = IM_POPER
            AND CURTP     = IM_CURTP
            AND BEWARTGRP IN R_BEWARTGRP.

* Collect
  CLEAR : IT_UNI_ZTCO_MATLEDGER
        , IT_UNI_ZTCO_MATLEDGER[].
  LOOP AT IT_L_TMP_MATLEDGER.
    MOVE-CORRESPONDING IT_L_TMP_MATLEDGER TO WA_L_TMP_MATLEDGER.
    COLLECT WA_L_TMP_MATLEDGER INTO IT_UNI_ZTCO_MATLEDGER.
    CLEAR WA_L_TMP_MATLEDGER .
  ENDLOOP.

ENDFUNCTION.