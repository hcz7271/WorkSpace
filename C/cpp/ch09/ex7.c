#include <stdio.h>
#include <ctype.h>

int letter_location(char);

int main(void)
{
    char ch;
    int location;

    printf("Please enter your character:\n");
    while ((ch = getchar()) != EOF)
    {
        if ((location = letter_location(ch)) == -1)
            printf("%c is not a letter\n", ch);
        else
            printf("%c is a letter: location = %d\n", ch, location);
    }

    return 0;
}

int letter_location(char ch)
{
    int result;

    if (isalpha(ch))
    {
        ch = tolower(ch);
        result = ch - 'a' + 1;
    }
    else
        result = -1;

    return result;
}