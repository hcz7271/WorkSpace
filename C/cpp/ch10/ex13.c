#include <stdio.h>
#define ROWS 3
#define COLS 5

void taskA(double (*array)[COLS]);
double taskB(double array[COLS]);
double taskC(double (*array)[COLS]);
double taskD(double (*array)[COLS]);
void taskE(double (*array)[COLS]);

int main(void)
{
    double data[ROWS][COLS];
    taskA(data);
    taskE(data);
    return 0;
}

// store the information in a 3x5 array
void taskA(double (*array)[COLS])
{
    for (int i = 0; i < ROWS; i++) // initialize array
    {
        printf("Enter set of %d doubles: ", COLS);
        for (int j = 0; j < COLS; j++)
            scanf("%lf", array[i] + j);
    }
}

// compute the average of each set of five values
double taskB(double array[COLS])
{
    double result, total = 0.0;

    for (int i = 0; i < COLS; i++)
        total += array[i];

    result = total / COLS;
    return result;
}

// compute the average of all the values
double taskC(double (*array)[COLS])
{
    double result, total = 0.0;

    for (int i = 0; i < ROWS; i++)
    {
        for (int j = 0; j < COLS; j++)
            total += array[i][j];
    }

    result = total / (ROWS * COLS);
    return result;
}

// determine the largest value of the 15 values
double taskD(double (*array)[COLS])
{
    double largest = 0;

    for (int i = 0; i < ROWS; i++)
    {
        for (int j = 0; j < COLS; j++)
            largest = (array[i][j] > largest) ? array[i][j] : largest;
    }
    return largest;
}

// report the results
void taskE(double (*array)[COLS])
{
    printf("The average of each set of %d values:\n", ROWS);
    for (int i = 0; i < ROWS; i++)
    {
        printf("\trow %d: %.3f\n", i + 1, taskB(array[i]));
    }

    printf("The average of all the values:\n");
    printf("\t%.3f\n", taskC(array));

    printf("The largest value of the %d values:\n", ROWS * COLS);
    printf("\t%.3f\n", taskD(array));
}