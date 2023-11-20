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
### PROGRAMA 5 - UTILIZAÇÃO DE CLASSES GLOBAIS

```abap
REPORT zprog_010_02.

TABLES: zvendas_02,
        zestoque_02,
        zprodutos_02.

DATA: ls_produto TYPE zprodutos_e_02,
      lt_produto TYPE TABLE OF zprodutos_e_02,
      cl_produto TYPE REF TO zcl_produto_02,

      lt_est     TYPE TABLE OF zestoque_02,
      ls_est     LIKE LINE OF lt_est,

      lt_ven     TYPE TABLE OF zvendas_02,
      ls_ven     LIKE LINE OF lt_ven,
      ls_ven2    LIKE LINE OF lt_ven.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
PARAMETERS: p_ven  TYPE zvendas_02-venda,
            p_item TYPE zvendas_02-item,
            p_prod TYPE zvendas_02-produto,
            p_quan TYPE zvendas_02-quantidade,
            p_pre  TYPE zvendas_02-preco,
            p_uni  TYPE zvendas_02-unidade,
            p_moe  TYPE zvendas_02-moeda DEFAULT 'BRL',
            p_dat  TYPE zvendas_02-data DEFAULT sy-datum,
            p_hor  TYPE zvendas_02-hora DEFAULT sy-uzeit.

SELECTION-SCREEN END OF BLOCK a1.


SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002.
PARAMETERS: in  RADIOBUTTON GROUP rb DEFAULT 'X',
            alt RADIOBUTTON GROUP rb,
            del RADIOBUTTON GROUP rb.
SELECTION-SCREEN END OF BLOCK a2.

START-OF-SELECTION.

DATA: p_desc TYPE zprodutos_02-desc_produto.

  CLEAR ls_ven.
  ls_ven-venda = p_ven.
  ls_ven-item = p_item.
  ls_ven-produto = p_prod.
  ls_ven-quantidade = p_quan.
  ls_ven-unidade = p_uni.
  ls_ven-moeda = p_moe.
  ls_ven-data = p_dat.
  ls_ven-hora = p_hor.
  ls_produto-desc_produto = p_desc.

DATA: co_produto TYPE REF TO zcl_produto_02.
CREATE OBJECT co_produto.
      co_produto->set_select_produto(
      EXPORTING
        prod = p_prod
        desc_prod = p_desc
        price = p_pre
      ).

  CASE 'X'.
    WHEN in.

        DATA: ca_venda TYPE REF TO zcl_venda_02.
         CREATE OBJECT ca_venda.
         ca_venda->set_insert_venda(
         EXPORTING
         ven = p_ven
         itm = p_item
         prod = p_prod
         quan = p_quan
         price = p_pre
         uni = p_uni
         coin = p_moe
         date = p_dat
         time = p_hor
         ).

*      UPDATE zestoque_02 FROM ls_est.
      DATA: cl_estoque TYPE REF TO zcl_estoque_02.
      CREATE OBJECT cl_estoque.
      cl_estoque->set_altera_estoque(
      EXPORTING
        prod = p_prod
        uni = p_uni
        quan = p_quan
      ).

       ls_est-quantidade = ls_est-quantidade - p_quan.

    WHEN alt OR del.

      SELECT SINGLE *
        FROM zvendas_02
        INTO ls_ven
        WHERE venda = p_ven
        AND item = p_item.

      IF alt = 'X'."UPDATE
        UPDATE zvendas_02 FROM ls_ven.

      ELSE.

        DELETE zvendas_02 FROM ls_ven."Exclui na tabela de venda

        "Faz a correção do estoque após a exclusão da venda
*        SELECT SINGLE *
*        FROM zestoque_02
*        INTO ls_est
*        WHERE produto = ls_ven2-produto.

      DATA: cp_estoque TYPE REF TO zcl_estoque_02.
      CREATE OBJECT cp_estoque.
      cp_estoque->set_select_estoque(
      EXPORTING
        prod = p_prod
        uni = p_uni
        quan = p_quan
      ).

        IF sy-subrc = 0.
          ls_est-quantidade = ls_est-quantidade + ls_ven2-quantidade.
        ELSE.
          ls_est-mandt = sy-mandt.
          ls_est-produto = ls_ven2-produto.
          ls_est-quantidade = ls_ven2-quantidade.
          ls_est-unidade = ls_ven2-unidade.
        ENDIF.

        MODIFY zestoque_02 FROM ls_est.

      ENDIF.

  ENDCASE.

END-OF-SELECTION.
```
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### TESTE DA CLASSE DE ESTOQUE

