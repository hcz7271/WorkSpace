#include <stdio.h>

void find_two_largest(int a[], int n, int *largest, int *second_largest);

int main(void)
{
    int i, num, largest, secondLargest;

    printf("Enter the size of the array: ");
    scanf("%d", &num);

    int array[num];

    printf("Enter the numbers: ");
    for (i = 0; i < num; i++)
        scanf("%d", &array[i]);

    find_two_largest(array, num, &largest, &secondLargest);

    printf("Largest number: %d\n", largest);
    printf("Second largest number: %d\n", secondLargest);
}

void find_two_largest(int a[], int n, int *largest, int *second_largest)
{
    *largest = a[0];
    *second_largest = 0;

    int i;

    for (i = 1; i < n; i++)
    {
        if (a[i] > *largest)
            *largest = a[i];
        else if (a[i] > *second_largest)
            *second_largest = a[i];
    }
}