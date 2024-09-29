*&---------------------------------------------------------------------*
*& Report ZSTAJ_TUNAHAN_5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSTAJ_TUNAHAN_5.

INCLUDE ZSTAJ_TUNAHAN5_top.
INCLUDE ZSTAJ_TUNAHAN5_f01.

INITIALIZATION.
""başlangıç

AT SELECTION-SCREEN OUTPUT.
  ""seçim ekranında oluşan bölüm
  "BREAK-POINT.


START-OF-SELECTION.
  ""parametre girildikten sonra
  PERFORM run.



End-of-SELECTION.
   ""en son çalışacak bölüm.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN5_TOP
*&---------------------------------------------------------------------*
PARAMETERS: p_tarih TYPE datum,
            p_ad TYPE zstaj_tunahan_isim_de,
            p_soyad TYPE zstaj_tunahan_soyad_de,
            p_cins TYPE zstaj_tunahan_cinsiyet_de,
            p_yas TYPE zstaj_tunahan_yas_de,
            p_rb1 TYPE xfeld RADIOBUTTON GROUP r1 USER-COMMAND f01,
            p_rb2 TYPE xfeld RADIOBUTTON GROUP r1,
            p_cb1 TYPE xfeld AS CHECKBOX.
            "p_id TYPE zstaj_tunahan_kisiid_de.


*""sistem elementleri
*sy-datum. "tarih
*sy-abcde. "alfabe
*sy-dynnr. "geçerli ekran
*sy-langu. "sistem dil
*sy-uzeit. "sistem saati
*sy-repid. "programın adı
*sy-ucomm. "

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN5_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form run
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM run .
  DATA : ls_data TYPE zstaj_tuna_k_t,
         lt_data TYPE TABLE OF zstaj_tuna_k_t.

  IF p_rb1 EQ 'X'.
    "ls_data-persid   = p_id.
    ls_data-ad       = p_ad.
    ls_data-soyad    = p_soyad.
    ls_data-yas      = p_yas.
    ls_data-cinsiyet = p_cins.

    MODIFY zstaj_tuna_k_t from ls_data.


    ""INSERT ls_data INTO zstaj_tunahn_k_t.
*    UPDATE zstaj_tunahn_k_t set yas = p_yas
*                                WHERE ad = p_ad
*                                AND soyad = p_soyad.
    ""modify- insert into- update


  ELSEIF p_rb2 EQ 'X'.
      SELECT * FROM zstaj_tuna_k_t
        INTO TABLE @lt_data
        WHERE ad     = @p_ad
        and soyad    = @p_soyad
        and yas      = @p_yas
        and cinsiyet = @p_cins.


  ENDIF.

ENDFORM.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN5_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form run
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM run .
  DATA : ls_data TYPE zstaj_tuna_k_t,
         lt_data TYPE TABLE OF zstaj_tuna_k_t.

  IF p_rb1 EQ 'X'.
    "ls_data-persid   = p_id.
    ls_data-ad       = p_ad.
    ls_data-soyad    = p_soyad.
    ls_data-yas      = p_yas.
    ls_data-cinsiyet = p_cins.

    MODIFY zstaj_tuna_k_t from ls_data.


    ""INSERT ls_data INTO zstaj_tunahn_k_t.
*    UPDATE zstaj_tunahn_k_t set yas = p_yas
*                                WHERE ad = p_ad
*                                AND soyad = p_soyad.
    ""modify- insert into- update


  ELSEIF p_rb2 EQ 'X'.
      SELECT * FROM zstaj_tuna_k_t
        INTO TABLE @lt_data
        WHERE ad     = @p_ad
        and soyad    = @p_soyad
        and yas      = @p_yas
        and cinsiyet = @p_cins.


  ENDIF.

ENDFORM.


