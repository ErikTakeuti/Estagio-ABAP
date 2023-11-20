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