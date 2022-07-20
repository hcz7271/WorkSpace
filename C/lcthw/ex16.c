#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>

struct Person
{
    char *name;
    int age;
    int height;
    int weight;
};

struct Person Person_create(char *name, int age, int height, int weight)
{
    // 让操作系统分配一块原始内存
    // struct Person *who = malloc(sizeof(struct Person));

    struct Person who;

    // who->name = strdup(name);
    // who->age = age;
    // who->height = height;
    // who->weight = weight;

    who.name = name;
    who.age = age;
    who.height = height;
    who.weight = weight;

    return who;
}

// in Heap
// void Person_destroy(struct Person *who)
// {
//     assert(who != NULL);

//     free(who->name); //释放由strdup获取的内存
//     free(who);
// }

void Person_print(struct Person who)
{
    printf("Name: %s\n", who.name);
    printf("\tAge: %d\n", who.age);
    printf("\tHeight: %d\n", who.height);
    printf("\tWeight: %d\n", who.weight);
}

int main(int argc, char **argv)
{
    // make two people structures
    struct Person joe = Person_create("Joe Alex", 32, 64, 140);

    struct Person frank = Person_create("Frank Blank", 20, 72, 180);

    // print them out and where they are in memory
    printf("Joe is at memory location %p:\n", &joe);
    Person_print(joe);
    printf("location of attributes of joe:\n");
    printf("%p %p %p %p\n", &joe.name, &joe.age, &joe.height, &joe.weight);

    printf("Frank is at memory location %p:\n", &frank);
    Person_print(frank);

    // make everyone age 20 years and print them again
    joe.age += 20;
    joe.height -= 2;
    joe.weight += 40;
    Person_print(joe);

    frank.age += 20;
    frank.weight += 20;
    Person_print(frank);

    // destroy them both so we clean up
    // Person_destroy(joe);
    // Person_destroy(frank);

    return 0;
}