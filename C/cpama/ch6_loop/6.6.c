#include <stdio.h>

int main(void)
{
    int num, i;

    printf("Enter limit on maximum square: ");
    scanf("%d", &num);

    for (i = 2; i * i <= num; i += 2)
    {
        printf("%d\n", i * i);
    }

    return 0;
}