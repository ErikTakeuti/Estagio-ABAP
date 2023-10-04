REPORT zprog_002_02.

DATA:lv_mensagem TYPE c LENGTH 50,
     lv_cont     TYPE i.

lv_cont = 1.
lv_mensagem = 'ABAP É O MÁXIMO'.


WHILE  lv_cont <= 20.

  IF lv_cont = 18.
    WRITE: / 'LINHA 18' CENTERED.
    lv_cont = lv_cont + 1.
    CONTINUE.
  ENDIF.

  IF lv_cont MOD 2 = 0.
    WRITE: / lv_mensagem LEFT-JUSTIFIED.
  ELSE.
    WRITE: / lv_mensagem RIGHT-JUSTIFIED.
  ENDIF.

  lv_cont = lv_cont + 1.

ENDWHILE.