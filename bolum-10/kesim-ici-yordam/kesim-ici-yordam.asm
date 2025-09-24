; ----------------------------------------------------------------------------------------------------------------
; : Slavnem - 09/08/2025
; : Kesim İçi Yordam
; :: Kesim içindeki yordamı çağıran EXE tipinde program
; ----------------------------------------------------------------------------------------------------------------
        PAGE 60,80
        TITLE Sayinin kuvvetini hesaplar
STACKSG SEGMENT PARA STACK 'STACK'
        DW 10 DUP(?)
STACKSG ENDS
DATASG  SEGMENT PARA 'DATA'
; ----------------------------------------------------------------------------------------------------------------
; => Kullanacağımız değişkenler
; ----------------------------------------------------------------------------------------------------------------
SAYI    DW 2
UST     DW 10
SONUC   DW 0
DATASG  ENDS
CODESG  SEGMENT PARA 'CODE'
        ASSUME CS:CODESG, SS:STACKSG, DS:DATASG
; ----------------------------------------------------------------------------------------------------------------
; => Dönüş için gerekli olan değerler yığında saklanıyor
; ----------------------------------------------------------------------------------------------------------------
ANA     PROC FAR
        PUSH DS
        SUB AX, AX
        PUSH AX
; ----------------------------------------------------------------------------------------------------------------
; => DATASG ismiyle tanımlı kesim alanına erişebilmek için gerekli tanımlar
; ----------------------------------------------------------------------------------------------------------------
        MOV AX, DATASG
        MOV DS, AX
; ----------------------------------------------------------------------------------------------------------------
; => İşlemin gerçekleştirildiği kod bloğu
; ----------------------------------------------------------------------------------------------------------------
        MOV CX, UST                         ; UST ve SAYI parametreleri yazmaçlarda
        MOV BX, SAYI                        ; BX yazmacına sayıyı aktar
        CALL USTAL                          ; Yordam çağırma
        MOV SONUC, AX                       ; İşlemin sonucu AX yazmacı üzerinden aktarılıyor
        RET                                 ; Dön
ANA     ENDP
; ----------------------------------------------------------------------------------------------------------------
; => Üst alma işlemini gerçekleştiren yordam
; ----------------------------------------------------------------------------------------------------------------
USTAL   PROC NEAR
        MOV AX, 1                           ; AX (akümülator) yazmacına çarpma için 1 değerini aktarmak
L1:     MUL BX                              ; Çarpma işlemi AX üzerinden yapılıyor
        LOOP L1                             ; CX yazmacı tur sayısı bitene kadar tekrarla
        RET                                 ; Dön
USTAL   ENDP
CODESG  ENDS
        END     ANA                         ; Programın başlangıç noktası