```abap
REPORT ZCLASS_ESTOQUE_02.

TABLES: zestoque_02.

DATA: ls_est TYPE zestoque_e_02,
      lt_est TYPE TABLE OF zestoque_e_02.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

PARAMETERS: p_prod TYPE zestoque_02-produto,
            p_uni  TYPE zestoque_02-unidade,
            p_quan TYPE zestoque_02-quantidade.

SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002.
PARAMETERS: in      RADIOBUTTON GROUP rb DEFAULT 'X',
            alt     RADIOBUTTON GROUP rb,
            del     RADIOBUTTON GROUP rb,
            sel     RADIOBUTTON GROUP rb,
            sel_all RADIOBUTTON GROUP rb.
SELECTION-SCREEN END OF BLOCK a2.

CASE 'X'.

  WHEN in.
    DATA: cn_est TYPE REF TO zcl_estoque_02.
    CREATE OBJECT cn_est.
    cn_est->set_insert_estoque(
    EXPORTING
      prod = p_prod
      uni = p_uni
      quan = p_quan
    ).

    WHEN alt.
    DATA: cs_est TYPE REF TO zcl_estoque_02.
    CREATE OBJECT cs_est.
    cs_est->set_altera_estoque(
    EXPORTING
      prod = p_prod
      uni = p_uni
      quan = p_quan
    ).

    WHEN del.
    DATA: co_est TYPE REF TO zcl_estoque_02.
    CREATE OBJECT co_est.
    co_est->set_exclui_estoque(
    EXPORTING
      prod = p_prod
      uni = p_uni
      quan = p_quan
    ).

    WHEN sel.
    DATA: ci_est TYPE REF TO zcl_estoque_02.
    CREATE OBJECT ci_est.
    ci_est->set_select_estoque(
    EXPORTING
      prod = p_prod
    ).

    WHEN sel_all.
    DATA: ck_est TYPE REF TO zcl_estoque_02.
    CREATE OBJECT ck_est.
    ck_est->set_select_all_estoque(
     EXPORTING
      prod = p_prod
      uni = p_uni
      quan = p_quan
    ).

ENDCASE.
```
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### TESTE DA CLASSE DE PRODUTO

```abap
REPORT zclass_produto_02.

TABLES: zprodutos_02.

DATA: ls_produto TYPE zprodutos_e_02,
      lt_prod    TYPE TABLE OF zprodutos_e_02.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

PARAMETERS: p_prod  TYPE zprodutos_02-produto,
            p_desc  TYPE zprodutos_02-desc_produto,
            p_preco TYPE zprodutos_02-preco.

SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002.
PARAMETERS: in      RADIOBUTTON GROUP rb DEFAULT 'X',
            alt     RADIOBUTTON GROUP rb,
            del     RADIOBUTTON GROUP rb,
            sel     RADIOBUTTON GROUP rb,
            sel_all RADIOBUTTON GROUP rb.
SELECTION-SCREEN END OF BLOCK a2.

CASE 'X'.

  WHEN in.
    DATA: cn_prod TYPE REF TO zcl_produto_02.
    CREATE OBJECT cn_prod.
    cn_prod->set_insert_produto(
    EXPORTING
      prod = p_prod
      desc_prod = p_desc
      price = p_preco
    ).

  WHEN alt.
    DATA: cm_prod TYPE REF TO zcl_produto_02.
    CREATE OBJECT cm_prod.
    cm_prod->set_altera_produto(
    EXPORTING
      prod = p_prod
      desc_prod = p_desc
      price = p_preco
    ).


  WHEN del.
    DATA: co_prod TYPE REF TO zcl_produto_02.
    CREATE OBJECT co_prod.
    co_prod->set_exclui_produto(
    EXPORTING
      prod = p_prod
      desc_prod = p_desc
      price = p_preco
    ).


  WHEN sel.
    DATA: cs_prod TYPE REF TO zcl_produto_02.
    CREATE OBJECT cs_prod.
    cs_prod->set_select_produto(
    EXPORTING
      prod = p_prod
    ).

  WHEN sel_all.

    DATA: cl_prod TYPE REF TO zcl_produto_02.
    CREATE OBJECT cl_prod.
    cl_prod->set_select_all_produto(
    EXPORTING
      prod = p_prod
      desc_prod = p_desc
      price = p_preco
    ).

ENDCASE.
```
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### TESTE DA CLASSE DE VENDA

```abap
REPORT zclass_venda_02.

TABLES: zvendas_02.

DATA: ls_ven TYPE zvendas_e_02,
      lt_ven TYPE TABLE OF zvendas_e_02.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

PARAMETERS: p_ven  TYPE zvendas_02-venda,
            p_item TYPE zvendas_02-item,
            p_prod TYPE zvendas_02-produto,
            p_quan TYPE zvendas_02-quantidade,
            p_pre  TYPE zvendas_02-preco,
            p_uni  TYPE zvendas_02-unidade,
            p_moe  TYPE zvendas_02-moeda DEFAULT 'BRL',
            p_data TYPE zvendas_02-data DEFAULT sy-datum,
            p_hora TYPE zvendas_02-hora DEFAULT sy-uzeit.

SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002.

PARAMETERS: in      RADIOBUTTON GROUP rb DEFAULT 'X',
            alt     RADIOBUTTON GROUP rb,
            del     RADIOBUTTON GROUP rb,
            sel     RADIOBUTTON GROUP rb,
            sel_all RADIOBUTTON GROUP rb.

SELECTION-SCREEN END OF BLOCK a2.

CASE 'X'.

  WHEN in.

    DATA: ca_venda TYPE REF TO zcl_venda_02.
    CREATE OBJECT ca_venda.
    ca_venda->set_insert_venda(
    EXPORTING
    ven = p_ven
    itm = p_item
    prod = p_prod
    quan = p_quan
    price = p_pre
    uni = p_uni
    coin = p_moe
    date = p_data
    time = p_hora
    ).

ENDCASE.
```
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
