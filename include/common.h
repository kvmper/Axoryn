#ifndef COMMON_H // required by kernel.c and many other files
#define COMMON_H

#include <stdint.h>

#define GREEN 0x2
#define YELLOW 0xE
#define RED 0x4

int strcmp(const char *str1, const char *str2);
void sleep(int seconds);
void printchar(const char* str, uint8_t color);
void print(const char* str, uint8_t color);

// logs

typedef enum {
    ERR_OK = 0,
    ERR_FAIL = 1,
    ERR_UNKNOWN = -1
} error_codes_t;

typedef enum {
    LOG_OK,
    LOG_WARN,
    LOG_ERR
} log_t;

static const uint8_t log_colors[] = {
    [LOG_OK] = GREEN,
    [LOG_WARN] = YELLOW,
    [LOG_ERR] = RED
};

#endif
