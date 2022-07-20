#include <stdio.h>
#include <unistd.h>

int main()
{
    unsigned char c;
    if (read(0, &c, 1) == 1)
	printf("%d\n", c);
    return(0);
}
