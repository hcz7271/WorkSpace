#include <stdio.h>

int main(void)
{
    int n_space, n_newline, n_char;
    char ch;
    n_space = n_newline = n_char = 0;

    printf("Enter some text, enter # to quit.\n");

    while ((ch = getchar()) != '#')
    {
        if (ch == '\n')
            n_newline++;
        else if (ch == ' ')
            n_space++;
        else
            n_char++;
    }

    printf("number of spaces: %d\n", n_space);
    printf("number of newline characters: %d\n", n_newline);
    printf("number of other characters: %d\n", n_char);

    return 0;
}