#include <stdio.h>
#include <stdbool.h>

#define ARTICHOKE_PER_POUND 2.05
#define BEET_PER_POUND 1.15
#define CARROT_PER_POUND 1.09

#define BREAK1 5.0
#define BREAK2 20.0

#define COST1 6.5
#define COST2 14.0
#define COST3 0.5

#define DISCOUNT 0.95

void menu(void);
void print_the_cost_per_pound(void);
double calculate_shipping_charge(double);
double calculate_vege_cost(double, double);
double calculate_total_cost(double, double, double);
double calculate_total_charge(double, double);
bool have_discount(double);

int main(void)
{
    char choice;
    double pound_artichoke = 0.0, pound_beet = 0.0, pound_carrot = 0.0;
    double new_pound, total_pound;
    double vege_cost, total_cost, shipping_charge, total_charge;

    menu();

    while ((choice = getchar()) != 'q')
    {
        if (choice == '\n')
            continue;
        switch (choice)
        {
        case ('a'):
            printf("Please enter how many pounds do you want to add: ");
            scanf("%lf", &new_pound);
            pound_artichoke += new_pound;
            break;
        case ('b'):
            printf("Please enter how many pounds do you want to add: ");
            scanf("%lf", &new_pound);
            pound_beet += new_pound;
            break;
        case ('c'):
            printf("Please enter how many pounds do you want to add: ");
            scanf("%lf", &new_pound);
            pound_carrot += new_pound;
            break;
        default:
            printf("Please enter a valid input.\n");
            continue;
        }

        menu();
    }
    printf("Done!\n");

    total_pound = pound_artichoke + pound_beet + pound_carrot;
    vege_cost = calculate_vege_cost(pound_beet, pound_carrot);
    total_cost = calculate_total_cost(pound_artichoke, pound_beet, pound_carrot);
    shipping_charge = calculate_shipping_charge(total_pound);
    total_charge = calculate_total_charge(total_cost, shipping_charge);

    print_the_cost_per_pound();
    printf("the pounds orderd: %.2f\n", total_pound);
    printf("the cost for vegetables: %.2f\n", vege_cost);
    printf("the total cost of the order: %.2f\n", total_cost);
    printf("discount? %c\n", have_discount(total_cost) ? 'y' : 'n');
    printf("the shipping charge: %.2f\n", shipping_charge);
    printf("the total charge: %.2f\n", total_charge);

    return 0;
}

void menu(void)
{
    printf("Please order:\n");
    printf("a.artichoke\n"
           "b.bleet\n"
           "c.carrot\n"
           "q.Finished!\n");
}

void print_the_cost_per_pound(void)
{
    printf("antichoke per pound: %.2f\n"
           "beet per pound:%.2f\n"
           "carrot per pound:%.2f\n",
           ARTICHOKE_PER_POUND, BEET_PER_POUND, CARROT_PER_POUND);
}

bool have_discount(double cost)
{
    bool result = false;
    if (cost >= 100)
        result = true;
    else
        result = false;
    return result;
}

double calculate_shipping_charge(double pounds)
{
    double shipping_charge;

    if (pounds <= 5)
        shipping_charge = COST1;
    else if (pounds <= 20)
        shipping_charge = COST2;
    else
    {
        shipping_charge = COST2 + (pounds - 20) * COST3;
    }

    return shipping_charge;
}

double calculate_vege_cost(double pound_beet, double pound_carrot)
{
    double vege_cost;

    vege_cost = pound_beet * BEET_PER_POUND + pound_carrot * CARROT_PER_POUND;
    return vege_cost;
}

double calculate_total_cost(double pound_artichoke,
                            double pound_beet,
                            double pound_carrot)
{
    double total_cost;
    total_cost = pound_artichoke * ARTICHOKE_PER_POUND +
                 pound_beet * BEET_PER_POUND +
                 pound_carrot * CARROT_PER_POUND;
    return total_cost;
}

double calculate_total_charge(double total_cost, double shipping_charge)
{
    double total_charge;

    if (have_discount(total_cost))
        total_cost *= DISCOUNT;

    total_charge = total_cost + shipping_charge;
    return total_charge;
}