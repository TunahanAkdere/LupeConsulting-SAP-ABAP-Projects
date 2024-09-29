*&---------------------------------------------------------------------*
*& Report ZSTAJ_TUNAHAN_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSTAJ_TUNAHAN_1.

WRITE  'Hello World'.

WRITE 'Hello World'.
WRITE 'Hello World'.
WRITE 'Hello World'.

WRITE : /20 'Hello World',
        /30 'Hello World',
        /40 'Hello World'.


"WRITE : sy-uline. "_"
"WRITE : sy-vline. "|"



"WRITE : /30 sy-uline(40),
"        'Tunahan'.


WRITE :/,/,/,/,/,/,
        /,
        /20 sy-uline(130),
        /20 sy-vline,
        72 'Personel Bilgi Formu',
        149 sy-vline,
        /20 sy-uline(130).


WRITE : /20 sy-vline, 25 'Ad', 50 sy-vline, 55 'Soyad', 70 sy-vline, 75 'Telefon', 105 sy-vline, 110 'E-Mail', 149 sy-vline,
        /20 sy-uline(130),
        /20 sy-vline, 25 'Tunahan', 50 sy-vline, 55 'AKDERE', 70 sy-vline, 75 '+90 538 890 40 18', 105 sy-vline, 110 'tunahanakderem@gmail.com', 149 sy-vline,
        "/20 sy-uline(130),  boşluk bırakır alt satıra
        /20 sy-uline(130),
        /20 sy-vline, 25 'Tunahan', 50 sy-vline, 55 'AKDERE', 70 sy-vline, 75 '+90 538 890 40 18', 105 sy-vline, 110 'tunahanakderem@gmail.com', 149 sy-vline.
        "/20 sy-uline(130)."boşluk bırakır alt satıra

WRITE:
        /20 sy-uline(130),
        /20 sy-vline, 25 'Görkem Melih', 50 sy-vline, 55 'CİN', 70 sy-vline,  75 '+90 123 456 78 90', 105 sy-vline, 110 'gmelihcin@gmail.com', 149 sy-vline.

WRITE:
        /20 sy-uline(130),
        /20 sy-vline, 25 'Görkem Melih', 50 sy-vline, 55 'CİN', 70 sy-vline,  75 '+90 123 456 78 90', 105 sy-vline, 110 'gmelihcin@gmail.com', 149 sy-vline.

WRITE:
        /20 sy-uline(130),
        /20 sy-vline, 25 'Görkem Melih', 50 sy-vline, 55 'CİN', 70 sy-vline,  75 '+90 123 456 78 90', 105 sy-vline, 110 'gmelihcin@gmail.com', 149 sy-vline.
**        /20 sy-uline(130).

WRITE: /20 sy-uline(130),
       /20 sy-vline, 25 '', 50 sy-vline, 55 '', 70 sy-vline, 75 '', 105 sy-vline, 110 '', 149 sy-vline,
       /20 sy-uline(130).
