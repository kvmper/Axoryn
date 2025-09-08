#include "video.h"
#include "common.h"
#include <stdint.h>

volatile unsigned short* video = (unsigned short*)0xB8000;
