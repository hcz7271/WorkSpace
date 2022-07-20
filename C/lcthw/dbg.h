#ifndef __dbg_h__ // 预防不小心包含两次头文件
#define __dbg_h__

#include <stdio.h> // 引入需要的函数头文件
#include <errno.h>
#include <string.h>

#ifdef NDEBUG         // 如果有定义not debug
#define debug(M, ...) // 如果在NDEBUG定义好的情况下编译, "no debug"消息会保留
#else
#define debug(M, ...) fprintf(stderr, "DEBUG %s:%d: " M "\n", \
                              __FILE__, __LINE__, ##__VA_ARGS__)

#endif

#define clean_errno() (errno == 0 ? "None" : strerror(errno)) // 获取安全可读的errno版本

// 记录给终端用户看的信息, 无法被编译
#define log_err(M, ...) fprintf(stderr,                               \
                                "[ERROR] (%s:%d: errno: %s) " M "\n", \
                                __FILE__, __LINE__, clean_errno(), ##__VA_ARGS__)

#define log_warn(M, ...) fprintf(stderr,                             \
                                 "[WARN] (%s:%d: errno: %s)" M "\n", \
                                 __FILE__, __LINE__, clean_errno(), ##__VA_ARGS__)

#define log_info(M, ...) fprintf(stderr,                   \
                                 "[INFO] (%s:%d) " M "\n", \
                                 __FILE__, __LINE__, ##__VA_ARGS__)

#define check(A, M, ...)           \
    if (!(A))                      \
    {                              \
        log_err(M, ##__VA_ARGS__); \
        errno = 0;                 \
        goto error;                \
    }

#define sentinel(M, ...)           \
    {                              \
        log_err(M, ##__VA_ARGS__); \
        errno = 0;                 \
        goto error;                \
    }

#define check_mem(A) check((A), "Out of memory.")

#define check_debug(A, M, ...)   \
    if (!(A))                    \
    {                            \
        debug(M, ##__VA_ARGS__); \
        errno = 0;               \
        goto error;              \
    }

#endif