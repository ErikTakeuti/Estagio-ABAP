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