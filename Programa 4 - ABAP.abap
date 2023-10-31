REPORT zprog_004_02.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

PARAMETERS: lv_n1 TYPE p DECIMALS 1,
            lv_n2 TYPE p DECIMALS 1.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

PARAMETERS: lv_op1 RADIOBUTTON GROUP op,
            lv_op2 RADIOBUTTON GROUP op,
            lv_op3 RADIOBUTTON GROUP op,
            lv_op4 RADIOBUTTON GROUP op,
            lv_op5 RADIOBUTTON GROUP op.

SELECTION-SCREEN END OF BLOCK b2.

DATA: resulta TYPE p DECIMALS 1.

IF  ( lv_n2 = 0 ) AND ( lv_op4 = 'X' ).
WRITE: 'NÃO É POSSIVEL FAZER DIVISÃO POR 0'.

ELSEIF lv_op1 = 'X'.
  resulta = lv_n1 + lv_n2.
  WRITE: 'A SOMA É: ' , resulta.

ELSEIF lv_op2 = 'X'.
  resulta = lv_n1 - lv_n2.
  WRITE: 'A SUBTRAÇÃO É: ' , resulta.

ELSEIF lv_op3 = 'X'.
  resulta = lv_n1 * lv_n2.
  WRITE: 'A MULTIPLICAÇÃO É: ' , resulta.

ELSEIF lv_op4 = 'X'.
  resulta = lv_n1 / lv_n2.
  WRITE: 'A DIVISÃO É: ' , resulta.

ELSEIF lv_op5 = 'X'.
  resulta = SQRT( lv_n1 ).
  WRITE: 'A RAIZ QUADRADA É: ', resulta.
ENDIF.