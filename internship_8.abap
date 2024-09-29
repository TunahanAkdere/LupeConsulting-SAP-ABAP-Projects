*&---------------------------------------------------------------------*
*& Report ZSTAJ_TUNAHAN_CALISMA_8
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zstaj_tunahan_calisma_8.


INCLUDE ZSTAJ_TUNAHAN_CALISMA_8_top.
INCLUDE ZSTAJ_TUNAHAN_CALISMA_8_f01.
INCLUDE ZSTAJ_TUNAHAN_CALISMA_8_pbo.
INCLUDE ZSTAJ_TUNAHAN_CALISMA_8_pai.

START-OF-SELECTION.
  CALL SCREEN 0100.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN_CALISMA_8_TOP
*&---------------------------------------------------------------------*


DATA : gv_number1 TYPE p DECIMALS 2,
       gv_number2 TYPE p DECIMALS 2,
       gv_sonuc   TYPE p DECIMALS 2,
       gv_islem type char1.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN_CALISMA_8_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form hesapla
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM hesapla USING p_islem TYPE char1.

*  gv_sonuc = gv_number1 + gv_number2.

  CASE p_islem.
    WHEN '+'.
      gv_sonuc = gv_number1 + gv_number2.
    WHEN '-'.
      gv_sonuc = gv_number1 - gv_number2.
    WHEN 'X'.
      gv_sonuc = gv_number1 * gv_number2.
    WHEN '/'.
*      IF gv_number2 IS NOT INITIAL.
*        gv_sonuc = gv_number1 / gv_number2.
*      ENDIF.
      TRY.
          gv_sonuc = gv_number1 / gv_number2.
        CATCH cx_sy_zerodivide.
          CLEAR gv_sonuc.
          MESSAGE '0a Bölemezsiniz.' Type 'I' DISPLAY LIKE 'E'.
      ENDTRY.
  ENDCASE.

  gv_islem = p_islem.

ENDFORM.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN_CALISMA_8_PBO
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.

 SET PF-STATUS 'STAT0100'.
 SET TITLEBAR 'TITLE0100'.


ENDMODULE.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN_CALISMA_8_PAI
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE sy-ucomm.
    WHEN '&BACK'.
      LEAVE TO SCREEN 0.
    WHEN '&BACK2'.
      LEAVE TO SCREEN 0.
    WHEN '&EXIT'.
      LEAVE PROGRAM.
    WHEN '&HESAP'.
*      PERFORM hesapla.
    WHEN '&TOP'.
      PERFORM hesapla using '+'.
    WHEN '&EKS'.
      PERFORM hesapla USING '-'.
    WHEN '&CARP'.
      PERFORM hesapla USING 'X'.
    WHEN '&BOL'.
      PERFORM hesapla USING '/'.
  ENDCASE.

ENDMODULE.


