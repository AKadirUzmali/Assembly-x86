; ----------------------------------------------------------------------------------------------------------------
; Kişi      :: Abdulkadir U.
; Tarih     :: 11/01/2026
; Başlık    :: Dört Adet Ortak Anotlu Yedi Parçalı Gösterge
; Açıklama  :: 8255 kullanarak PortB ve PortC yardımıyla dört adet ortak anotlu
;           :: yedi parçalı göstergede 1234 saysını süren assembly program
; ----------------------------------------------------------------------------------------------------------------
            PAGE 60, 80
            TITLE Dört adet OA 7 parçalı göstergede 1234 sürme
STACK       SEGMENT PARA STACK 'STACK'
            DW 20 DUP(?)
STACK       ENDS
DATA        SEGMENT PARA 'DATA'
    DIGITS  DB 0C0H, 0F9H, 0A4H, 0B0H, 99H, 92H, 82H, 0F8H, 80H, 90H
    DISPLAY DW 1234H
DATA        ENDS
CODE        SEGMENT PARA 'CODE'
            ASSUME CS:CODE, DS:DATA, SS:STACK
START       PROC FAR
; ----------------------------------------------------------------------------------------------------------------
; DATA ismiyle tanımlı kesim alanına erişebilmek için gerekli tanımlar
; ----------------------------------------------------------------------------------------------------------------
            MOV AX, DATA
            MOV DS, AX
; ----------------------------------------------------------------------------------------------------------------
; 8255 kip 0, PortA, PortB, PortC çıkış
; ----------------------------------------------------------------------------------------------------------------
            MOV AL, 80H
            OUT 66H, AL
            CALL CLEAR_DISP
    ENDLESS:
            MOV AL, 08H             ; OA3'ü için
            MOV DI, DISPLAY
            MOV CX, 4               ; 4 basamak için döngü
    DIGIT_COUNT:
            OUT 64H, AL             ; Sıradaki OA ucu aktif
            MOV SI, DI
            AND SI, 0F8H            ; En düşük anlamlı 4 bit'ini maskele
            PUSH CX
            MOV CX, 4
            SHR DI, CL              ; Sıradaki basamak en düşük anlamlı 4 bit'e
            POP CX
            CALL DISPLAY_DIGIT
            CALL CLEAR_DISP
            SHR AL, 1               ; Sıradaki OA seçimi
            LOOP DIGIT_COUNT
            JMP ENDLESS             ; Sonsuz döngü
START       ENDP
; ----------------------------------------------------------------------------------------------------------------
; PortB'den gösterge değeri sağlayan altyordam
; ----------------------------------------------------------------------------------------------------------------
DISPLAY_DIGIT PROC NEAR
            PUSH AX
            MOV AL, DIGITS[SI]
            OUT 62H, AL
            CALL DELAY
            POP AX
DISPLAY_DIGIT ENDP
; ----------------------------------------------------------------------------------------------------------------
; Bekleme sağlayan altyordam
; ----------------------------------------------------------------------------------------------------------------
DELAY       PROC NEAR
            PUSH CX
            MOV CX, 0FH
    LOOP_DELAY:
            LOOP LOOP_DELAY
            POP CX
            RET
DELAY       ENDP
; ----------------------------------------------------------------------------------------------------------------
; PortB'ye bağlı göstergeleri temizleyen altyordam
; ----------------------------------------------------------------------------------------------------------------
CLEAR_DISP  PROC NEAR
            PUSH AX
            MOV AL, 0FFH
            OUT 62H, AL
            POP AX
            RET
CLEAR_DISP  ENDP
CODE        ENDS
            END START