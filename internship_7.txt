*& Report ZSTAJ_TUNAHAN_7
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
REPORT zstaj_tunahan_7.

DATA : gv_ad     TYPE zstaj_tunahan_isim_de,
       gv_soyad  TYPE zstaj_tunahan_soyad_de,
       gv_dtarih TYPE datum,
       gv_yas    TYPE zstaj_tunahan_yas_de,
       gv_cins   TYPE zstaj_tunahan_cinsiyet_de.

DATA : gv_rad1 TYPE char1,
       gv_rad2 TYPE xfeld.

DATA : gv_cbox TYPE xfeld.


START-OF-SELECTION.

  CALL SCREEN 0100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'STATUS_0100'.
  SET TITLEBAR 'TITLE_0100'.
ENDMODULE.


*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  DATA: lv_text TYPE string.

  CONCATENATE sy-ucomm
              'butonuna basılmıştır'
              INTO lv_text
              SEPARATED BY space.
  MESSAGE lv_text TYPE 'I'.


  CASE sy-ucomm.
    WHEN '&BACK'.

      MESSAGE gv_ad TYPE 'I'.

      IF gv_rad1 EQ 'X'.
        MESSAGE 'Kadın' TYPE 'I'.
      ELSE.
        MESSAGE 'ERKEK' TYPE 'I'.
      ENDIF.

      IF gv_cbox EQ 'X'.
        MESSAGE 'ONAYLANDI' TYPE 'I'.
      ELSE.
        MESSAGE 'ONAYLANMADI' TYPE 'I'.
      ENDIF.


      LEAVE TO SCREEN 0.
    WHEN '&CANCEL'.
      LEAVE TO SCREEN 0.
    WHEN '&EXIT'.
  ENDCASE.

ENDMODULE.
