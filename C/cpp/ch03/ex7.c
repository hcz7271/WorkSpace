#include <stdio.h>

int main()
{
    float height;

    printf("Enter your height in inches: ");
    scanf("%f", &height);

    printf("Your height is %.2f in cm.\n", height * 2.54);
    return 0;
}