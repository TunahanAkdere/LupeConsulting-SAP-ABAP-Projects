*&---------------------------------------------------------------------*
*& Report ZSTAJ_TUNAHAN_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSTAJ_TUNAHAN_2.

INCLUDE zstaj_tunahan_2_top. ""tanımlamalar
INCLUDE zstaj_tunahan_2_f01. ""işlemler

"write ile yazarken nasıl hücre renklendirme yaparız arka planı renklendiririz
"iki değişkeni nasıl birleştiririz

*write : p_name
START-OF-SELECTION.
PERFORM bilgiAl.

*Color 1 mavi
*Color 2 gri
*Color 3 sarı
*Color 4 koyuMavi
*Color 5 yeşil
*Color 6 kırmızı
*Color 7 turuncu

"Renk Seçimi

WRITE :
        /,
        /20 sy-uline(227),
        /20 sy-vline,
        130 'Personel Masraf Raporu',
        246 sy-vline,
        /20 sy-uline(227),
        /20 sy-vline , 25 'Adı' COLOR 1,
        50 sy-vline, 55 'Soyadı' COLOR 5, 80 sy-vline, 85 'Email' COLOR 1, 130 sy-vline,
        135 'Telefon operatörü' COLOR 5, 170 sy-vline, 173 'Telefon' COLOR 1, 210 sy-vline, 215 'Alınan Avans' COLOR 5, 246 sy-vline,
        /20 sy-uline(227),

        /20 sy-vline, 25 gv_name, 50 sy-vline, 55 gv_surname , 80 sy-vline, 85 gv_email, 130 sy-vline,
        135 gv_operator, 170 sy-vline, 173 gv_stringPhone, 210 sy-vline, 215 gv_avansT, 235 'TL', 246 sy-vline,
        /20 sy-uline(227),

        /,
        /20 sy-uline(227),
        /20 sy-vline,
        130 'Gider Detayı',
        246 sy-vline,
        /20 sy-uline(227),
        /20 sy-vline, 25 'Yemek Gideri         :', 50 sy-vline, 55 gv_yemekT, 75 'TL',
        170 'Toplam Gider :', 185 sy-vline, 215 gv_toplamGider,235 'TL', 246 sy-vline,
        /20 sy-uline(227),
        /20 sy-vline, 25 'Yol Gideri           :', 50 sy-vline, 55 gv_yolT, 75 'TL',
        170 'Kalan Avans  :', 185 sy-vline, 215 gv_kalanAvans,235 'TL', 246 sy-vline,
        /20 sy-uline(227).


        IF gv_avansBackground = 5.
           WRITE: /20 sy-vline, 25 'Konaklama Gideri     :', 50 sy-vline, 55 gv_konakT, 75 'TL',
           170 'AHY          :', 185 sy-vline, 214 '%' COLOR 5, 215 gv_kalanAvansYuzde COLOR 5, 235 'TL', 246 sy-vline,
           /20 sy-uline(227).
        ELSEIF gv_avansBackground = 3.
           WRITE: /20 sy-vline, 25 'Konaklama Gideri     :', 50 sy-vline, 55 gv_konakT,75 'TL',
           170 'AHY          :', 185 sy-vline, 214 '%' COLOR 3, 215  gv_kalanAvansYuzde COLOR 3,235 'TL', 246 sy-vline,
           /20 sy-uline(227).
        ELSEIF gv_avansBackground = 6.
           WRITE: /20 sy-vline, 25 'Konaklama Gideri     :', 50 sy-vline, 55 gv_konakT, 75 'TL',
           170 'AHY          :', 185 sy-vline, 214 '%' COLOR 6, 215  gv_kalanAvansYuzde COLOR 6, 235 'TL', 246 sy-vline,
           /20 sy-uline(227).
        ELSE.
           WRITE: /20 sy-vline, 25 'Konaklama Gideri     :', 50 sy-vline, 55 gv_konakT, 75 'TL',
           170 'AHY          :', 185 sy-vline, 200 '%', 210  'Giriş Yapılmadı  ', 235 'TL', 246 sy-vline,
           /20 sy-uline(227).
        ENDIF.
