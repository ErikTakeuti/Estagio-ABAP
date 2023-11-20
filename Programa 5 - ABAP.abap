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