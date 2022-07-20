#include <stdio.h>

int main()
{
    float pints, cups, ounces, tablespoons, teaspoons;

    printf("Enter volume in cups: ");
    scanf("%f", &cups);

    pints = cups / 2;
    ounces = cups * 8;
    tablespoons = ounces * 2;
    teaspoons = tablespoons * 3;

    printf("%.2f cups equal to:\n", cups);
    printf("%.2f pints\n%.2f ounces\n%.2f tablespoons\n%.2f teaspoons\n",
           pints, ounces, tablespoons, teaspoons);

    return 0;
}