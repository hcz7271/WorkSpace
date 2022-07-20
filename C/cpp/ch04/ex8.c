#include <stdio.h>

int main(void)
{
    float miles, gallons, kilometers, liters, miles_per_gallon, liters_per_100km;
    const float liters_per_gallon = 3.785;
    const float kilometers_per_mile = 1.609;

    printf("Please enter the number of miles traveled:\n");
    scanf("%f", &miles);
    printf("Please enter the number of gallons of gasoline consumed:\n");
    scanf("%f", &gallons);

    liters = liters_per_gallon * gallons;
    kilometers = kilometers_per_mile * miles;

    miles_per_gallon = miles / gallons;
    liters_per_100km = 100 * (liters / kilometers);

    printf("The value of miles_per_gallon is %.1f.\n", miles_per_gallon);
    printf("The value of liters_per_100km is %.1f.\n", liters_per_100km);

    return 0;
}