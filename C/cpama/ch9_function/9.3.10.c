#include <stdio.h>

int largest(int a[], int n);
int average(int a[], int n);
int num_positive(int a[], int n);

int main(void)
{
    int i, n;

    printf("What is the size of the list: ");
    scanf("%d", &n);

    int a[n];

    printf("Enter %d numbers: ", n);
    for (i = 0; i < n; i++)
        scanf("%d", &a[i]);

    printf("The largest number is: %d\n", largest(a, n));
    printf("The average number is: %d\n", average(a, n));
    printf("The number of positive numbers is: %d\n", num_positive(a, n));
    return 0;
}

int largest(int a[], int n)
{
    int i, max = a[0];

    for (i = 1; i < n; i++)
        if (a[i] > max)
            max = a[i];

    return max;
}

int average(int a[], int n)
{
    int i, avg = 0;

    for (i = 0; i < n; i++)
        avg += a[i];

    return avg / n;
}

int num_positive(int a[], int n)
{
    int i, count = 0;

    for (i = 0; i < n; i++)
        if (a[i] > 0)
            count++;

    return count;
}