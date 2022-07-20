#include <stdio.h>
#include <ctype.h>

int get_first(void);
char get_choice(void); //验证用户输入合法性
float get_num(void);   //验证用户输入浮点数的合法性

int main(void)
{
    char choice;
    float fir_num, sec_num;
    int count = 0;

    while ((choice = get_choice()) != 'q')
    {
        printf("Enter first number: ");
        fir_num = get_num();
        printf("Enter second number: ");
        sec_num = get_num();

        while ((choice == 'd') && sec_num == 0)
        {
            printf("Enter a number other than 0: ");
            sec_num = get_num();
        }

        switch (choice)
        {
        case 'a':
            printf("%.1f + %.1f = %.1f\n", fir_num, sec_num, fir_num + sec_num);
            break;
        case 's':
            printf("%.1f - %.1f = %.1f\n", fir_num, sec_num, fir_num - sec_num);
            break;
        case 'm':
            printf("%.1f * %.1f = %.1f\n", fir_num, sec_num, fir_num * sec_num);
            break;
        case 'd':
            printf("%.1f / %.1f = %.1f\n", fir_num, sec_num, fir_num / sec_num);
            break;
        default:
            printf("I do not recornlize that, please try again: ");
        }
    }
    printf("Bye!");

    return 0;
}

char get_choice(void)
{
    char result;

    printf("Enter the operation of your choice:\n");
    printf("a. add              s.subtract\n");
    printf("m. multiply         d. divide\n");
    printf("q. quit\n");

    // 如何拒绝输入abc
    // 只接受a,s,m,d,q
    result = get_first();
    return result;
}

float get_num(void)
{
    float input;
    char ch;

    while ((scanf("%f", &input)) != 1)
    {
        while ((ch = getchar()) != '\n')
            putchar(ch);
        printf(" is not a number.\n");
        printf("Please enter a number, such as 2.5, -1.78E8, or 3: ");
    }
    return input;
}

int get_first(void)
{
    // return first non-whitespace character
    int ch;

    do
        ch = getchar();
    while (isspace(ch));

    while (getchar() != '\n')
        ;

    return ch;
}