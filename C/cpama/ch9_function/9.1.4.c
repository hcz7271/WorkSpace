#include <stdio.h>

int day_of_year(int month, int day, int year);

int main(void)
{
    int month, day, year;

    printf("Enter the date month/day/year: ");
    scanf("%d/%d/%d", &month, &day, &year);

    printf("day: %d\n", day_of_year(month, day, year));

    return 0;
}

int day_of_year(int month, int day, int year)
{
    int num_days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    int day_count = 0, i;

    for (i = 1; i < month; i++)
        day_count += num_days[i - 1];

    /* adjust for leap years, assuming they are divisible by 4 */
    if (year % 4 == 0 && month > 2)
        day_count++;

    return day_count + day;
}