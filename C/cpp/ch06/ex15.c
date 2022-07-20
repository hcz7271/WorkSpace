#include <stdio.h>

int main(void)
{
    int i = 0;
    char a[255];

    printf("Please enter a line of input:\n");
    do
    {
        scanf("%c", &a[i]);
        i++;
    } while (a[i - 1] != '\n'); // begin with a[0]

    while (i >= 2) // loop until a[0]
    {
        printf("%c", a[i - 2]); // begin with a[i - 2] so "\n" won't be printed
        i--;
    }
    printf("\n");
    printf("See you next time!\n");

    return 0;
}