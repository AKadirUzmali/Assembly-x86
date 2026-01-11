; ----------------------------------------------------------------------------------------------------------------
; Kişi      :: Abdulkadir U.
; Tarih     :: 11/01/2026
; Başlık    :: Anotlu Yedi Parçalı Gösterge
; Açıklama  :: 8255 kullanılarak PortB yardımıyla ortak anotlu yedi parçalı göstergede
;           :: sırasıyla 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 şeklinde ondalık basamakları oluşturmak
; ----------------------------------------------------------------------------------------------------------------
            PAGE 60, 80
            TITLE 8255 PortB ortak anotlu yedi parçalı göstergede uygulaması
STACK       SEGMENT PARA STACK 'STACK'
            DW 20 DUP(?)
STACK       ENDS
DATA        SEGMENT PARA 'DATA'
    DIGITS  DB 0C0H, 0F9H, 0A4H, 0B0H, 99H, 92H, 82H, 0F8H, 80H, 90H, 88H
DATA        ENDS
CODE        SEGMENT PARA 'CODE'
            ASSUME CS:CODE, DS:DATA, SS:STACK
START       PROC FAR
; ----------------------------------------------------------------------------------------------------------------
; DATASG ismiyle tanımlı kesim alanına erişebilmek için gerekli tanımlar
; ----------------------------------------------------------------------------------------------------------------
            MOV AX, DATA
            MOV DS, AX
; ----------------------------------------------------------------------------------------------------------------
; 8255 kip 0, tüm portlar çıkış yönlü ayarlanır
; ----------------------------------------------------------------------------------------------------------------
            MOV AL, 80H
            OUT 66H, AL
            CALL CLEAR_DISP
    ENDLESS:
            XOR BX, BX          ; DIGITS dizisinin ilk elemanında itibaren tüm basamaklar için
            MOV CX, 10
    TEKRAR:
            MOV AL, DIGITS[BX]
            OUT 62H, AL         ; PortB'ye basamak gösterge değeri gönderilir
            INC BX              ; Sonraki basamağa geçilir
            CALL DELAY          ; Yakılan değerin görülmesi için bekle
            CALL CLEAR_DISP
            LOOP TEKRAR
            JMP ENDLESS         ; Sonsuz döngü
START       ENDP
; ----------------------------------------------------------------------------------------------------------------
; PortB'ye bağlı göstergeyi temizleyen altyordam
; ----------------------------------------------------------------------------------------------------------------
CLEAR_DISP  PROC NEAR
            PUSH AX
            MOV AL, 0FFH
            OUT 62H, AL
            POP AX
            RET
CLEAR_DISP  ENDP
; ----------------------------------------------------------------------------------------------------------------
; Bekleme sağlayan altyordam
; ----------------------------------------------------------------------------------------------------------------
DELAY       PROC NEAR
            PUSH CX
            MOV CX, 0FFFFH
    LOOP_DELAY:
            LOOP LOOP_DELAY
            POP CX
            RET
DELAY       ENDP
; ----------------------------------------------------------------------------------------------------------------
; CODE segmenti sonu ve programın başlaması
; ----------------------------------------------------------------------------------------------------------------
CODE        ENDS
            END START