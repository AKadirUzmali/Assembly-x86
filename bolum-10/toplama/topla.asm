; ----------------------------------------------------------------------------------------------------------------
; Kişi      :: Abdulkadir U.
; Tarih     :: 13/08/2025
; Başlık    :: Toplama
; Açıklama  :: Toplama isimli yardımcı yordamın içinde bulunduğu program
; ----------------------------------------------------------------------------------------------------------------
            PAGE 60,80
            TITLE Yardımcı procedure çağırma
            PUBLIC TOPLAMA
CODES       SEGMENT PARA 'CODE'
            ASSUME CS:CODES
TOPLAMA     PROC FAR
; ----------------------------------------------------------------------------------------------------------------
; ** İşlem bloğu başlıyor
; ----------------------------------------------------------------------------------------------------------------
            XOR AX, AX                          ; AX yazmacını sıfırla
            ADD AL, BL                          ; AL üzerinde toplamaya başla
            ADD AL, BH
            ADC AH, 0                           ; CF oluşması durumunda bunu AH'ya aktar
            RET                                 ; Çağırıldığın yere dön
TOPLAMA     ENDP
CODES       ENDS
            END