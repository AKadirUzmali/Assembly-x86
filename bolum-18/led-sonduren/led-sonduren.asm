; ----------------------------------------------------------------------------------------------------------------
; Kişi      :: Abdulkadir U.
; Tarih     :: 11/01/2026
; Başlık    :: Buton İle Led Söndürme
; Açıklama  :: 8255 kullanılarak basılan butona göre LED söndürmek
; ----------------------------------------------------------------------------------------------------------------
            PAGE 60,80
            TITLE Buton ve LED uygulaması
STACK       SEGMENT PARA STACK 'STACK'
            DW 20 DUP(?)
STACK       ENDS
CODE        SEGMENT PARA 'CODE'
            ASSUME CS:CODE, SS:STACK
START       PROC FAR                    ; Ana yordam
            MOV AL, 81H                 ; PCL giriş
            OUT 66H, AL                 ; PCH çıkış
            MOV AL, 0FFH                ; LED'ler varsayılan olarak yanıyor
            OUT 64H, AL
    ENDLESS:
            IN AL, 64H                  ; PC okunur
            OR AL, 0F0H                 ; PCH maskelenerek 1 yapılır
            CMP AL, 0FFH                ; Butonlar basılı değilken lojik 1 verir
            JZ ENDLESS                  ; Hiçbir butona basılmamış
            MOV CL, 4                   ; Basılan buton karşılığı
            SHL AL, CL                  ; 4 birim sola öteleme ile PCH'ye taşınır
            OUT 64H, AL                 ; LED'lerde basılı buton karşılığı söndürülür
            JMP ENDLESS                 ; Sonsuz döngü
START       ENDP
CODE        ENDS
            END START
