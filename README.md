# Estagio-ABAP

### PROGRAMA 1 - CONCEITOS BÁSICOS

```abap
REPORT zprog_001_02.

DATA: lv_int(03) TYPE i,  "WARNING - Variáveis do tipo I não tem definição de tamenho
      lv_data    TYPE d,
      lv_time    TYPE t,
      lv_char    TYPE c LENGTH 20.

DATA: lv_produto TYPE zproduto_02,        "NUMC(10)
      lv_preco   TYPE zprodutos_02-preco. "CURR

lv_int = 10.
lv_data = '20231003'.
lv_time = '155100'.
lv_char = 'ABAP'.

lv_produto = '600'.
lv_preco = '7.99' .

WRITE: lv_int , lv_data DD/MM/YYYY , lv_time , lv_char CENTERED.
SKIP.

ULINE.

SKIP.
WRITE: lv_produto NO-ZERO , lv_preco CURRENCY 'BRL'.
```
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### PROGRAMA 2 - EXERCÍCIO 1 - USO DO WHILE

```abap
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
```
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
