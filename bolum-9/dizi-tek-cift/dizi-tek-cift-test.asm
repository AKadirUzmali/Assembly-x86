; ----------------------------------------------------------------------------------------------------------------
; PROGRAM : Dizi Tek Çift
; 10 elemanlı bir dizideki tek ve çift sayıların adedini bulan program
; Bu programda TEST metodu kullanılır
; ----------------------------------------------------------------------------------------------------------------
        PAGE 60, 80
        TITLE Tek Çift / TEST Kullanarak
SSEG    SEGMENT PARA STACK 'STACK'
        DW 12 DUP(0)
SSEG    ENDS
DSEG    SEGMENT PARA 'DATA'
; ----------------------------------------------------------------------------------------------------------------
; Değişken Tanımları
; ----------------------------------------------------------------------------------------------------------------
DIZI    DW 10,21,43,71,199,67,88,234,0,467
ELEMAN  DW 10
TEK_S   DW 0
CIFT_S  DW 0
DSEG    ENDS
CSEG    SEGMENT PARA 'CODE'
TC      PROC FAR
        ASSUME CS:CSEG, SS:SSEG, DS:DSEG
; ----------------------------------------------------------------------------------------------------------------
; Dönüş için gerekli olan değerler yığında saklanıyor
; ----------------------------------------------------------------------------------------------------------------
        PUSH DS
        XOR AX, AX
        PUSH AX
; ----------------------------------------------------------------------------------------------------------------
; DSEG ismiyle tanımlı kesim alanına erişebilmek için gerekli tanımlar
; ----------------------------------------------------------------------------------------------------------------
        MOV AX, DSEG
        MOV DS, AX
; ----------------------------------------------------------------------------------------------------------------
; Kontrol işleminin gerçekleştirildiği kod bloğu
; ----------------------------------------------------------------------------------------------------------------
        MOV CX, ELEMAN                  ; Çevrim değişkenine eleman sayısı konur
        LEA SI, DIZI                    ; DIZI'nin başlangıç adresi SI yazmacında
CEVRIM: TEST WORD PTR [SI], 0001H       ; TEST komutu işlenenlerin değerini bozmaz
        JZ CIFT                         ; Sonuç sıfır ise sayı çifttir ilgili satıra git
TEK:    INC TEK_S                       ; Sayı tektir, tek sayı adedini arttır
CIFT:   ADD SI, 2                       ; DIZI word tanımlı olduğu için bir sonraki dizi elemanı
        LOOP CEVRIM                     ; 2 byte ileride olacak. Döngüyü sayaç yazmacı sıfırlanana kadar
                                        ; devam ettirsin çünkü tur sayısını eleman sayısı kadar yaptık
        MOV AX, ELEMAN                  ; sonuç olarak tek sayı olan eleman sayısını biliyoruz
        SUB AX, TEK_S                   ; eğer eleman sayısından tek sayıyı çıkarırsak çift sayı miktarını
        MOV CIFT_S, AX                  ; bulmuş oluruz ve bunu da AX yazmacına aktarıyoruz
        RET
TC      ENDP
CSEG    ENDS
        END TC                          ; Programın başlangıç noktası