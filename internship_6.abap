*&---------------------------------------------------------------------*
*& Report ZSTAJ_TUNAHAN_6
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zstaj_tunahan_6.

INCLUDE zstaj_tunahan_6_top.
INCLUDE zstaj_tunahan_6_f01.


START-OF-SELECTION.

  CASE 'X'.
    WHEN p_rb1. ""Kayıt at.
      PERFORM kayit_at.
    WHEN p_rb2. ""Kayıt getir.
      PERFORM kayit_getir.
  ENDCASE.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN_6_TOP
*&---------------------------------------------------------------------*
TABLES: zstaj_tuna_k_t.
DATA  : gt_output TYPE TABLE OF zstaj_tuna_k_t.


*SELECTION-SCREEN BEGIN OF BLOCK block2 WITH FRAME TITLE TEXT-002.

*  SELECT-OPTIONS : so_ad FOR zstaj_tuna_k_t-ad.



*SELECTION-SCREEN END OF BLOCK block2.

SELECTION-SCREEN BEGIN OF BLOCK block WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS : so_ad FOR zstaj_tuna_k_t-ad.

  PARAMETERS : p_rb1   TYPE xfeld RADIOBUTTON GROUP rb1 USER-COMMAND usr01,
               p_rb2   TYPE xfeld RADIOBUTTON GROUP rb1,
               p_ad    TYPE zstaj_tunahan_isim_de,
               p_soyad TYPE zstaj_tunahan_soyad_de,
               p_yas   TYPE zstaj_tunahan_yas_de,
               p_cins  TYPE zstaj_tunahan_cinsiyet_de,
               p_tarih TYPE datum.

SELECTION-SCREEN END OF BLOCK block.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN_6_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form kayit_at
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM kayit_at .

  DATA: ls_row TYPE zstaj_tuna_k_t.


  ls_row-ad       = p_ad.
  ls_row-soyad    = p_soyad.
  ls_row-cinsiyet = p_cins.
  ls_row-yas      = p_yas.
  ls_row-dtarih   = p_tarih.


  MODIFY zstaj_tuna_k_t FROM ls_row.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form kayit_getir
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM kayit_getir.

  DATA: lt_fcat   TYPE slis_t_fieldcat_alv,
        ls_fcat   TYPE slis_fieldcat_alv,
        lt_output TYPE TABLE OF zstaj_tuna_k_t,
        ls_layout TYPE slis_layout_alv.

  SELECT * FROM zstaj_tuna_k_t
    INTO TABLE lt_output
    WHERE ad = p_ad
       OR ad IN so_ad.

  IF lt_output[] IS NOT INITIAL.

    CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
      EXPORTING
        i_program_name         = sy-repid
        i_structure_name       = 'ZSTAJ_TUNA_K_T'
      CHANGING
        ct_fieldcat            = lt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.


    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program = sy-repid
        it_fieldcat        = lt_fcat
      TABLES
        t_outtab           = lt_output
      EXCEPTIONS
        program_error      = 1
        OTHERS             = 2.
  ELSE.
    WRITE: 'Belirtilen Kriterlere Göre Veri Bulunamadı.'.
  ENDIF.

ENDFORM.


*  ls_fcat-fieldname = 'AD'.
*  ls_fcat-seltext_m = 'Ad'.
*  APPEND ls_fcat TO lt_fcat.
*
*
*  ls_fcat-fieldname = 'SOYAD'.
*  ls_fcat-seltext_m = 'Soyad'.
*  APPEND ls_fcat TO lt_fcat.
*
*
*  ls_fcat-fieldname = 'CINSIYET'.
*  ls_fcat-seltext_m = 'Cinsiyet'.
*  APPEND ls_fcat TO lt_fcat.
*
*
*  ls_fcat-fieldname = 'YAS'.
*  ls_fcat-seltext_m = 'Yaş'.
*  APPEND ls_fcat TO lt_fcat.
*
