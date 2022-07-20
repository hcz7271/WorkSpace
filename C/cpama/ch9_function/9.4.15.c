#include <stdio.h>

double median(double, double, double);

int main(void)
{
    double a[3];

    printf("Enter 3 numbers: ");
    for (int i = 0; i < 3; i++)
    {
        scanf("%lf", &a[i]);
    }

    printf("median number is : %.2lf", median(a[0], a[1], a[2]));

    return 0;
}

double median(double x, double y, double z)
{
    double result;

    if (x <= y)
    {
        if (y <= z)
        {
            result = y;
        }
        else if (x <= z)
        {
            result = z;
        }
        else
        {
            result = x;
        }
    }
    else
    {
        if (z <= y)
        {
            result = y;
        }
        else if (x <= z)
        {
            result = x;
        }
        else
        {
            result = z;
        }
    }

    return result;
}