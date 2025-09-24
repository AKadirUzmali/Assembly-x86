; ----------------------------------------------------------------------------------------------------------------
; Kişi      :: Abdulkadir U.
; Tarih     :: 13/08/2025
; Başlık    :: Basla
; Açıklama  :: Kullanılacak harici bir yordam ile dizi içindeki en büyük elemanı bulmak
;           :: Kod kesimleri birleştirilir
; ----------------------------------------------------------------------------------------------------------------
            PAGE 60,80
            TITLE Kod kesimleri birleşik yardımcı yordam çağırma
; ----------------------------------------------------------------------------------------------------------------
; ** BUYUK harici bir yordamdır. FAR olarak tanımlanmıştır.
; ** DIZI ise başka bir program tarafından kullanılacaktır
; ----------------------------------------------------------------------------------------------------------------
            EXTRN BUYUK:FAR
            PUBLIC DIZI
STSEG       SEGMENT PARA STACK 'STACK'
            DW 12 DUP(0)
STSEG       ENDS
; ----------------------------------------------------------------------------------------------------------------
; ** Kullanılacak değişkenler tanımlanır
; ----------------------------------------------------------------------------------------------------------------
DTSEG       SEGMENT PARA 'DATA'
            DIZI   DW 12,1,5,64,21,65,127,512,0,1024
            ELEMAN DW 10
            BYK_EL DW ?
DTSEG       ENDS
CDSEG       SEGMENT PARA PUBLIC 'CODE'                      ; Kesim birleştirilecek
            ASSUME CS:CDSEG, SS:STSEG, DS:DTSEG
; ----------------------------------------------------------------------------------------------------------------
; ** Dönüş için gerekli olan değerler yığında saklanıyor
; ----------------------------------------------------------------------------------------------------------------
BASLA       PROC FAR
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
            MOV CX, ELEMAN                              ; Eleman sayısını CX ile BUYUK isimli yordama aktar
            CALL BUYUK                                  ; BUYUK isimli yordam çağırılır
            MOV BYK_EL, AX                              ; En büyük değer AX yazmacı üzerinden geri döner
            RET
BASLA       ENDP
CDSEG       ENDS
            END BASLA                                   ; Programın başlangıç noktası