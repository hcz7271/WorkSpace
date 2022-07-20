#include <stdio.h>
#include <ctype.h>
#include <string.h>
#define ppl 8 // pairs per line

int main(void)
{
    char ch;
    char ch_input[100];
    int count = 0;

    printf("Please enter your characters:\n");
    while ((ch = getchar()) != '#')
    {
        if (isdigit(ch))
            continue;
        else
        {
            ch_input[count] = ch;
            count++;
        }
    }

    ch_input[count] = '\0';

    for (count = 0; count < strlen(ch_input); count++)
    {
        if (count % ppl == 0)
            printf("\n");

        printf("%3c:%-3d",
               (ch_input[count] == '\n') ? ' ' : ch_input[count], ch_input[count]);
    }

    return 0;
}