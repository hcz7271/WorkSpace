#include <stdio.h>
#include <stdlib.h>

void to_base_n(int int_in_decimal, int base);

int main(void)
{
    int int_in_decimal, base;

    printf("Test to_base_n() function\n");
    printf("Enter an integer in base 10 and a base to convert to: ");

    while (scanf("%d %d", &int_in_decimal, &base) == 2)
    {
        to_base_n(int_in_decimal, base);
        putchar('\n');

        printf("Enter again: ");
    }

    return 0;
}

void to_base_n(int int_in_decimal, int base)
{
    if (base < 2 || base > 10)
    {
        printf("Error: base must be between 2 and 10.\n");
        return;
    }

    // end of recursion
    if (int_in_decimal == 0)
        return;

    if (int_in_decimal < 0)
    {
        putchar('-');
        int_in_decimal = abs(int_in_decimal);
    }

    to_base_n(int_in_decimal / base, base);
    printf("%d", int_in_decimal % base);
    return;
}