; ----------------------------------------------------------------------------------------------------------------
; Kişi      :: Abdulkadir U.
; Tarih     :: 23/08/2025
; Başlık    :: Asm ile Dizi Toplama
; Açıklama  :: C ile yazılmış kod da bulunan dizi toplama fonksiyonunu Asm ile yazmak
; ----------------------------------------------------------------------------------------------------------------
section .data
section .text
global Topla
Topla:
    push ebp
    push edi
    push ecx
    mov ebp, esp
    mov edi, [ebp+16]           ; Dizi adresine erişilir
    mov ecx, [ebp+20]           ; Dizi boyutu olan n değerine erişilir
    xor eax, eax
  L1:
    add eax, [edi]
    add edi, 4                  ; Dizi integer (4 byte) tanımlı olduğu için
    loop L1                     ; bir sonraki elemana erişim için 4 eklenir
    pop ecx
    pop edi
    pop ebp
    ret