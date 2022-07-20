#ifndef _ex22_h
#define _ex22_h

struct State
{
    int the_size;
    int the_age;
};

// makes THE_SIZE in ex22.c available to other .c files
int get_size(struct State *state);
void set_size(struct State *state, int size);

// gets and sets an internal static variable in ex22.c
int get_age(struct State *state);
void set_age(struct State *state, int age);

// updates a static variable that's inside update_ratio
double update_ratio(double ratio);
void print_size();

#endif