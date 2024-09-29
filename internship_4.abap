*&---------------------------------------------------------------------*
*& Report ZSTAJ_TUNAHAN_4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSTAJ_TUNAHAN_4.

INCLUDE ZSTAJ_TUNAHAN_4_top.
INCLUDE ZSTAJ_TUNAHAN_4_f01.

START-OF-SELECTION.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN_4_TOP
*&---------------------------------------------------------------------*

*Variables
DATA : gv_persid TYPE zstaj_tunahan_kisiid_de,
       gv_ad TYPE ZSTAJ_TUNAHAN_ISIM_DE,
       gv_soyad TYPE zstaj_tunahan_soyad_de,
       gv_yas TYPE zstaj_tunahan_yas_de,
       gv_cins TYPE zstaj_tunahan_cinsiyet_de,
       gs_kisi_t TYPE zstaj_tunahn_k_t,
       gt_kisi_t TYPE TABLE OF zstaj_tunahn_k_t.

PARAMETERS : p_id TYPE zstaj_tunahan_kisiid_de,
             p_ad TYPE ZSTAJ_TUNAHAN_ISIM_DE,
             p_soyad TYPE zstaj_tunahan_soyad_de,
             p_yas TYPE zstaj_tunahan_yas_de,
             p_cins TYPE zstaj_tunahan_cinsiyet_de.

* Assign parameters to variables
gv_persid = p_id.
gv_ad = p_ad.
gv_soyad =  p_soyad.
gv_yas = p_yas.
gv_cins = p_cins.

WRITE : / 'Girilen Değerler:', gv_ad, gv_soyad, gv_yas, gv_cins.

* Assign variables to structure fields
gs_kisi_t-persid = gv_persid.
gs_kisi_t-ad = gv_ad.
gs_kisi_t-soyad = gv_soyad.
gs_kisi_t-yas = gv_yas.
gs_kisi_t-cinsiyet = gv_cins.

WRITE : / 'Yapıdaki Değerler:',gs_kisi_t-persid, gs_kisi_t-ad, gs_kisi_t-soyad, gs_kisi_t-yas, gs_kisi_t-cinsiyet.

* Insert the record into the database table
INSERT zstaj_tunahn_k_t FROM gs_kisi_t.

* Check if the insert was successful
IF sy-subrc = 0.
  WRITE : / 'Insert Komutu Başarıyla Çalıştırıldı'.
  COMMIT WORK.
ELSE.
  WRITE : / 'Insert Komutu Başarısız Oldu, sy-subrc:', sy-subrc.
ENDIF.

*&---------------------------------------------------------------------*
*& Include          ZSTAJ_TUNAHAN_4_F01
*&---------------------------------------------------------------------*
