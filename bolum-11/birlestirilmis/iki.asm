; ----------------------------------------------------------------------------------------------------------------
; Kişi      :: Abdulkadir U.
; Tarih     :: 14/08/2025
; Başlık    :: Birleştirilecek Alan 2
; Açıklama  :: Birinci alan ile birleştirilecek
; ----------------------------------------------------------------------------------------------------------------
            PAGE 60,80
            TITLE Veri kesimleri birleşik 2
; ----------------------------------------------------------------------------------------------------------------
; ** ALTPRG ve I_WORD "bir.asm" tarafından kullanılacaktır
; ** B_WORD, "bir.asm" içinde tanımlıdır
; ----------------------------------------------------------------------------------------------------------------
            PUBLIC ALTPRG, I_WORD
            EXTRN B_WORD:WORD
; ----------------------------------------------------------------------------------------------------------------
; ** Veri kesimi PUBLIC tanımlanmıştır. Ayrıca BYTE tanımı ile
; ** tüm alanın etkin kullanılması amaçlanmıştır
; ----------------------------------------------------------------------------------------------------------------
DTSEG       SEGMENT BYTE PUBLIC 'DATA'
            B_BYTE1 DB ?
            B_BYTE2 DB ?
            I_WORD  DW 01234H
DTSEG       ENDS
CODESG      SEGMENT PARA 'CODE'
            ASSUME CS:CODESG, DS:DTSEG
ALTPRG      PROC FAR
; ----------------------------------------------------------------------------------------------------------------
; ** İşlem bloğu başlıyor
; ----------------------------------------------------------------------------------------------------------------
            MOV AX, B_WORD                          ; "bir.asm" içindeki B_WORD değerini al
            MOV B_BYTE1, AL                         ; Kendi veri kesiminde tanımlı değişkenlere koy
            MOV B_BYTE2, AH
            RET                                     ; Çağıran noktaya geri dön
ALTPRG      ENDP
CODESG      ENDS
            END