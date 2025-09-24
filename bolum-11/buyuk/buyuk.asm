; ----------------------------------------------------------------------------------------------------------------
; Kişi      :: Abdulkadir U.
; Tarih     :: 13/08/2025
; Başlık    :: BUYUK
; Açıklama  :: basla.asm isimli program tarafından çağırılan yardımcı yordam
;           :: Kod kesimleri birleştirilmiştir
; ----------------------------------------------------------------------------------------------------------------
            PAGE 60,80
            TITLE Kod kesimleri birleşik yardımcı yordam çağırma
; ----------------------------------------------------------------------------------------------------------------
; ** BUYUK isimli yordam başka programlar tarafından da kullanılabilir
; ** DIZI ise başka bir kesim de word tanımlı harici veridir
; ----------------------------------------------------------------------------------------------------------------
            EXTRN DIZI: WORD
            PUBLIC BUYUK
CDSEG       SEGMENT PARA PUBLIC 'CODE'                          ; Kesim birleştirilecek
            ASSUME CS:CDSEG
; ----------------------------------------------------------------------------------------------------------------
; ** İşlem bloğu başlıyor
; ** CX üzerinden dizinin eleman sayısı bu yordama aktarılıyor
; ----------------------------------------------------------------------------------------------------------------
BUYUK       PROC FAR
            XOR SI, SI                                          ; SI dizi indisi olarak kullanılacak
            MOV AX, DIZI[SI]                                    ; İlk elemanı en büyük kabul et
            SUB CX, 1                                           ; Geri kalan elemanlar üzerinden işlem yapılacak
    L1:     ADD SI, 2                                           ; DW tanımlı bir sonraki eleman 2 byte ileride
            CMP AX, DIZI[SI]
            JA DEVAM
            MOV AX, DIZI[SI]                                    ; Dizinin elemanı daha büyük
    DEVAM:  LOOP L1                                             ; Çevrimi tekrarla
            RET                                                 ; Çağırılan noktaya geri dön
BUYUK       ENDP
CDSEG       ENDS
            END