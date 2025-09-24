; ----------------------------------------------------------------------------------------------------------------
; PROGRAM : Ekrana Mesaj Yazdır
; INT 21H - fonksiyon 9H ile ekrana mesaj yazmayı sağlayan
; COM yapısında bir program
; ----------------------------------------------------------------------------------------------------------------
        PAGE 60, 80
        TITLE Ekrana mesaj yazmacı
CDSEG   SEGMENT PARA 'CODE'
        ORG 100H                        ; COM program 100H'den başlar
        ASSUME CS:CDSEG, SS:CDSEG, DS:CDSEG
; ----------------------------------------------------------------------------------------------------------------
; İşlemin gerçekleştirildiği yordam
; ----------------------------------------------------------------------------------------------------------------
YAZDIR  PROC NEAR
        LEA DX, MESAJ                   ; DX yazdırılacak mesajın başını göstermeli
        MOV AH, 09H                     ; AH, fonksiyon numarasını çağırır
        INT 21H                         ; 21H numaralı kesmeyi çağır
        RET                             ; Dön
YAZDIR  ENDP
; ----------------------------------------------------------------------------------------------------------------
; Değişkenleri tanımladığımız alan
; ----------------------------------------------------------------------------------------------------------------
MESAJ   DB 'COM yapisinda bir program calisti','$'
CDSEG   ENDS
        END YAZDIR                      ; Programın başlangıç noktası