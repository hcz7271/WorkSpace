#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#define MAX_DATA 512
#define MAX_ROWS 100

struct Address
{
    // 固定大小的结构体
    int id;
    int set;
    char name[MAX_DATA];
    char email[MAX_DATA];
};

struct Database
{
    // 由Address结构体组成的固定长度的数组
    struct Address rows[MAX_ROWS];
};

struct Connection
{
    // FILE结构体 存在于c语言标准库中
    FILE *file;
    // 存储在heap里使用指针的结构体
    struct Database *db;
};

void die(const char *message) // 中止并报错 在函数调用失败或者输入无效的时候中止程序
{
    if (errno) // 函数返回错误的时候， 通常会设置一个外部变量errno
    {
        perror(message); // perror 打印出错信息
    }
    else
    {
        printf("ERROR: %s\n", message);
    }

    exit(1);
}

void Address_print(struct Address *addr)
{
    printf("%d %s %s\n", addr->id, addr->name, addr->email);
}

void Database_load(struct Connection *conn)
{
    int rc = fread(conn->db, sizeof(struct Database), 1, conn->file);
    if (rc != 1)
        die("Failed to load database.");
}

struct Connection *Database_open(const char *filename, char mode)
// 函数*Database_open()返回一个Connection结构体 里面包含一个指向FILE和Database结构体的指针
{
    // malloc()向操作系统索取一大片 大小为Connection结构体的内存 并用指针*conn指向它
    struct Connection *conn = malloc(sizeof(struct Connection));

    if (!conn) // 在c语言中NULL就是0 等同于conn == NULL
        die("Memory error");

    conn->db = malloc(sizeof(struct Database));
    if (!conn->db)
        die("Memory error");

    if (mode == 'c')
    {
        conn->file = fopen(filename, "w");
    }
    else
    {
        conn->file = fopen(filename, "r+");

        if (conn->file)
        {
            Database_load(conn);
        }
    }

    if (!conn->file)
        die("Failed to open the file");

    return conn;
}

void Database_close(struct Connection *conn)
{
    if (conn)
    {
        if (conn->file)
            fclose(conn->file);
        if (conn->db)
            free(conn->db);
        free(conn);
    }
}

void Database_write(struct Connection *conn)
{
    rewind(conn->file);

    int rc = fwrite(conn->db, sizeof(struct Database), 1, conn->file);
    if (rc != 1)
        die("Failed to write database.");

    rc = fflush(conn->file);
    if (rc == -1)
        die("Cannot flush database.");
}

void Database_create(struct Connection *conn)
{
    int i = 0;

    for (i = 0; i < MAX_ROWS; i++)
    {
        // make a prototype to initialize it
        struct Address addr = {.id = i, .set = 0};
        // then just assign it
        conn->db->rows[i] = addr;
    }
}

void Database_set(struct Connection *conn, int id, const char *name,
                  const char *email)
{
    struct Address *addr = &conn->db->rows[id];
    if (addr->set)
        die("Already set, delete it first");

    addr->set = 1;
    // WARNING: bug, read the "How To Break It" and fix this
    char *res = strncpy(addr->name, name, MAX_DATA);
    // demonstrate the strncpy bug
    if (!res)
        die("Name copy failed");

    res = strncpy(addr->email, email, MAX_DATA);
    if (!res)
        die("Email copy failed");
}

void Database_get(struct Connection *conn, int id)
{
    struct Address *addr = &conn->db->rows[id];

    if (addr->set)
    {
        Address_print(addr);
    }
    else
    {
        die("ID is not set");
    }
}

void Database_delete(struct Connection *conn, int id)
{

    struct Address addr = {.id = id, .set = 0}; // 创建一个临时的本地Address 初始化id和set

    conn->db->rows[id] = addr; // 复制到输入结构体conn中的rows数组
}

void Database_list(struct Connection *conn)
{
    int i = 0;
    struct Database *db = conn->db;

    for (i = 0; i < MAX_ROWS; i++)
    {
        struct Address *cur = &db->rows[i];

        if (cur->set)
        {
            Address_print(cur);
        }
    }
}

int main(int argc, char *argv[])
{
    if (argc < 3) // 输入参数不正确
        die("USAGE: ex17 <dbfile> <action> [action params]");

    char *filename = argv[1];
    char action = argv[2][0];
    // 创建一个连接结构体
    struct Connection *conn = Database_open(filename, action);
    int id = 0;

    if (argc > 3)
        id = atoi(argv[3]); // atoi()把命令行得到的id从string转化成int
    if (id >= MAX_ROWS)
        die("There's not that many records.");

    switch (action)
    {
    case 'c':
        Database_create(conn);
        Database_write(conn);
        break;

    case 'g':
        if (argc != 4)
            die("Need an id to get");

        Database_get(conn, id);
        break;

    case 's':
        if (argc != 6)
            die("Need id, name, email to set");

        Database_set(conn, id, argv[4], argv[5]);
        Database_write(conn);
        break;

    case 'd':
        if (argc != 4)
            die("Need id to delete");

        Database_delete(conn, id);
        Database_write(conn);
        break;

    case 'l':
        Database_list(conn);
        break;
    default:
        die("Invalid action: c=create, g=get, s=set, d=del, l=list");
    }

    Database_close(conn);

    return 0;
}