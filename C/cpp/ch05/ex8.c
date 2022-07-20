#include <stdio.h>

int main(void)
{
    long fir_operand, sec_operand;

    printf("This program computes moduli.\n");
    printf("Enter an integer to serve as the second operand: \n");
    scanf("%ld", &sec_operand);

    printf("Now enter the first operand: ");
    scanf("%ld", &fir_operand);

    while (fir_operand > 0)
    {
        printf("%ld %% %ld is %ld\n",
               fir_operand, sec_operand, fir_operand % sec_operand);
        printf("Enter next number for first operand (<= 0 to quit): ");
        scanf("%ld", &fir_operand);
    }
    printf("Done\n");

    return 0;
}