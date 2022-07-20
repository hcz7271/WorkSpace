#include <stdio.h>

void Temperatures(double Fahrenheit);

int main(void)
{
    double ftemp;

    printf("Enter a Fahreheit temperature: ");

    while (scanf("%lf", &ftemp) == 1)
    {
        Temperatures(ftemp);
        printf("You can enter another Fahreheit temperature (or q to quit): ");
    }

    printf("Done!\n");

    return 0;
}

void Temperatures(double Fahrenheit)
{
    const double Celsius = 5.0 / 9.0 * (Fahrenheit - 32.0);
    const double Kelvin = Celsius + 273.16;

    printf("The temperature is %.2lf in Fahrenheit.\n", Fahrenheit);
    printf("The temperature is %.2lf in Celsius.\n", Celsius);
    printf("The temperature is %.2lf in Kelvin.\n", Kelvin);
}