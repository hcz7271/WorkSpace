#include <stdio.h>
#include "ex22.h"
#include "dbg.h"
#include <stdlib.h>

struct State *State_create()
{
    struct State *state = malloc(sizeof(struct State));

    state->the_size = 0;
    state->the_age = 0;

    return state;
}

int get_age(struct State *state)
{
    return state->the_age;
}

void set_age(struct State *state, int age)
{
    state->the_age = age;
}

int get_size(struct State *state)
{
    return state->the_size;
}

void set_size(struct State *state, int size)
{
    state->the_size = size;
}

double update_ratio(double new_ratio)
{
    static double ratio = 1.0;

    double old_ratio = ratio;
    ratio = new_ratio;

    return old_ratio;
}

void print_size(struct State *state)
{
    log_info("I think size is: %d", state->the_size);
}