//
// Created by Chengzhu Huang on 2021/3/5.
//

#include <stdio.h>

int main(int argc, char *argv[])
{
    int distance = 100;

    int *p;

    p = &distance;

    printf("You are %d miles away.\npointer addr: %d", *p,p);

    return 0;
}