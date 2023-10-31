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
### PROGRAMA 3 - USO DE TELAS E USO DE BUTTONS

```abap
REPORT zprog_003_02.

TABLES: zprodutos_02,
        zvendas_02.

SELECTION-SCREEN  BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

PARAMETERS: lv_data TYPE sy-datum,
            lv_num  TYPE i,
            lv_nome TYPE c LENGTH 30.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

SELECT-OPTIONS: lv_prod FOR zprodutos_02-produto OBLIGATORY,
                lv_prec FOR zprodutos_02-preco NO INTERVALS,
                lv_vend FOR zvendas_02-venda.

SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.

  PARAMETERS: lv_rb1 RADIOBUTTON GROUP rb, "Apenas uma marcação
              lv_rb2 RADIOBUTTON GROUP rb,
              lv-rb3 RADIOBUTTON GROUP rb.

  PARAMETERS: lv_c1 AS CHECKBOX, "Mais de uma opção, ele fica marcado com um 'X'
              lv_c2 AS CHECKBOX DEFAULT 'X', "Deixa a opção marcada no inicio
              lv_c3 AS CHECKBOX.

  SELECTION-SCREEN END OF BLOCK b3.
```
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### PROGRAMA 4 - CALCULADORA UTILIZANDO AS TELAS E BUTTONS

```abap
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
```
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
