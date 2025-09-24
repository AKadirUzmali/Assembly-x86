; ----------------------------------------------------------------------------------------------------------------
; Kişi      :: Abdulkadir U.
; Tarih     :: 14/08/2025
; Başlık    :: Birleştirilecek Alan 1
; Açıklama  :: İkinci alan ile birleştirilecek
; ----------------------------------------------------------------------------------------------------------------
            PAGE 60,80
            TITLE Veri kesimleri birleşik 1
; ----------------------------------------------------------------------------------------------------------------
; ** ALTPRG ve I_WORD "iki.asm" içinde tanımlıdır
; ** B_WORD ise "iki.asm" içindeki ALTPRG isimli yordama erişecektir
; ----------------------------------------------------------------------------------------------------------------
            EXTRN ALTPRG:FAR, I_WORD:WORD
            PUBLIC B_WORD
STSEG       SEGMENT PARA STACK 'STACK'
            DW 12 DUP(0)
STSEG       ENDS
; ----------------------------------------------------------------------------------------------------------------
; ** Veri kesimi PUBLIC tanımlanmıştır. Ayrıca BYTE tanımı ile
; ** tüm alanın etkin kullanılması amaçlanmıştır
; ----------------------------------------------------------------------------------------------------------------
DTSEG       SEGMENT BYTE PUBLIC 'DATA'
            I_BYTE1 DB ?
            I_BYTE2 DB ?
            B_WORD  DW 0ABCDH
DTSEG       ENDS
CDSEG       SEGMENT PARA 'CODE'
            ASSUME CS:CDSEG, SS:STSEG, DS:DTSEG
BASLA       PROC FAR
; ----------------------------------------------------------------------------------------------------------------
; ** Dönüş için gerekli olan değerler yığında saklanıyor
; ----------------------------------------------------------------------------------------------------------------
            PUSH DS
            XOR AX, AX
            PUSH AX
; ----------------------------------------------------------------------------------------------------------------
; ** DTSEG ismiyle tanımlı veri kesimine erişebilmek için gerekli tanımlar
; ----------------------------------------------------------------------------------------------------------------
            MOV AX, DTSEG
            MOV DS, AX
; ----------------------------------------------------------------------------------------------------------------
; ** İşlem bloğu başlıyor
; ----------------------------------------------------------------------------------------------------------------
            MOV AX, I_WORD                          ; "iki.asm" içindeki değeri al
            MOV I_BYTE1, AL                         ; Parçalayarak kendi içinde tanımlı değişkenlere yerleştir
            MOV I_BYTE2, AH
            CALL ALTPRG                             ; Harici yordamı çağır
            RET                                     ; DOS'a dön
BASLA       ENDP
CDSEG       ENDS
            END BASLA                               ; Programın başlangıç noktası