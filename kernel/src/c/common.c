#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "common.h"
#include "video.h"

extern const uint8_t log_colors[];

int strcmp(const char *str1, const char *str2) {
    while (*str1 && (*str1 == *str2)) {
        str1++;
        str2++;
    }
    return (unsigned char)*str1 - (unsigned char)*str2;
}

void sleep(int seconds) {
    int i, j;
    for (i = 0; i < seconds * 1000000; i++) {
        for (j = 0; j < 500; j++) {

        }
    }
}

int charpos;

void printchar(char c, uint8_t color) {
    uint8_t bg = 0x0;
    int i;
    if (c == '\n') {
        charpos += 80 - (charpos % 80);
        return;
    }
    else {
        video[charpos++] = ((bg << 4) | color) << 8 | c;
    }

}

void print(const char* str, uint8_t color) {
    while (*str != '\0') {
        printchar(*str, color);
        str++;
    }
}
