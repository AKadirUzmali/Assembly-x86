; ----------------------------------------------------------------------------------------------------------------
; PROGRAM : Dizi'nin En Büyük Elemanı COM Program
; 10 elemanlı word olarak tanımlanmış bir dizi içindeki en büyük elemanın bulunması
; için COM yapısında bir program
; ----------------------------------------------------------------------------------------------------------------
        PAGE 60, 80
        TITLE En büyük elemanın bulunması
CDSEG   SEGMENT PARA 'CODE'
        ORG 100H                            ; COM program 100H'den başlar
        ASSUME CS:CDSEG, SS:CDSEG, DS:CDSEG
BASLA:  JMP MAXI
; ----------------------------------------------------------------------------------------------------------------
; Eleman sayısı, Dizi elemanları ve Büyük sayı için gerekli değişkenler
; ----------------------------------------------------------------------------------------------------------------
ELEMAN  DW 10
DIZI    DW -4,23,456,4,8,67,-78,9,-99,256
BYKSAY  DW ?
; ----------------------------------------------------------------------------------------------------------------
; İşlemin gerçekleştirildiği yordam
; ----------------------------------------------------------------------------------------------------------------
MAXI    PROC NEAR
        MOV CX, ELEMAN                      ; Eleman sayısı CX'e yerleştirildi
        LEA SI, DIZI                        ; Elemanlara erişmek için SI indis olacak
        DEC CX                              ; Eleman sayısından bir tane eksik işlem yap
        MOV AX, [SI]                        ; İlk sayı büyük kabul edilerek AX'e konuyor
CEVRIM: ADD SI, 2                           ; Bir sonraki indisli elemana erişmek için +2
        CMP AX, [SI]                        ; Sayıları karşılaştırıyoruz
        JG DEVAM                            ; AX büyük, bir sonraki eleman ile karşılaştır
        MOV AX, [SI]                        ; AX küçük, yeni sayıyı AX yazmacına yerleştir
DEVAM:  LOOP CEVRIM                         ; İşlemi CX'de belirlenen sayı kadar tekrarla
        MOV BYKSAY, AX                      ; AX yazmacındaki değeri BYKSAY'a yerleştir
        RET                                 ; Dön
MAXI    ENDP
CDSEG   ENDS
        END BASLA                           ; Programın başlangıç noktası