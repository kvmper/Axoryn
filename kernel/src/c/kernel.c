#include "common.h"
#include "video.h"
#include <stdint.h>

void kernel_main() {
    print("Initialized: ", log_colors[LOG_OK]);
    print(__func__, WHITE);
}
