/* ----------------------------------------------------------------------------------------------------------------
* Kişi      :: Abdulkadir U.
* Tarih     :: 23/08/2025
* Başlık    :: C ve Asm ile Toplama
* Açıklama  :: C dilinde extern olarak tanımlanmış topla fonksiyonunu asm ile yazıp c dili ile birleştirmek
---------------------------------------------------------------------------------------------------------------- */

// INCLUDE
#include <stdio.h>

// FUNCTION PROTOTYPE
extern int Topla(int*, int);

// MAIN
int main (void)
{
    int i, top, n;

    printf("Kaca kadar sayilari toplamak istiyorsunuz: ");
    scanf("%d", &n);

    int dizi[n];
    for(i = 0; i < n; i++)
        dizi[i] = i + 1;
    
    top = Topla(dizi, n);
    printf("Toplam: %d\n", top);

    return 0;
}