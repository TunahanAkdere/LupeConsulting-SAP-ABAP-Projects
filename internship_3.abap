*&---------------------------------------------------------------------*
*& Report ZSTAJ_TUNAHAN_3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSTAJ_TUNAHAN_3.

INCLUDE ZSTAJ_TUNAHAN_3_top.
INCLUDE ZSTAJ_TUNAHAN_3_f01.

START-OF-SELECTION.


PERFORM get_hesap_makinesi.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN_3_TOP
*&---------------------------------------------------------------------*
DATA : gv_sonuc TYPE p DECIMALS 2.
DATA : gv_n1 TYPE p DECIMALS 2.
DATA : gv_n2 TYPE p DECIMALS 2.

PARAMETERS : p_num1 TYPE p DECIMALS 2,
             p_num2 TYPE p DECIMALS 2,
             p_islem TYPE char1.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN_3_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Form get_hesap_makinesi
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_hesap_makinesi .

  DATA : lv_int1 TYPE p DECIMALS 2,
         lv_int2 TYPE p DECIMALS 2,
         lv_sonuc TYPE p DECIMALS 2,
         lv_hata TYPE char40.

  lv_int1 = p_num1.
  lv_int2 = p_num2.

  CALL FUNCTION 'ZSTAJ_TUNAHAN_FM_01'
    EXPORTING
      iv_num1        = lv_int1
      iv_num2        = lv_int2
      iv_islem       = p_islem
   IMPORTING
     EV_SONUC       = lv_sonuc
     EV_HATA        = lv_hata.


IF lv_hata EQ ''.
  WRITE : / 'Sonuç :' , lv_sonuc.
ELSE.
  WRITE : / lv_hata.
ENDIF.




ENDFORM.
