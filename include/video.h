#ifndef VIDEO_H
#define VIDEO_H

#include <stdint.h>

#define VGA_ADDR 0xB8000
extern volatile unsigned short* video;

typedef struct {
    uint8_t x;
    uint8_t y;
} cursor_pos_t;

cursor_pos_t set_cursor(void);

#endif
