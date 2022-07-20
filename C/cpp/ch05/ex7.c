#include <stdio.h>

void cube(double num);

int main(void)
{
    double n;
    printf("Enter a double type number: ");

    scanf("%lf", &n);
    cube(n);

    return 0;
}

void cube(double num)
{
    printf("The value is %lf.\n", num * num * num);
}