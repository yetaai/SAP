FUNCTION Z_FPM_GET_FUNC_LOCATION.
*"----------------------------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     VALUE(I_WERKS) LIKE  T001W-WERKS
*"  EXPORTING
*"     VALUE(RETURN) LIKE  BAPIRETURN STRUCTURE  BAPIRETURN
*"  TABLES
*"      T_FUNC_LIST STRUCTURE  ZSPM_FUNC_LOC
*"  EXCEPTIONS
*"      NOT_FOUND_FUNC_LOCATION
*"----------------------------------------------------------------------

  DATA: LV_TPLNR LIKE IFLOT-TPLNR.

  CLEAR IT_FUNC_LIST.    REFRESH IT_FUNC_LIST.

  CLEAR RETURN.
  IF I_WERKS IS INITIAL.
    PERFORM ERROR_MESSAGE USING TEXT-M00 '' '' '' RETURN.
  ENDIF.
  PERFORM GET_FUNC_LOC_LIST TABLES IT_FUNC_LIST
                              USING  I_WERKS.
  T_FUNC_LIST[] = IT_FUNC_LIST[].

ENDFUNCTION.