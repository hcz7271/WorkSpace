#include <stdio.h>
#define rate 0.08       // interest rate
#define initial 1000000 // initial funds
#define withdraw 100000 // money withdrew every year

int main(void)
{
    int years = 0;
    float money = initial;

    while (money > 0)
    {
        money += money * rate;
        money -= withdraw;
        years++;
    }

    printf("It takes %d years for Chuckie to empty his account.\n", years);

    return 0;
}