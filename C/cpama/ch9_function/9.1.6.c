#include <stdio.h>

int digit(int n, int k);

int main(void)
{
    int n, k;

    printf("Enter a number and the number of its digit: ");
    scanf("%d %d", &n, &k);

    printf("result: %d\n", digit(n, k));

    return 0;
}

int digit(int n, int k)
{
    int i;

    for (i = 1; i < k; i++)
        n /= 10;

    return n % 10;
}