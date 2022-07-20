// divisors.c -- nested ifs display divisors of a number
#include <stdio.h>
#include <stdbool.h>
int main(void)
{
    unsigned long limit;
    unsigned long num = 2; // number to be checked
    unsigned long div;     // potential divisors
    bool isPrime;          // prime flag

    printf("Please enter an integer for analysis; ");
    printf("Enter q to quit.\n");
    scanf("%lu", &limit);
    while (num < limit)
    {
        for (div = 2, isPrime = true; (div * div) <= num; div++)
        {
            if (num % div == 0)
            {
                isPrime = false; // number is not prime
            }
        }
        if (isPrime)
            printf("%lu\n", num);
        num++;
    }
    printf("Done.\n");

    return 0;
}
