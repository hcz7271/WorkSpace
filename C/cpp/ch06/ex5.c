#include <stdio.h>

int main(void)
{
    int row, space;
    char ch, ch1; // use "ch1" to make the value of "ch" unchangeable

    printf("Please enter an uppercase letter:\n");
    scanf("%c", &ch);
    ch1 = ch;

    for (row = 0; row < ch - 'A' + 1; row++)
    {
        for (space = 0; space < ch - 'A' - row; space++)
            printf(" ");

        for (ch = 'A'; ch < 'A' + row + 1; ch++)
            printf("%c", ch);

        for (ch = 'A' + row - 1; ch >= 'A'; ch--)
            printf("%c", ch);

        printf("\n");
        ch = ch1; // set "ch" to its initial value
    }

    return 0;
}