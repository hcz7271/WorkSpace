#include <stdio.h>

int main(int argc, char **argv)
{
    // 创建两个arrays
    int ages[] = {23, 43, 12, 89, 2};
    char *names[] = {"Alan", "Frank", "Mary", "John", "Lisa"};

    // 保险地获取ages的大小 safely get the size of ages
    int count = sizeof(ages) / sizeof(int);
    int i = 0;

    // 1st way using indexing
    for (i = 0; i < count; i++)
    {
        printf("%s has %d years alive.\n", names[i], ages[i]);
    }

    printf("---\n");

    // set up the pointers to the start of the arrays 初始化指针指向数组第一个元素
    int *cur_age = ages;
    char **cur_name = names;

    // 2nd way using pointers 指针运算
    for (i = 0; i < count; i++)
    {
        printf("%s is %d years old.\n", *(cur_name + i), *(cur_age + i));
    }

    printf("---\n");

    // 3rd way, pointers are just arrays 指针就是数组
    for (i = 0; i < count; i++)
    {
        printf("%s is %d years old again.\n", cur_name[i], cur_age[i]);
    }

    return 0;
}