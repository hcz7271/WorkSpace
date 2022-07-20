#include <stdio.h>
#define initial 5 // initial number of friends
#define Dunbar 150

int main(void)
{
    int weeks = 1, friends = initial;
    while (friends <= Dunbar)
    {
        friends -= weeks;
        friends *= 2;
        printf("Professor Robnud has %d friends in week %d.\n", friends, weeks);
        weeks++;
    }

    return 0;
}