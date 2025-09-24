; ----------------------------------------------------------------------------------------------------------------
; Kişi      :: Abdulkadir U.
; Tarih     :: 12.08.2025
; Başlık    :: Include
; Açıklama  :: COM yapısındaki programda macro kullanımı
;           :: Program ekranı temizledikten sonra bir mesaj yazacaktır
;           :: Macrolar harici bir dosyadan alınarak kullanılacaktır
; ----------------------------------------------------------------------------------------------------------------
            PAGE 60,80
            TITLE Ekrana Mesaj Yazma
; ----------------------------------------------------------------------------------------------------------------
; ** Kullanılacak macrolar sil-yazdir.mac isimli dosyadan alinmaktadir
; ----------------------------------------------------------------------------------------------------------------
            INCLUDE sil-yazdir.mac
CDSEG       SEGMENT PARA 'CODE'
            ORG 100H                            ; COM program 100H'den başlar
            ASSUME CS:CDSEG, SS:CDSEG, DS:CDSEG
; ----------------------------------------------------------------------------------------------------------------
; ** Macroları kullanarak işlemi gerçekleştiren yordam
; ----------------------------------------------------------------------------------------------------------------
BASLA       PROC NEAR
            SIL                                 ; SIL isimli macroyu kullan
            YAZDIR MESAJ                        ; YAZDIR makrosunu MESAJ parametresi ile kullan
            RET
BASLA       ENDP
; ----------------------------------------------------------------------------------------------------------------
; ** Mesaj tanımı
; ----------------------------------------------------------------------------------------------------------------
MESAJ       DB 'Macrolar sil-yazdir.mac dosyasindan alindi','$'
CDSEG       ENDS
            END BASLA                           ; Programın başlangıç noktası