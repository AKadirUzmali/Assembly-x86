; ----------------------------------------------------------------------------------------------------------------
; Kişi      :: Abdulkadir U.
; Tarih     :: 13/08/2025
; Başlık    :: Basla
; Açıklama  :: Toplama isimli yardımcı yordamın çağırılması
; ----------------------------------------------------------------------------------------------------------------
            PAGE 60,80
            TITLE Yardımcı yordam çağırma
            EXTRN TOPLAMA:FAR
STSEG       SEGMENT PARA STACK 'STACK'
            DW 12 DUP(0)
STSEG       ENDS
; ----------------------------------------------------------------------------------------------------------------
; ** Kullanılacak değişkenler tanımlanır
; ----------------------------------------------------------------------------------------------------------------
DTSEG       SEGMENT PARA 'DATA'
            SAYI1 DB 12H
            SAYI2 DB 78H
            SONUC DW 0H
DTSEG       ENDS
CDSEG       SEGMENT PARA 'CODE'
            ASSUME CS:CDSEG, SS:STSEG, DS:DTSEG
BASLA PROC FAR
; ----------------------------------------------------------------------------------------------------------------
; ** Dönüş için gerekli olan değerler yığında saklanıyor
; ----------------------------------------------------------------------------------------------------------------
            PUSH DS
            XOR AX, AX
            PUSH AX
; ----------------------------------------------------------------------------------------------------------------
; ** DTSEG ismiyle tanımlı kesim alanına erişebilmek için gerekli tanımlar
; ----------------------------------------------------------------------------------------------------------------
            MOV AX, DTSEG
            MOV DS, AX
; ----------------------------------------------------------------------------------------------------------------
; ** İşlem bloğu başlıyor
; ----------------------------------------------------------------------------------------------------------------
            MOV BH, SAYI1                           ; Değerler BH ve BL yazmaçları üzerinden
            MOV BL, SAYI2                           ; Çağırılacak olan yardımcı yordama aktarılır
            CALL TOPLAMA                            ; Yordam çağırılır
            MOV SONUC, AX                           ; Toplama işleminin sonucu AX yazmacında
            RET
BASLA       ENDP
CDSEG       ENDS
            END BASLA                               ; Programın başlangıç noktası