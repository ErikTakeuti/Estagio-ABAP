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