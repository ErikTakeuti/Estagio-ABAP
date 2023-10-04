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