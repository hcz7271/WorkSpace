#include <stdio.h>

#define ROWS 3
#define COLS 5

void print_array(int (*array)[COLS]);
void double_array(int (*array)[COLS]);

int main(void)
{
    int array[ROWS][COLS] = {{2, 5, 6, 9, 1},
                             {23, 1, 5, 66, 54},
                             {9, 73, 23, 39, 2}};

    printf("The original array:\n");
    print_array(array);

    double_array(array);
    printf("The doubled array:\n");
    print_array(array);

    return 0;
}

void print_array(int array[ROWS][COLS])
{
    for (int i = 0; i < ROWS; i++)
    {
        for (int j = 0; j < COLS; j++)
            printf(" %5d", array[i][j]);
        printf("\n");
    }
}

void double_array(int (*array)[COLS])
{
    for (int i = 0; i < ROWS; i++)
    {
        for (int j = 0; j < COLS; j++)
            array[i][j] *= 2;
    }
}