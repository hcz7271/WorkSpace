#include <stdio.h>

int fact(int);

int main(int argc, char **argv)
{

    int n;

    printf("Enter a number: ");
    scanf("%d", &n);

    printf("fact(n) = %d\n", fact(n));

    return 0;
}

int fact(int n)
{
    int i, result = 1;

    for (i = 2; i <= n; i++)
        result *= i;

    return result;
}