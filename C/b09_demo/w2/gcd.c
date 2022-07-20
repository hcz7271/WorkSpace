#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    extern int gcd(int x, int y);

    if (argc != 3) {
	fprintf(stderr, "usage: %s a b\n", argv[0]);
	return(1);
    }

    printf("%d\n", gcd(atoi(argv[1]), atoi(argv[2])));
    return(0);
}


int gcd(int x, int y)
{
    int t;

    while (y) {
	t = x;
	x = y;
	y = t % y;
    }
    return(x);
}
