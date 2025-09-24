/* ----------------------------------------------------------------------------------------------------------------
* Kişi      :: Abdulkadir U.
* Tarih     :: 23/08/2025
* Başlık    :: C++ ve Asm ile Sıralama
* Açıklama  :: C++ dilinde extern C olarak tanımlanmış olan Asm ile yazılmış sıralama fonksiyonunu kullanmak
---------------------------------------------------------------------------------------------------------------- */

// INCLUDE
#include <stdio.h>

// FUNCTION PROTOTYPE
extern "C" void SelSortASM (int*, int);

// VARIABLE
const int n = 100000;

// MAIN
int main (void)
{
    int dizi[n], i;
    for(i = 0; i < n; i++)
        dizi[i] = i + 1;
    
    SelSortASM(dizi, n);
    printf("Dizinin ilk elemani: %d, son elemani: %d\n", dizi[0], dizi[n-1]);
    return 0;
}