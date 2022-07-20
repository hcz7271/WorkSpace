#include <stdio.h>
#include <float.h>

int main(void)
{
    double nd = 1.0 / 3.0;
    float fd = 1.0 / 3.0;

    printf("double values:\n");
    printf("%.4lf %.12lf %.16lf\n", nd, nd, nd);
    printf("float values:\n");
    printf("%.4f %.12f %.16f\n", fd, fd, fd);

    printf("\n");

    printf("float precision = %d digits\n", FLT_DIG);
    printf("double precision = %d digits\n", DBL_DIG);

    return 0;
}