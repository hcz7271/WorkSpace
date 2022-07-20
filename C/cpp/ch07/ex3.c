#include <stdio.h>
#include <ctype.h>

int main(void)
{
    int i;
    int num_even = 0, num_odd = 0;
    double avg_even, avg_odd, sum_even = 0, sum_odd = 0;

    printf("Enter numbers or 0 to quit: \n");
    while (scanf("%d", &i) == 1 && i != 0)
    {
        if (i % 2 == 0)
        {
            num_even++;
            sum_even += i;
        }
        else
        {
            num_odd++;
            sum_odd += i;
        }
    }

    avg_odd = sum_odd / num_odd;
    avg_even = sum_even / num_even;

    printf("average of evens: %f\n", avg_even);
    printf("sum of evens: %f\n", sum_even);
    printf("average of odds: %f\n", avg_odd);
    printf("sum of odds: %f\n", sum_odd);

    return 0;
}