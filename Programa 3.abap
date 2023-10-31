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