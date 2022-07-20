#include "ex22.h"
#include "dbg.h"
#include <stdlib.h>

const char *MY_NAME = "Zed A. Shaw";

void scope_demo(int count)
{
    log_info("count is: %d", count);

    if (count > 10)
    {
        int count = 100; // BAD! BUGS!

        log_info("count in this scope is %d", count);
    }

    log_info("count is at exit: %d", count);

    count = 3000;

    log_info("count after assign: %d", count);

    scope_demo(count);
}

int main(int argc, char *argv[])
{
    struct State *state1 = malloc(sizeof(struct State));
    set_age(state1, 37);
    set_size(state1, 1000);

    log_info("My name: %s, age: %d", MY_NAME, get_age(state1));

    set_age(state1, 100);

    log_info("My age is now: %d", get_age(state1));

    // test out THE_SIZE extern
    log_info("THE_SIZE is: %d", get_size(state1));
    print_size();

    set_size(state1, 9);

    log_info("THE_SIZE is now: %d", get_size(state1));
    print_size();

    // test the ratio function static
    log_info("Ratio at first: %f", update_ratio(2.0));
    log_info("Ratio again: %f", update_ratio(10.0));
    log_info("Ratio once more: %f", update_ratio(300.0));

    // test the scope demo
    int count = 4;
    scope_demo(count); // 在另一个作用域里并不会修改count的值
    scope_demo(count * 20);

    log_info("count after calling scope_demo: %d", count);

    // how to break it

    return 0;
}